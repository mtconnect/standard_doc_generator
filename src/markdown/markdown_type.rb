require 'set'
require 'documents'
require 'lib/type'
require 'lib/diagrams'

class MarkdownType < Type

  attr_accessor :type_relations

  include Diagram
  include Document

  def generate_md(f = STDOUT, parent='')
    $logger.info "--- Generating #{section_heading}"
    return if @name =~ /Factory/ || @stereotype =~ /metaclass/ || @visibility != 'public'
    if @is_subtype
      # documentation structure for subtypes are different.
      if !model_has_observation_types?
        if (@model.name == "Component Types" &&
          parent.name != @relations[0].final_target.type.name)
          generate_section_name_with_heading_level(f,3)
        else
          generate_section_name_with_heading_level(f,2)
        end
        generate_documentation(f)
        generate_types(f)
      end
    else
      generate_section_name_with_heading_level(f,1)
      generate_documentation(f)
      generate_types(f)
    end
  end

  def generate_types(f)
    $logger.debug "Generating docs for #{@name}"
    @type_relations = get_type_relations()
    return if @type_relations.empty?

    observes_relations = @type_relations.select {|a| a.stereotype == "observes"}
    value_property_relations = @type_relations.select {|a| a.property_stereotype == "ValueProperty" || (a.name == "result" && a.final_target.type.name.end_with?("Result"))}
    reference_property_relations = @type_relations.select {|a| a.property_stereotype == "ReferenceProperty"}
    part_property_relations = (@type_relations-value_property_relations-observes_relations).select {|a| a.property_stereotype == "PartProperty"}
    operation_relations = @type_relations.select {|a| a.type == "uml:Operation"}

    generate_value_property_doc(f, value_property_relations) unless value_property_relations.empty?
    generate_associated_elements_doc(f, reference_property_relations, "Reference") unless reference_property_relations.empty?
    generate_associated_elements_doc(f, part_property_relations, "Part") unless part_property_relations.empty?
    generate_observed_dataitems_doc(f, observes_relations) unless observes_relations.empty?
    generate_operations_doc(f, operation_relations) unless operation_relations.empty?
    generate_subtype_docs_for_observation_type(f) if observation_type_has_subtypes?
  end

  def generate_operations_doc(f, operations)
    f.puts "\n#{section_heading_level_to_s(2)} Operations for #{@name}\n"
    operations.each do |op|
      f.puts "\n* `#{op.name}`\n\n    #{op.documentation.gsub("\n","\n    ")}\n"
      if op.parameters
        f.puts "\n    The parameters for {{property(#{@name})}} are:\n"
        op.parameters.each do |p|
          f.puts "\n    * `#{p[0]}`\n\n        #{p[1].gsub("\n","\n        ")}\n"
        end
      end
    end
  end

  def generate_subtype_docs_for_observation_type(f)
    f.puts "\n#{section_heading_level_to_s(2)} Subtypes of #{@name}\n"
    @subtypes.each do |subtype|
      if defined?(subtype.relation("subType").default)
        f.puts "\n* `#{subtype.relation("subType").default}`\n"
        subtype.generate_documentation(f, 1)
        subtype.relations.each do |r|
          name = r.association_name ? r.association_name : r.name
          if r.redefinesProperty && name == "result"
            generate_valuetype_documentation(f, r, 1)
            target = r.final_target.type
            target.generate_enumerations(f, 1) unless target.enum_already_documented?
          end
        end
      end
    end
  end

  def generate_observed_dataitems_doc(f, relations)
    tbl_rows = []   
    relations.each do |r|
      target = r.final_target.type
      tbl_rows.append(["#{stereotype_to_s(target)}{{block(#{target.name})}}", "#{r.multiplicity}"])
    end
    
    element_heading = get_element_heading("", "Observes")
    element_heading_wo_cmd = get_element_heading("", "Observes", true)
    f.puts "\n#{section_heading_level_to_s(2)} #{element_heading_wo_cmd}\n"
    f.puts "\n{{tbl(#{get_label_from_caption(element_heading_wo_cmd)})}} lists the #{element_heading}.\n\n"

    generate_table(fs = f,
      columns = ["Commonly Observed DataItem Types", "Multiplicity"],
      justification = [":-",":-:"],
      rows = tbl_rows,
      caption = element_heading_wo_cmd
    )
  end

  def generate_value_property_doc(f, relations)
    tbl_rows = []
    relations.each do |r|
      name = r.association_name ? r.association_name : r.name
      target = r.final_target.type
      case name
      when "result"
        if r.redefinesProperty && model_has_mtconnect_supertype?
          generate_valuetype_documentation(f,r)
          target.generate_enumerations(f) if target.type == "uml:Enumeration"
          target.generate_entrykeys(f) if target.type == "uml:Class"
        end
        next
      when "units", "subType", "code"
        generate_valuetype_documentation(f,r)
        next if r.redefinesProperty || r.default
      when "value"
        generate_valuetype_documentation(f,r)
        target.generate_enumerations(f) if target.type == "uml:Enumeration"
        next
      end
      if r.name == "type" && r.redefinesProperty
        if @model.name == "DataItem Types" # Condition to generate dataitem types for Device Information Model
          tbl_rows.append(["#{stereotype_to_s(r)}{{property(#{name})}}", "`#{target.name}`", "#{r.multiplicity}"])
        end
      elsif r.redefinesProperty && r.default
        tbl_rows.append(["#{stereotype_to_s(r)}{{property(#{name})}}", "`#{r.default}`", "#{r.multiplicity}"])
      else
        tbl_rows.append(["#{stereotype_to_s(r)}{{property(#{name})}}", "`#{target.name}`", "#{r.multiplicity}"])
      end
    end

    unless tbl_rows.empty?
      f.puts "\n#{section_heading_level_to_s(2)} Value Properties of #{@name}\n"   
      f.puts "\n{{tbl(#{get_label_from_caption("Value Properties of #{@name}")})}} lists the Value Properties of {{block(#{@name})}}.\n\n"

      generate_table(fs = f,
          columns = ["Value Property name", "Value Property type", "Multiplicity"],
          justification = ["-","-",":-:"],
          rows = tbl_rows,
          caption = "Value Properties of #{@name}"
        )
      generate_descriptions_for_properties(f, relations, "Value")
    end
  end

  def generate_associated_elements_doc(f, relations, property_stereotype)
    tbl_rows = []   
    relations.each do |r|
      name = r.association_name ? r.association_name : r.name
      target = r.final_target.type
      if r.association_name && target.name != name
        tbl_rows.append(["#{stereotype_to_s(target)}{{block(#{target.name})}} (organized by #{stereotype_to_s(r)}`#{name}`)", "#{r.multiplicity}"])
      elsif !r.association_name && target.name != name
        tbl_rows.append(["#{stereotype_to_s(r)}{{block(#{name})}}", "#{r.multiplicity}"])
      else
        tbl_rows.append(["#{stereotype_to_s(r)}{{block(#{target.name})}}", "#{r.multiplicity}"])
      end
    end
    
    element_heading = get_element_heading(property_stereotype, "Property")
    element_heading_wo_cmd = get_element_heading(property_stereotype, "Property", true)
    f.puts "\n#{section_heading_level_to_s(2)} #{element_heading_wo_cmd}\n"
    f.puts "\n{{tbl(#{get_label_from_caption(element_heading_wo_cmd)})}} lists the #{element_heading}.\n\n"

    generate_table(fs = f,
      columns = ["#{property_stereotype} Property name", "Multiplicity"],
      justification = [":-",":-:"],
      rows = tbl_rows,
      caption = element_heading_wo_cmd
    )
    generate_descriptions_for_properties(f, relations, property_stereotype)
  end

  def generate_descriptions_for_properties(f, relations, property_stereotype)
    return unless !(relations.select{|a| !(a.name=="result" && a.redefinesProperty && a.final_target.type.type!='uml:Class')}.empty?)
    f.puts "\nDescriptions for #{property_stereotype} Properties of {{block(#{@name})}}:\n"
    relations.each do |r|
      name_command = property_stereotype == "Value" ? "property" : "block"
      target = r.final_target.type
      name = target.type == "uml:Class" ? target.name : (r.association_name ? r.association_name : r.name)
      if name == "value"
        next
      elsif ((r.association_doc || r.documentation || r.target.type.type == "uml:Enumeration") &&
          (!r.redefinesProperty || target.type == 'uml:Class'))
        documentation = r.association_doc ? r.association_doc : r.documentation
        if name_command == "property"
          f.puts "\n* #{stereotype_to_s(r)}{{#{name_command}(#{name})}} \n"
          f.puts "\n    #{documentation.gsub("\n","\n    ")}\n"
        elsif name_command == "block"
          f.puts "\n* #{stereotype_to_s(target)}{{#{name_command}(#{name})}} \n"
          f.puts "\n    #{target.documentation.gsub("\n","\n    ")}\n"
          f.puts "\n    #{r.association_doc.gsub("\n","\n    ")}\n" if r.association_doc && !r.association_doc.empty? && r.stereotype != "organizer"
        end
        if !r.association_name && target.name != name && r.target.type.type != 'uml:Enumeration' && name_command == "block"
          f.puts "\n    The value of {{#{name_command}(#{name})}} **MUST** be a `#{target.name}`.\n"
        end
        if (r.target.type.type == "uml:Enumeration" && !r.redefinesProperty && !stereotype_name.include?("deprecated") &&
           !(r.stereotype && r.stereotype.include?('deprecated')))
          generate_valuetype_documentation(f, r, 1, name) if name_command == "property"
          r.target.type.generate_enumerations(f, 1) unless target.enum_already_documented?
        end
      elsif name == "type" && @model.name == "DataItem Types"
          f.puts "\n* {{property(type)}} \n"
          target.update_dataitemtypes_doc()
          target.generate_enumerations(f, 1)
      end
    end
  end

  def generate_enumerations(f, num_of_tabs = 0)
    $logger.debug "***** =====> Generating Enumerations for #{@name}"
    tab = "    " * num_of_tabs
    stereotype = @stereotype.empty? ? "" : "`<<#{@stereotype}>>` "
    f.puts "\n#{tab}#{stereotype}`#{escape_name}` Enumeration:\n"
    @literals.sort_by! { |t| t.name }
    @literals.each do |lit|
      if type_has_subtypes?(lit)
        subtypes_to_str = @model.generator.dataitemtypes[lit.name]["subTypes"].join(", ")
        subtypes_to_str = "\n\n#{tab}    Subtypes of `#{lit.name}` : #{subtypes_to_str}."
      end
      f.puts "\n#{tab}* #{stereotype_to_s(lit)}`#{lit.name}` \n\n    #{tab}#{lit.description.gsub("\n","\n    #{tab}")}#{subtypes_to_str}\n"
    end
    add_enumeration_to_enum()
    @model.generator.enums << @name
  end

  def add_enumeration_to_enum
    @model.generator.enum[@name] = Hash.new
    @literals.each do |lit|
      @model.generator.enum[@name][lit.name] = Hash.new
      @model.generator.enum[@name][lit.name]["name"] = lit.name
      @model.generator.enum[@name][lit.name]["documentation"] = lit.description
    end
  end

  def enum_already_documented?
    return (@type == "uml:Enumeration" &&
    @model.generator.enums.include?(@name))
  end
  
  def generate_entrykeys(f)
    $logger.debug "***** =====> Generating Keys for #{@name}"
    f.puts "\n`#{escape_name}` keys:\n"

    @relations.each do |r|
      next if r.name == 'Supertype'
      f.puts "\n* `#{r.name}` \n\n    #{r.documentation.gsub("\n","\n    ")}\n"
      generate_valuetype_documentation(f,r,1,r.name)
      target = r.final_target.type
      target.generate_enumerations(f,1) if target.type == "uml:Enumeration" && !r.redefinesProperty
    end
  end

  def generate_glossary_docs(f, glossary_type) 
    plural = @name.end_with?('y') ? @name[0...-1]+"ies" : (@name.end_with?('s') ? @name : @name+"s" )
    f.puts <<-EOT
{{newglossaryentry(#{@name})
{
    type={#{glossary_type}},
    name={#{@name}},
    description={#{@documentation}},
    plural={#{plural}}
}}}

EOT
  end
  
  def generate_profile_docs(f)
    return if @visibility != 'public'
    generate_section_name_with_heading_level(f,1)
    generate_documentation(f)
  end
  
  def model_has_mtconnect_supertype?
    return (!@relations.empty? && 
        @relations[0].name == "Supertype" &&
        @relations[0].final_target.type.name &&
        (@model.name.split(" ")[0] == @relations[0].final_target.type.name ||
        ["Event","Sample","Condition"].include?(@relations[0].final_target.type.name)))
  end

  def model_has_observation_types?
    return (@model.name.include?("Sample") || 
      @model.name.include?("Event") ||
      @model.name.include?("Condition") || 
      @model.name.include?("Interface"))
  end

  def observation_type_has_subtypes?
    return (model_has_observation_types? &&
      @subtypes.length > 0)
  end

  def type_has_subtypes?(type)
    return (@model.generator.dataitemtypes.has_key?(type.name) &&
      @model.generator.dataitemtypes[type.name].has_key?('subTypes') &&
      !@model.generator.dataitemtypes[type.name]['subTypes'].empty? &&
      @model.name == 'DataItem Types')
  end

  def update_dataitemtypes_doc
    @literals.each do |lit|
      if @model.generator.dataitemtypes.has_key?(lit.name) && lit.description
        @model.generator.dataitemtypes[lit.name]['documentation'] = lit.description
      end
    end
  end

  def get_element_heading(element_stereotype, element_type, remove_cmd = false)
    name = remove_cmd ? @name : "{{block(#{@name})}}"
    case element_type
    when 'Property'
      "#{element_stereotype} Properties of #{name}"
    when 'Operation'
      "Operations for #{name}"
    when 'Observes'
      "Commonly Observed DataItem Types for #{name}"
    else
      #to be updated
      element_type_plural = /[[y]]/.match(element_type[-1]) ? " #{element_type[0..-2]}ies" : " #{element_type}s"
      "#{element_stereotype}#{element_type} of #{name}"
    end
  end

  def get_type_relations
    return @relations.select do |r|
      $logger.debug "  Looking for docs for #{r.target.inspect}" if r.target && r.target.type.nil?
      (r.type != "uml:Constraint" &&
      (r.documentation ||
        r.target.type.type == "uml:Enumeration" ||
        !r.documentation
      ) &&
      defined?(r.final_target.type) &&
      @model.name.split("Type")[0] != r.final_target.type.name &&
      r.visibility == "public" &&
      r.name != "Supertype") || r.type == 'uml:Operation'
    end
  end
end