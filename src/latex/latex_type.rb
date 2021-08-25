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
      r.type!= 'uml:Constraint' and (r.documentation or r.target.type.type == 'uml:Enumeration' or not r.documentation) and @model.name.split('Type')[0] != r.final_target.type.name and r.visibility == 'public'
    end
	
	attributes = relations_with_documentation.select do |a| 
		if a.association_name
		    /[[:lower:]]/.match(a.association_name[0])
		else
			/[[:lower:]]/.match(a.name[0])
		end
	end

	elements = relations_with_documentation.select do |a| 
		if a.association_name
		    /[[:upper:]]/.match(a.association_name[0])
		else
			/[[:upper:]]/.match(a.name[0])
		end
	end
	
	unless relations_with_documentation.empty? or (relations_with_documentation[0].name == 'Supertype' and relations_with_documentation.length == 1)
		generate_attribute_doc(f, attributes) unless attributes.empty?
		generate_element_doc(f, elements) unless elements.empty? or (elements[0].name == 'Supertype' and elements.length == 1)
	end
	
  end
  
  def generate_attribute_doc(f, attributes)
    
      string_out = ""
	  value_only = true
	  
	  attributes.each do |r|
        name = r.association_name ? r.association_name : r.name
        if name == 'Supertype'
          next
		elsif name == 'value'
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be \\texttt{#{r.final_target.type.name}}.\n\n"
		  next
		elsif name == 'code'
		  f.puts "\n\\texttt{code}: \\texttt{#{r.default}}.\n\n"
		  next
		elsif name == 'units' and r.default
		  f.puts "\n\\texttt{units}: \\texttt{#{r.default.gsub(/(\^)/,"\\^{}").gsub("_","\\textunderscore ")}}.\n\n"
		  next
		end
		value_only = false
        stereo = r.stereotype ? "\\texttt{<<#{r.stereotype}>>} " : ""
                
        if r.redefinesProperty and r.default
          string_out += "\n#{stereo}\\property{#{name}}[#{@name}] & \\texttt{#{r.default.gsub(/(\^)/,"\\^{}")}} & #{r.multiplicity} \\\\"
        else
          string_out += "\n#{stereo}\\property{#{name}}[#{@name}] & \\texttt{#{r.final_target.type.name}} & #{r.multiplicity} \\\\"
        end
      end
      
	  unless value_only
	  f.puts %"
\\paragraph{Attributes of #{@name}}\\mbox{}
#{self.class.get_label("sec:Attributes of #{@name}")}

\\tbl{Attributes of #{@name}} lists the attributes of \\texttt{#{@name}}.

\\begin{table}[ht]
\\centering 
  \\caption{Attributes of #{@name}}
  #{self.class.get_label("table:Attributes of #{@name}")}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {Attribute} & {Type} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
" + string_out + %"
\\end{tabu}
\\end{table}
\\FloatBarrier
"
      

	  f.puts "\nDescriptions for attributes of \\block{#{@name}}:\n\n"
	  f.puts "\\begin{itemize}\n"
	  end
      attributes.each do |r|
        if r.name == 'Supertype' or r.name == 'value' or r.association_name == 'value'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty and not value_only
          
          name = r.association_name ? r.association_name : r.name
          if r.association_doc
            f.puts "\n\\item \\property{#{name}}[#{@name}] \\newline #{r.association_doc}\n"
          elsif r.documentation
            f.puts "\n\\item \\property{#{name}}[#{@name}] \\newline #{r.documentation}\n"
          end
          
		  stereo = r.stereotype ? "\\texttt{<<#{r.stereotype}>>} " : ""
          if r.target.type.type == 'uml:Enumeration' and !$enums.include?(r.final_target.type.name) and not stereo.include?('deprecated')
            r.target.type.generate_enumerations(f)
			$enums << r.final_target.type.name
          end
        end
      end

	  unless value_only 
	  f.puts "\\end{itemize}\n\n"
	  end
	end
	
	def generate_element_doc(f, elements)

      f.puts <<-EOT

\\paragraph{Elements of #{@name}}\\mbox{}
#{self.class.get_label("sec:Elements of #{@name}")}

\\tbl{Elements of #{@name}} lists the elements of \\texttt{#{@name}}.

\\begin{table}[ht]
\\centering 
  \\caption{Elements of #{@name}}
  #{self.class.get_label("table:Elements of #{@name}")}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {Element} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
EOT
      
      elements.each do |r|
        if r.name == 'Supertype'
          next
        end
        stereo = r.stereotype ? "\\texttt{<<#{r.stereotype}>>} " : nil
        
        name = r.association_name ? r.association_name : r.name
        
        if r.redefinesProperty and r.default
          f.puts "\\texttt{#{r.default}} & #{r.multiplicity} \\\\"
        elsif r.association_name and r.final_target.type.name != name
          f.puts "\\texttt{#{r.final_target.type.name}} (organized by \\block{#{name}}) & #{r.multiplicity} \\\\"
		elsif not r.association_name and r.final_target.type.name != name
		  f.puts "\\texttt{#{name}} & #{r.multiplicity} \\\\"
		else
		  f.puts "\\texttt{#{r.final_target.type.name}} & #{r.multiplicity} \\\\"
        end
      end
      
      f.puts <<-EOT
\\end{tabu}
\\end{table}
\\FloatBarrier

EOT

	  f.puts "\nDescriptions for elements of \\block{#{@name}}:\n\n"
	  f.puts "\\begin{itemize}\n"
      elements.each do |r|
        if r.name == 'Supertype'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty
          
          name = r.association_name ? r.association_name : r.name
          if r.association_doc
            f.puts "\n\\item \\block{#{name}} \\newline #{r.association_doc}\n"
          else r.documentation
            f.puts "\n\\item \\block{#{name}} \\newline #{r.documentation}\n"
          end
		  
		  if not r.association_name and r.final_target.type.name != name and not r.target.type.type == 'uml:Enumeration'
		    f.puts "\nThe value of \\block{#{name}} \\MUST be \\texttt{#{r.final_target.type.name}}.\n"
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
	attributes =[]
	elements =[]

  relations_with_documentation.each do |r|
    name = r.association_name ? r.association_name : r.name
  
    if name == 'Supertype'
      next
    elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty	
	  if /[[:lower:]]/.match(name[0])
	    attributes.append(r)
	  elsif /[[:upper:]]/.match(name[0])
	    elements.append(r)
	  end
    elsif r.redefinesProperty
      if name == 'result'
		if r.final_target.type.type == 'uml:Enumeration'
			f.puts "\nThe value of \\texttt{#{@name}} \\MUST be one of the following: \n\n"
			r.final_target.type.generate_enumerations(f)
		elsif r.final_target.type.type == 'uml:Class'
			f.puts "\nThe \\block{Entry} \\property{key} \\MUST be one or more from the following:\n"
			r.final_target.type.generate_entrykeys(f)
		elsif r.final_target.type.type == 'uml:DataType' and r.final_target.type.multiplicity.end_with?('*')
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be a space delimited list of \\texttt{#{r.final_target.type.name}s}.\n\n"
		else
		  f.puts "\nThe value of \\texttt{#{@name}} \\MUST be \\texttt{#{r.final_target.type.name}}.\n\n"
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
		  if $dataitemtypes.has_key?(lit_name) and !$dataitemtypes[lit_name].empty?
		    lit_subtypes = "\nSubtypes of \\texttt{#{lit_name}}: "+ $dataitemtypes[lit_name].join(", ")+"."
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
	    f.puts "\n\\texttt{units}: \\texttt{#{r.default.gsub(/(\^)/,"\\^{}").gsub("_","\\textunderscore ")}}.\n"
          end
        end
      end
	  
	  generate_attribute_doc(f, attributes) unless attributes.empty?
	  generate_element_doc(f, elements) unless elements.empty?
	  
    end    
  end
  
  def generate_subtypes(f)
    return if @is_subtype == true or @subtypes.length == 0

	if @model.name.include?("Types")
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
				f.puts "\nThe value for \\block{#{@name}} when \\property{subType} is \\texttt{#{subtype.relation("subType").default.gsub("_","\\textunderscore ")}} \\MUST be one of the following: \n\n"
				r.final_target.type.generate_enumerations(f)
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

	f.puts <<-EOT

\\texttt{#{escape_name}} Enumeration:

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
	    f.puts "\\newline The value of \\texttt{#{name}} \\MUST be \\texttt{#{r.final_target.type.name}}.\n\n"
	  end
	  f.puts <<-EOT
\\end{itemize}

EOT
  end

  def generate_data_type(f)
    generate_property_doc(f)
  end

  def generate_class_diagram
    File.open(File.join(LatexModel.directory,'classes',@name.gsub(/[<>]/, '-')+".tex"), 'w') do |f|
      if @abstract
        f.puts "\\umlabstract{#{@name}}{"
      else
        f.puts "\\umlclass{#{@name}}{"
      end

      @relations.each do |r|
        if r.is_property?
          if r.stereotype
            stereo = "<<#{r.stereotype}>> "
          end
          f.puts "#{stereo}+ #{r.name}: #{r.target.type.name}#{r.is_optional? ? '[0..1]' : ''} \\\\"
        end
      end
    
      f.puts "}{}"
      f.puts "\n% Relationships\n\n"
    
      @relations.each do |r|
        if !r.is_property?
          if r.stereotype
            stereo = "stereo=#{r.stereotype},"
          end
          case r
          when Relation::Generalization
            f.puts "\\umlinherit[geometry=|-|]{#{r.source.type.name}}{#{r.target.type.name}}"

          when Relation::Association
            f.puts <<-EOT
\\umluniassoc[geometry=|-,#{stereo}%
              arg1=#{r.name},%
              mult1=#{r.source.multiplicity},%
              mult2=#{r.target.multiplicity}]{#{r.source.type.name}}{#{r.target.type.name}}
EOT
          end
        end
      end
    end
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
\n\\subsubsection[#{section_name}]{#{section_name} \\\\ {\\small type: #{@relations[1].default.gsub("_","\\textunderscore ")}}}
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

		generate_documentation(f)
		generate_class(f)
	
	end
	
	f.puts @additional_documentation

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

end
