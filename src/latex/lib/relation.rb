$: << File.dirname(__FILE__)

require 'extensions'
require 'markdown_parser'
  
module Relation
  @@connections = {}
  include MarkDownParser
  
  def self.clear
  end
  
  def self.create_association(owner, r)
    return nil if r.name == 'memberEnd' or r.name == 'classifier'

    case r['xmi:type']
    when 'uml:Generalization'
      Generalization.new(owner, r)
      
    when 'uml:Realization'
      Realization.new(owner, r)
      
    when 'uml:Dependency'
      Dependency.new(owner, r)
      
    when 'uml:Property'
      if r['association']
        Association.new(owner, r)
      else
        Attribute.new(owner, r)
      end
      
    when 'uml:Association', 'uml:Link'
      Association.new(owner, r)
      
    when 'uml:Constraint'
      Constraint.new(owner, r)
      
    when 'uml:Slot'
      Slot.new(owner, r)
      
    when 'uml:Comment'
      nil
      
    else
      $logger.error "!! Unknown relation type: #{r.name} :: #{r['xmi:id']} - #{r['xmi:type']} for #{owner.name}"
      nil
    end
  end

  class Constraint
    include Extensions
    
    attr_reader :owner, :name, :specification, :documentation
                
    def initialize(owner, r)
      @name = r['name']
      @specification = r['specification']
    end
  end

  class Relation
    include Extensions
    
    attr_reader :id, :name, :type, :xmi, :multiplicity, 
                :source, :target, :owner, :stereotype, :visibility, :association_name,
                :constraints, :invariants, :assoc, :redefinesProperty, :default, :association_doc
    attr_accessor :documentation

    class Connection
      attr_accessor :name, :type, :type_id, :multiplicity
      
      def initialize(name, type)
        @multiplicity = nil
        @name = name
        @type = type
      end

      def resolve_type
        if @type.resolved?
          @type_id = @type.id
          true
        else
          false
        end
      end
    end
    
    def initialize(owner, r)
      @owner = owner
      @id = r['xmi:id']
      @name = r['name']
      @type = r['xmi:type']
      @xmi = r
      @constraints = {}
      @invariants = {}
       
      @multiplicity, @optional = get_multiplicity(r)
      @assoc = r['association']
	  @visibility = r['visibility'] ? r['visibility'] : 'public'

      @stereotype = xmi_stereotype(r)
      @documentation = xmi_documentation(r)

      $logger.debug "       -- :: Creating Relation <<#{@stereotype}>> #{@name} #{@id} #{@assoc}" 
      
      @source = Connection.new('Source', owner)
      @source.multiplicity = @multiplicity
      @target = nil
    end

    def value
      nil
    end

    def final_target
      @target
    end

    def is_optional?
      @optional
    end
    
    def is_attribute?
      @stereotype and @stereotype =~ /Attribute/
    end

    def is_property?
      false
    end

    def is_reference?
      false
    end

    def is_derived?
      false
    end

    def resolve_types
      if @target.nil?
        $logger.error "    !!!! cannot resolve type for #{@owner.name}::#{@name} no target"
      else
        unless @target.resolve_type or @target.type.internal?
          raise "    !!!! cannot resolve target for #{@owner.name}::#{@name} #{self.class.name}"
        end
      end

      unless @source.resolve_type
        raise "    !!!! cannot resolve source for #{@owner.name}::#{@name} #{self.class.name}"
      end
    end

    def is_array?
      @multiplicity =~ /\.\.\*/
    end
    
    def is_optional?
      @optional
    end

    def get_value(a, ele)
      v = a.at("./#{ele}")
      if v
        if v['xmi:type'] == 'uml:LiteralBoolean'
          return v['value'] || 'false'
        else
		  b = v.at(".//body")
          if b
			return b.text
		  elsif v['value']
		    return v['value']
		  end
        end
		if v['instance']
		  return a.document.root.at("//*[@xmi:id='#{v['instance']}']")['name']
		end
      end
    end
  end
  
  class Association < Relation
    attr_reader :final_target, :association, :assoc_type
    
    class End < Connection
      include Extensions
      
      attr_accessor :name, :optional, :navigable, :xmi
      
      def initialize(e, type)
        super(e['name'], type)

        @multiplicity, @optional = get_multiplicity(e)
        @navigable = false
        @xmi = e
      end

      def is_navigable?
        @navigable
      end
      
      def is_optional?
        @optional
      end
    end
    
    def initialize(owner, r)
      super(owner, r)

      tid = r['type']
      @final_target = @target = End.new(r, Type::LazyPointer.new(tid))
      
      aid = r['association']
      assoc = r.document.at("//packagedElement[@xmi:id='#{aid}']")
	  
	  @association_name = assoc['name']
	  
	  member_end = assoc.at('./memberEnd')  
	  if member_end
		target_end = r.document.at("//ownedAttribute[@xmi:id='#{member_end["xmi:idref"]}']")
		if target_end
			target_element = r.document.at("//packagedElement[@xmi:id='#{target_end["type"]}']")
			if target_element['name'] == @association_name and target_element.at('./ownedComment')
				@association_doc = format_markdown(target_element.at('./ownedComment')['body'])
			end
		end
	  end
	  
	  @association_doc = xmi_documentation(assoc) if xmi_documentation(assoc).size>1
	  
      src = assoc.at('./ownedEnd')
	  return if not src
      @assoc_type = assoc['type']
      @source = End.new(src, owner)
      @is_derived = assoc['isDerived']

      if @assoc_type == 'uml:AssociationClass'
        @target = End.new(r, Type::LazyPointer.new(aid))
        # Always a folder
        @stereotype = "Organizes"
      end

      @name = @target.name || @name || @source.name
      @multiplicity = @target.multiplicity
      @optional = @target.optional

      assoc.xpath('./ownedRule[@type="uml:Constraint"]').each do |c|
        name = c['name']
        spec = c.at('./specification')
        props =  @association.at("./constraints/constraint[@name='#{name}']")
        if props['type'] == 'Invariant'
          (@invariants ||= {})[name] = spec['body'] if spec
        else
          (@constraints ||= {})[name] = spec['body'] if spec
        end
      end
    end

    def final_target
      @final_target
    end

    def is_reference?
      true
    end

    def is_derived?
      @is_derived
    end
    
    def link_target(reference, type)
      @target = Connection.new(reference, type)
    end

    def resolve_types
      super

      if !@target.equal?(@final_target)
        unless @final_target.resolve_type or @final_target.type_id =~ /^EA/
          raise "    !!!! cannot resolve target for #{@owner.name}::#{@name} #{self.class.name}"
        end
      end
      
    end
  end

  class Attribute < Relation
    
    def initialize(owner, a)
      super(owner, a)
      return if not a['name']
	  
	  @name = a['name']
      @default = get_value(a, 'defaultValue')

	  @redefinesProperty = a.at('./redefinedProperty') ? true : false
	  
      @stereotype = xmi_stereotype(a)
      @documentation = xmi_documentation(a)

      $logger.debug "  Searching for docs for #{owner.name}::#{name}"

      type = a['type']
      @target = Connection.new('type', Type::LazyPointer.new(type))

    rescue
      $logger.error "Error creating relation: #{a.to_s}"
      raise
    end

    def value
      @default
    end
    
    def is_property?
      true
    end

    def is_reference?
      !is_attribute?
    end    

  end

  class Dependency < Relation
    def initialize(owner, r)
      unless owner
        cli = r.at("./client")
        cid = cli['xmi:idref']

        owner = Type::LazyPointer.new(cid)
      end
      
      super(owner, r)
      
      sup = r.at("./supplier")
      sid = sup['xmi:idref']

      @target = Connection.new('Target', Type::LazyPointer.new(sid))
    end

    def reflow(source, target)
      $logger.debug " --- Reflowing Dependency: #{source.id} -> #{target.id}"
      @source = Connection.new('Source', source)
      @target = Connection.new('Target', target)
    end
  end

  class Generalization < Relation
    def initialize(owner, r)
      super(owner, r)
      
      @target = Connection.new('Target', Type::LazyPointer.new(r['general']))
      @name = 'Supertype' unless @name
    end

    def resolve_types
      super
    end

  end
  
  class Realization < Dependency
    def initialize(owner, r)
      super(owner, r)
    end

  end

  class Slot < Relation
    def initialize(owner, a)
      super(owner, a)
      @target_id = a['definingFeature']
      @target = @relation = nil
      @value = get_value(a, 'value')
    end

    def value
      @value
    end

    def is_array?
      @value and @value[0] == '['
    end

    def is_property?
      true
    end

    def resolve_types
      unless @relation
        @relation = owner.classifier.relation_by_id(@target_id)        
        raise " -- Relation not resolved for #{@target_id}" unless @relation
        
        @name = @relation.name
        @target = @relation.target
      end
      
    rescue
      $logger.error "Cannot resolve type #{@owner.name}::#{@name} #{@xmi.to_s}"
      $logger.error $!
      raise
    end
  end
end