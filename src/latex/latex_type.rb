require 'set'
require 'documents'
require 'lib/type'
require 'lib/diagrams'
require 'lib/markdown_parser'

class LatexType < Type
  include Diagram
  include Document
  include MarkDownParser

  @@labels = Set.new


  def self.add_label=(label)
    @@labels.add(label)
  end
  
  def self.reset_labels
    @@labels = Set.new
  end
  
  def self.get_label(label_name)
    label = ""
  	if !@@labels.include?(label_name)
	  label = "\\label{#{label_name}}"
	  @@labels.add(label_name)
	end	
	return label
  end
	
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
			f.puts "\nThe value of \\texttt{#{@name}} \\MUST be one of the #{r.final_target.type.name} enumeration. \n\n"
			r.final_target.type.generate_enumerations(f)
		  elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.include?('3')
		    f.puts "\nThe value of \\texttt{#{@name}} \\MUST be reported in \\texttt{#{r.final_target.type.name}\\textunderscore 3D}.\n\n"
		  else
		    f.puts "\nThe value of \\texttt{#{@name}} \\MUST be \\texttt{#{r.final_target.type.name}}.\n\n"
		  end
		  next
		elsif name == 'code' and r.redefinesProperty
		  f.puts "\n\\texttt{code}: \\texttt{#{r.default}}.\n\n"
		  next
		elsif name == 'units' and r.default
		  f.puts "\n\\texttt{units}: \\texttt{#{r.default.gsub(/(\^)/,"\\^{}").gsub("_","\\textunderscore ")}}.\n\n"
		  next
		elsif name == 'result' and r.redefinesProperty
		  redefinesResult = true
		end
		value_only = false
        stereo = r.stereotype!='' ? "\\texttt{<<#{r.stereotype}>>} " : ""
                
        if r.redefinesProperty and r.default
          string_out += "\n#{stereo}\\property{#{name}}[#{@name}] & \\texttt{#{r.default.gsub(/(\^)/,"\\^{}").gsub("_","\\textunderscore ")}} & #{r.multiplicity} \\\\"
        else
          string_out += "\n#{stereo}\\property{#{name}}[#{@name}] & \\texttt{#{r.final_target.type.name.gsub("_","\\textunderscore ")}} & #{r.multiplicity} \\\\"
        end
      end
      
	  unless value_only
	  f.puts %"
\\paragraph{Value Properties of #{@name}}\\mbox{}
#{self.class.get_label("sec:Value Properties of #{@name}")}

\\tbl{Value Properties of #{@name}} lists the Value Properties of \\texttt{#{@name}}.

\\begin{table}[ht]
\\centering 
  \\caption{Value Properties of #{@name}}
  #{self.class.get_label("table:Value Properties of #{@name}")}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {Value Property name} & {Value Property type} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
" + string_out + %"
\\end{tabu}
\\end{table}
\\FloatBarrier
"
      
 	    if not (redefinesResult and value_properties.length <= 1)
		  f.puts "\nDescriptions for Value Properties of \\block{#{@name}}:\n\n"
		  f.puts "\\begin{itemize}\n"
	    end
	  end
      value_properties.each do |r|
        if r.name == 'Supertype' or r.name == 'value' or r.association_name == 'value'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty and not value_only
          
          name = r.association_name ? r.association_name : r.name
		  stereo = r.stereotype!='' ? "\\texttt{<<#{r.stereotype}>>} " : ""
          if r.association_doc
            f.puts "\n\\item #{stereo}\\property{#{name}}[#{@name}] \\newline #{r.association_doc}\n"
          elsif r.documentation
            f.puts "\n\\item #{stereo}\\property{#{name}}[#{@name}] \\newline #{r.documentation}\n"
          end
          
          if r.target.type.type == 'uml:Enumeration'and not stereo.include?('deprecated')
            f.puts "\nThe value of \\texttt{#{name}} \\MUST be one of the \\texttt{#{r.final_target.type.name}} enumeration."
			if !$enums.include?(r.final_target.type.name)
			  r.target.type.generate_enumerations(f)
			  $enums << r.final_target.type.name
			end
          end
        end
      end

	  unless value_only
	  f.puts "\\end{itemize}\n\n" if not (redefinesResult and value_properties.length <= 1)
	  end
	end
	
	def generate_associated_property_doc(f, properties, property_stereotype)

      f.puts <<-EOT

\\paragraph{#{property_stereotype} Properties of #{@name}}\\mbox{}
#{self.class.get_label("sec:#{property_stereotype} Properties of #{@name}")}

\\tbl{#{property_stereotype} Properties of #{@name}} lists the #{property_stereotype} Properties of \\texttt{#{@name}}.

\\begin{table}[ht]
\\centering 
  \\caption{#{property_stereotype} Properties of #{@name}}
  #{self.class.get_label("table:#{property_stereotype} Properties of #{@name}")}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {#{property_stereotype} Property type} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
EOT
      
      properties.each do |r|
        if r.name == 'Supertype'
          next
        end
        stereo = r.stereotype!='' ? "\\texttt{<<#{r.stereotype}>>} " : ''
        
        name = r.association_name ? r.association_name : r.name
        
        if r.redefinesProperty and r.default
          f.puts "#{stereo}\\texttt{#{r.default}} & #{r.multiplicity} \\\\"
        elsif r.association_name and (r.final_target.type.name != name or name == 'Condition')
          f.puts "#{stereo}\\texttt{#{r.final_target.type.name}} (organized by \\block{#{name}}) & #{r.multiplicity} \\\\"
		elsif not r.association_name and r.final_target.type.name != name
		  f.puts "#{stereo}\\texttt{#{name}} & #{r.multiplicity} \\\\"
		else
		  f.puts "#{stereo}\\texttt{#{r.final_target.type.name}} & #{r.multiplicity} \\\\"
        end
      end
      
      f.puts <<-EOT
\\end{tabu}
\\end{table}
\\FloatBarrier

EOT

	  f.puts "\nDescriptions for #{property_stereotype} Properties of \\block{#{@name}}:\n\n"
	  f.puts "\\begin{itemize}\n"
      properties.each do |r|
        if r.name == 'Supertype'
          next
        elsif (r.association_doc or r.final_target.type.documentation or r.target.type.type == 'uml:Enumeration') and (not r.redefinesProperty or r.final_target.type.type == 'uml:Class')
          stereo = r.stereotype!='' ? "\\texttt{<<#{r.stereotype}>>} " : ''
          name = r.final_target.type.name
          f.puts "\n\\item #{stereo}\\block{#{name}} \\newline #{r.final_target.type.documentation}\n"
          f.puts "\\newline #{r.association_doc}\n" if r.association_doc
		  
		  if not r.association_name and r.final_target.type.name != name and not r.target.type.type == 'uml:Enumeration'
		    f.puts "\nThe value of \\block{#{name}} \\MUST be a \\texttt{#{r.final_target.type.name}}.\n"
		  end
          
          if r.target.type.type == 'uml:Enumeration' and not r.redefinesProperty and not (r.stereotype and r.stereotype.include?('deprecated'))
            r.target.type.generate_enumerations(f)
          end
        end
      end
	  f.puts "\\end{itemize}\n\n"

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
			f.puts "\nThe value of \\texttt{#{@name}} \\MUST be one of the #{r.final_target.type.name} enumeration. \n\n"
			r.final_target.type.generate_enumerations(f)
		elsif r.final_target.type.type == 'uml:Class'
			f.puts "\nThe \\block{Entry} \\property{key} \\MUST be one or more from the #{r.final_target.type.name} keys.\n"
			r.final_target.type.generate_entrykeys(f)
		elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.end_with?('*')
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be a list of one or more \\texttt{#{r.final_target.type.name}s}.\n\n"
		elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.include?('3')
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be reported in \\texttt{#{r.final_target.type.name}\\textunderscore 3D}.\n\n"
		elsif r.final_target.type.name == 'dateTime'
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be reported in ISO 8601 format."
		elsif r.final_target.type.name == 'x509'
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be an \\texttt{x509} data block."
		else
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be a \\texttt{#{r.final_target.type.name}}.\n\n"
		end
      elsif (name == 'type' or name == 'subType') and not r.default
        f.puts "\nThe value of \\property{#{name}}[DataItem] with \\property{category}[DataItem] \\texttt{#{@name}} \\MUST be one of the following:\n" if name == 'type'
		
		f.puts "\nThe value of \\property{#{name}}[DataItem] for \\block{DataItem} \\MUST be one of the following:\n\n" if name == 'subType'
        
		f.puts <<-EOT
\\begin{itemize}

EOT
        r.final_target.type.literals.sort_by! { |t| t.name }
        r.final_target.type.literals.each do |lit|
		  lit_name = lit.name.gsub(/_/,"\\textunderscore ")
		  lit_subtypes = ""
		  if $dataitemtypes.has_key?(lit_name) and lit.description
		    $dataitemtypes[lit_name]['documentation'] = lit.description
		  end
		  if $dataitemtypes.has_key?(lit_name) and $dataitemtypes[lit_name].has_key?('subTypes') and !$dataitemtypes[lit_name]['subTypes'].empty? and escape_name != "Condition" and name != 'subType'
		    lit_subtypes = "\nSubtypes of \\texttt{#{lit_name}} : "+ $dataitemtypes[lit_name]['subTypes'].join(", ")+"."
		  end
          f.puts <<-EOT

\\item \\texttt{#{lit_name}}  

#{lit.description.gsub(/(\^)/,"\\^{}")}
#{lit_subtypes}
EOT
        end
        

        f.puts <<-EOT
\\end{itemize}

EOT
	  elsif name == 'units' and r.default
	    data_type_defined = true
	    f.puts "\nThe \\texttt{units} of \\texttt{#{@name}} \\MUST be \\texttt{#{r.default.gsub(/(\^)/,"\\^{}").gsub("_","\\textunderscore ")}}.\n"
          end
        end
      end
	  
	  if (not data_type_defined and ["Sample Types", "Event Types"].include?(@model.name))
	    f.puts "\nThe value of \\texttt{#{@name}} \\MUST be a \\texttt{string}.\n\n"
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
		f.puts <<-EOT
\n\\paragraph{Subtypes of #{@name}}\\mbox{}
#{self.class.get_label("sec:Subtypes of #{@name}")}

\\begin{itemize}\n
EOT
		@subtypes.each do |subtype|
		  if defined?(subtype.relation("subType").default)
			f.puts "\\item \\texttt{#{subtype.relation("subType").default.gsub("_","\\textunderscore ")}}"
			subtype.generate_documentation(f)
			subtype.relations.each do |r|
			  name = r.association_name ? r.association_name : r.name
			  if r.redefinesProperty and name == 'result'
			    if r.final_target.type.type == 'uml:Enumeration'
				  f.puts "\nThe value for \\block{#{@name}} when \\property{subType} is \\texttt{#{subtype.relation("subType").default.gsub("_","\\textunderscore ")}} \\MUST be one of the #{r.final_target.type.name} enumeration.\n\n"
				  if !$enums.include?(r.final_target.type.name)
				    r.final_target.type.generate_enumerations(f)
					$enums << r.final_target.type.name
				  end
				elsif r.final_target.type.name == 'dateTime'
				  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be reported in ISO 8601 format."
				else
				  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be a \\texttt{#{r.final_target.type.name}}.\n\n"
				end
				break
			  end
			end
		end
		end
		f.puts "\n\\end{itemize}\n\n"
	  end
	end
  end


  def generate_enumerations(f)
    if @type == 'uml:Enumeration'
      $logger.debug "***** =====> Generating Enumerations for #{@name}"

	  stereo = @stereotype != '' ? "\\texttt{<<#{@stereotype}>>}" : ''
	  f.puts <<-EOT

#{stereo}\\texttt{#{escape_name}} Enumeration:

\\begin{itemize}
EOT
    @literals.each do |lit|
      f.puts "\\item \\texttt{#{lit.name.gsub(/(\^)/,"\^{}").gsub("_","\\textunderscore ")}} \\newline #{lit.description} \n"
      end
	f.puts <<-EOT
\\end{itemize}

EOT
    end
  end
  
    def generate_entrykeys(f)
	  $logger.debug "***** =====> Generating Keys for #{@name}"

	  f.puts <<-EOT

\\texttt{#{escape_name}} keys:

\\begin{itemize}
EOT
	  @relations.each do |r|
	    name = r.name.gsub(/(\^)/,"\^{}").gsub("_","\\textunderscore ")
	    next if name == 'Supertype'
	    f.puts "\\item \\texttt{#{name}} \\newline #{r.documentation} \n"
	    f.puts "\\newline The value of \\texttt{#{name}} \\MUST be a \\texttt{#{r.final_target.type.name}}.\n\n"
	  end
	  f.puts <<-EOT
\\end{itemize}

EOT
  end


  def generate_class(f)
  
    generate_property_doc(f)
    generate_subtypes(f)
  end

  def generate_latex(f = STDOUT, parent ='')
    # puts "--- Generating #{@name} #{@stereotype}"
    return if @name =~ /Factory/ or @stereotype =~ /metaclass/ or @visibility != 'public'
    section_name = escape_name

	if @is_subtype == true
		if @model.name == "Component Types" and parent.name != @relations[0].final_target.type.name
			section_type = "subparagraph"
		else
		    section_type = "paragraph"
		end
		
		if  !@model.name.include?("Sample") and !@model.name.include?("Event") and !@model.name.include?("Interface")
		  f.puts <<-EOT
\n\\#{section_type}{#{section_name}}\\mbox{}
#{self.class.get_label("sec:#{section_name}")}
EOT
		  generate_documentation(f)
		end
	
	elsif @model.name == "Composition Types"
    	f.puts <<-EOT
\n\\subsubsection{#{section_name}}
#{self.class.get_label("sec:#{section_name}")}

EOT

		generate_documentation(f)
		generate_class(f)		
	
	elsif @model.name.end_with?('Types') and section_name.end_with?('Result')
		#pass	
	else
	
	    f.puts <<-EOT
\n\\subsubsection{#{section_name}}
#{self.class.get_label("sec:#{section_name}")}

EOT
		if ['Sample Types', 'Event Types', 'Condition Types', 'DataItem Types for Interface'].include?(@model.name)
          dataitem_type = self.relation("type").default.gsub(/_/,"\\textunderscore ")
		  if $dataitemtypes.has_key?(dataitem_type) and $dataitemtypes[dataitem_type]['documentation']
			f.puts "#{$dataitemtypes[dataitem_type]['documentation']}\n\n"
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
\n\\newglossaryentry{#{@name}}
{
	type={#{glossary_type}},
    name={#{@name}},
	description={#{format_whitespaces(@documentation)}},
	plural={#{plural}}
}
EOT
  end
  
  def generate_profile_docs(f)
	return if @visibility != 'public'
	f.puts <<-EOT
\n\\subsubsection{#{@name}}
\\label{sec:#{@name}}

EOT

	generate_documentation(f)
  end

end
