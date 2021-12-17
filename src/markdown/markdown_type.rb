require 'set'
require 'documents'
require 'lib/type'
require 'lib/diagrams'

class MarkdownType < Type
  include Diagram
  include Document

  ROW_FORMAT = %s{format-1="p 0.85in" format-2="p 0.8in" format-3="p 1.3in" format-4="p 1.3in" format-5="p 0.85in" format-6="p 0.5in"}

  def generate_property_doc(f)
    if not relations.empty? and relations[0].name == 'Supertype' and @model.name and relations[0].final_target.type.name
        if @model.name.split(' ')[0] == relations[0].final_target.type.name or relations[0].final_target.type.name == "Event"
	      generate_types(f) 
          return
		end
    end
	
	$logger.info "Generating docs for #{@name}"
    relations_with_documentation =
      @relations.select do |r|
      $logger.debug "  Looking for docs for #{r.target.inspect}" if r.target and r.target.type.nil?
      r.type!= 'uml:Constraint' and 
	  (r.documentation or r.target.type.type == 'uml:Enumeration' or not r.documentation) and 
	  (r.final_target and @model.name.split('Type')[0] != r.final_target.type.name) and r.visibility == 'public'
    end
	
	value_properties = relations_with_documentation.select do |a| 
		(a.property_stereotype == '' or a.property_stereotype == 'ValueProperty') and
		a.name != 'Supertype'
	end

	reference_properties = relations_with_documentation.select do |a| 
		a.property_stereotype == 'ReferenceProperty'
	end
	
	part_properties = relations_with_documentation.select do |a| 
		a.property_stereotype == 'PartProperty'
	end
	
	unless relations_with_documentation.empty? or (relations_with_documentation[0].name == 'Supertype' and relations_with_documentation.length == 1)
		generate_value_property_doc(f, value_properties) unless value_properties.empty?
		generate_associated_property_doc(f, reference_properties, 'Reference') unless reference_properties.empty?
		generate_associated_property_doc(f, part_properties, 'Part') unless part_properties.empty?
	end
	
  end
  
    def generate_value_property_doc(f, value_properties)
    
      string_out = ""
	  value_only = true
	  redefinesResult = false
	  
	  value_properties.each do |r|
        name = r.association_name ? r.association_name : r.name
        if name == 'Supertype'
          next
		elsif name == 'value'
		  if r.final_target.type.type == 'uml:Enumeration'
			f.puts "\nThe value of {{property(#{@name})}} **MUST** be one of the `#{r.final_target.type.name}` enumeration. \n\n"
			r.final_target.type.generate_enumerations(f, true)
		  elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.include?('3')
		    f.puts "\nThe value of {{property(#{@name})}} **MUST** be reported in `#{r.final_target.type.name}_3D`.\n\n"
		  else
		    f.puts "\nThe value of {{property(#{@name})}} **MUST** be `#{r.final_target.type.name}`.\n\n"
		  end
		  next
		elsif name == 'code' and r.redefinesProperty
		  f.puts "\n    {{property(code)}}: `#{r.default}`.\n\n"
		  next
		elsif name == 'units' and r.default
		  f.puts "\n    {{property(units)}}: `#{r.default}`.\n\n"
		  next
		elsif name == 'result' and r.redefinesProperty
		  redefinesResult = true
		end
		value_only = false
        stereo = r.stereotype!='' ? "`\<\<#{r.stereotype}\>\>`" : ""
                
        if r.redefinesProperty and r.default
          string_out += "| #{stereo}{{property(#{name})}} | `#{r.default}` | #{r.multiplicity} |\n"
        else
          string_out += "| #{stereo}{{property(#{name})}} | `#{r.final_target.type.name}` | #{r.multiplicity} |\n"
        end
      end
      
	  unless value_only
	    f.puts "\n#### Value Properties of #{@name}\n\n"
	  
	    f.puts <<-EOT
{{tbl(value-properties-of-#{@name.downcase})}} lists the Value Properties of {{block(#{@name})}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
#{string_out}{: caption="Value Properties of #{@name}"}
EOT
      
 	    if not (redefinesResult and value_properties.length <= 1)
		  f.puts "\nDescriptions for Value Properties of {{block(#{@name})}}:\n"
	    end
	  end
      value_properties.each do |r|
        if r.name == 'Supertype' or r.name == 'value' or r.association_name == 'value'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty and not value_only
          
          name = r.association_name ? r.association_name : r.name
		  stereo = r.stereotype!='' ? "`\<\<#{r.stereotype}\>\>`" : ""
          if r.association_doc
            f.puts "\n* #{stereo}{{property(#{name})}} \n\n    #{r.association_doc.gsub("\n","\n    ")}\n"
          elsif r.documentation
            f.puts "\n* #{stereo}{{property(#{name})}} \n\n    #{r.documentation.gsub("\n","\n    ")}\n"
          end
          
          if r.target.type.type == 'uml:Enumeration'and not stereo.include?('deprecated')
            f.puts "\n    The value of {{property(#{name})}} **MUST** be one of the `#{r.final_target.type.name}` enumeration."
			if !$enums.include?(r.final_target.type.name)
			  r.target.type.generate_enumerations(f, true)
			  $enums << r.final_target.type.name
			end
          end
        end
      end
	end
	
	def generate_associated_property_doc(f, properties, property_stereotype)

	    f.puts "\n#### #{property_stereotype} Properties of #{@name}\n\n"
	  
	    f.puts <<-EOT
{{tbl(#{property_stereotype.downcase}-properties-of-#{@name.downcase})}} lists the #{property_stereotype} Properties of {{block(#{@name})}}.

| #{property_stereotype} Property name | Multiplicity |
|:-------------------------------------|:-------------:|
EOT
      
      properties.each do |r|
        if r.name == 'Supertype'
          next
        end
        stereo = r.stereotype!='' ? "`\<\<#{r.stereotype}\>\>`" : ''
        
        name = r.association_name ? r.association_name : r.name
        
        if r.redefinesProperty and r.default
          f.puts "| #{stereo}{{block(#{r.default})}} | #{r.multiplicity} |"
        elsif r.association_name and (r.final_target.type.name != name or name == 'Condition')
          f.puts "| #{stereo}{{block(#{r.final_target.type.name})}} (organized by {{block(#{name})}}) | #{r.multiplicity} |"
		elsif not r.association_name and r.final_target.type.name != name
		  f.puts "| #{stereo}{{block(#{name})}} | #{r.multiplicity} |"
		else
		  f.puts "| #{stereo}{{block(#{r.final_target.type.name})}} | #{r.multiplicity} |"
        end
      end
	  f.puts "{: caption=\"#{property_stereotype} Properties of #{@name}\"}"

	  f.puts "\nDescriptions for #{property_stereotype} Properties of {{block(#{@name})}}:\n"
      properties.each do |r|
        if r.name == 'Supertype'
          next
        elsif (r.association_doc or r.final_target.type.documentation or r.target.type.type == 'uml:Enumeration') and (not r.redefinesProperty or r.final_target.type.type == 'uml:Class')
          stereo = r.stereotype!='' ? "`\<\<#{r.stereotype}\>\>`" : ''
          name = r.final_target.type.name
          f.puts "\n* #{stereo}{{block(#{name})}} \n\n    #{r.final_target.type.documentation.gsub("\n","\n    ")}\n"
          f.puts "    #{r.association_doc.gsub("\n","\n    ")}\n" if r.association_doc
		  
		  if not r.association_name and r.final_target.type.name != name and not r.target.type.type == 'uml:Enumeration'
		    f.puts "\n    The value of {{block(#{name})}} **MUST** be a `#{r.final_target.type.name}`.\n"
		  end
          
          if r.target.type.type == 'uml:Enumeration' and not r.redefinesProperty and not (r.stereotype and r.stereotype.include?('deprecated'))
            r.target.type.generate_enumerations(f, true)
          end
        end
      end
	end
  
  def generate_types(f)
    $logger.info "Generating docs for #{@name}"
    relations_with_documentation =
      @relations.select do |r|
      $logger.debug "  Looking for docs for #{r.target.inspect}" if r.target.type.nil?
      (r.documentation or r.target.type.type == 'uml:Enumeration' or not r.documentation) and @model.name.split('Type')[0] != r.final_target.type.name and r.visibility == 'public'
    end   

    unless relations_with_documentation.empty?
	value_properties = []
	reference_properties =[]
	part_properties = []

  data_type_defined = false
  relations_with_documentation.each do |r|
    name = r.association_name ? r.association_name : r.name
	
    if name == 'Supertype'
      next
    elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty	
		if (r.property_stereotype == '' or r.property_stereotype == 'ValueProperty') and
			r.name != 'Supertype'
			value_properties.append(r)
		elsif r.property_stereotype == 'ReferenceProperty'
		    reference_properties.append(r)
		elsif r.property_stereotype == 'PartProperty'
			part_properties.append(r)
		end
    elsif r.redefinesProperty
      if name == 'result'
	    data_type_defined = true
		if r.final_target.type.type == 'uml:Enumeration'
			f.puts "\nThe value of {{property(#{@name})}} **MUST** be one of the `#{r.final_target.type.name}` enumeration. \n"
			r.final_target.type.generate_enumerations(f)
		elsif r.final_target.type.type == 'uml:Class'
			f.puts "\nThe {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `#{r.final_target.type.name}` keys.\n"
			r.final_target.type.generate_entrykeys(f)
		elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.end_with?('*')
		  f.puts "\nThe value of {{property(#{@name})}} **MUST** be a list of one or more `#{r.final_target.type.name}`.\n"
		elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.include?('3')
		  f.puts "\nThe value of {{property(#{@name})}} **MUST** be reported in `#{r.final_target.type.name}_3D`.\n"
		elsif r.final_target.type.documentation == "primitive type."
		  f.puts "\nThe value of {{property(#{@name})}} **MUST** be a `#{r.final_target.type.name}`.\n"
		else
	      f.puts "\nThe value of {{property(#{@name})}} **MUST** be a #{r.final_target.type.documentation}\n"
		end
      elsif (name == "type" or name == "subType") and not r.default
        f.puts "\nThe value of {{property(#{name})}} with {{property(category)}} `#{@name}` **MUST** be one of the following:\n\n" if name == "type"
		
		f.puts "\nThe value of {{property(#{name})}} for {{block(DataItem)}} **MUST** be one of the following:\n\n" if name == "subType"
        
        r.final_target.type.literals.sort_by! { |t| t.name }
        r.final_target.type.literals.each do |lit|
		  lit_subtypes = ""
		  if $dataitemtypes.has_key?(lit.name) and lit.description
		    $dataitemtypes[lit.name]['documentation'] = lit.description
		  end
		  if $dataitemtypes.has_key?(lit.name) and $dataitemtypes[lit.name].has_key?('subTypes') and !$dataitemtypes[lit.name]['subTypes'].empty? and escape_name != "Condition" and name != 'subType'
		    lit_subtypes = "\n    Subtypes of `#{lit.name}` : #{$dataitemtypes[lit.name]['subTypes'].join(", ")}.\n"
		  end
          f.puts "* `#{lit.name}` \n\n    #{lit.description.gsub("\n", "\n    ")} \n\n#{lit_subtypes}\n"
        end
	  elsif name == 'units' and r.default
	    data_type_defined = true
	    f.puts "\nThe {{property(units)}} of {{property(#{@name})}} **MUST** be `#{r.default}`.\n"
          end
        end
      end
	  
	  if (not data_type_defined and ["Sample Types", "Event Types"].include?(@model.name))
	    f.puts "\nThe value of {{property(#{@name})}} **MUST** be a `string`.\n\n"
	  end
	  
	  generate_value_property_doc(f, value_properties) unless value_properties.empty?
	  generate_associated_property_doc(f, reference_properties, 'Reference') unless reference_properties.empty?
	  generate_associated_property_doc(f, part_properties, 'Part') unless part_properties.empty?
	  
    end    
  end
  
  def generate_subtypes(f)
    return if @is_subtype == true or @subtypes.length == 0

	if ["Sample Types", "Event Types", "DataItem Types for Interface"].include?(@model.name)
	  if @subtypes.size>0 and @relations.size>1
		f.puts "\n#### Subtypes of #{@name}\n\n"
		
		@subtypes.each do |subtype|
		  if defined?(subtype.relation("subType").default)
			f.puts "* `#{subtype.relation("subType").default}`"
			subtype.generate_documentation(f, true)
			subtype.relations.each do |r|
			  name = r.association_name ? r.association_name : r.name
			  if r.redefinesProperty and name == 'result'
			    if r.final_target.type.type == 'uml:Enumeration'
				  f.puts "\n    The value for {{block(#{@name})}} when {{property(subType)}} is `#{subtype.relation("subType").default}` **MUST** be one of the `#{r.final_target.type.name}` enumeration.\n"
				  if !$enums.include?(r.final_target.type.name)
				    r.final_target.type.generate_enumerations(f, true)
					$enums << r.final_target.type.name
				  end
				elsif r.final_target.type.documentation == "primitive type."
				  f.puts "\n    The value of {{block(#{@name})}} **MUST** be a `#{r.final_target.type.name}`.\n"
				else
				  f.puts "\n    The value of {{block(#{@name})}} **MUST** be a #{r.final_target.type.documentation}\n"
				end
				break
			  end
			end
		  end
		end
	  end
	end
  end


  def generate_enumerations(f, is_tabulated=false)
	tab = is_tabulated ? "    " : ""
    if @type == 'uml:Enumeration'
      $logger.debug "***** =====> Generating Enumerations for #{@name}"

	  stereo = @stereotype != '' ? "`\<\<#{@stereotype}\>\>`" : ''
	  f.puts "\n#{tab}#{stereo}`#{escape_name}` Enumeration:\n\n"
      @literals.each do |lit|
        f.puts "\n#{tab}* `#{lit.name}` \n\n    #{tab}#{lit.description.gsub("\n","\n    #{tab}")}\n"
      end
    end
  end
  
  def generate_entrykeys(f)
    $logger.debug "***** =====> Generating Keys for #{@name}"

    f.puts "\n`#{escape_name}` keys:\n"
	@relations.each do |r|
	  next if r.name == 'Supertype'
	  f.puts "\n* `#{r.name}` \n\n    #{r.documentation.gsub("\n","\n    ")}\n"
	  f.puts "    The value of `#{r.name}` **MUST** be a `#{r.final_target.type.name}`.\n\n"
	end
  end

  def generate_class(f)
    generate_property_doc(f)
    generate_subtypes(f)
  end

  def generate_md(f = STDOUT, parent ='')
    # puts "--- Generating #{@name} #{@stereotype}"
    return if @name =~ /Factory/ or @stereotype =~ /metaclass/ or @visibility != 'public'
    section_name = escape_name

	if @is_subtype == true
		if @model.name == "Component Types" and parent.name != @relations[0].final_target.type.name
			section_type = "#####"
		else
		    section_type = "####"
		end
		
		if  !@model.name.include?("Sample") and !@model.name.include?("Event") and !@model.name.include?("Interface")
		  f.puts "\n#{section_type} #{section_name}\n\n"
		  generate_documentation(f)
		end
	
	elsif @model.name == "Composition Types"
    	f.puts "\n### #{section_name}\n\n"
		generate_documentation(f)
		generate_class(f)		
	
	elsif @model.name.end_with?('Types') and section_name.end_with?('Result')
		#pass
	else
	    f.puts "\n### #{section_name}\n\n"
		if ['Sample Types', 'Event Types', 'Condition Types', 'DataItem Types for Interface'].include?(@model.name)
          dataitem_type = self.relation("type").default
		  if $dataitemtypes.has_key?(dataitem_type) and $dataitemtypes[dataitem_type]['documentation']
			f.puts "#{$dataitemtypes[dataitem_type]['documentation']}\n"
		  end
		end
		generate_documentation(f)
		generate_class(f)
	end
  end

  def generate_glossary_docs(f, glossary_type)    
	if @name.end_with?('y')
	  plural = "#{@name[0...-1] + 'ies'}"
	elsif @name.end_with?('s')
	  plural = "#{@name}"
	else
	  plural = "#{@name + 's'}"
	end
	
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
	f.puts "\n### #{@name}\n"
	generate_documentation(f)
  end
end
