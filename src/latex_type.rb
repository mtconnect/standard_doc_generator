require 'type'
require 'set'
require 'documents'
require 'diagrams'

class LatexType < Type
  include Diagram
  include Document

  @@labels = Set.new

  ROW_FORMAT = "|X[-1.35]|X[-0.7]|X[-1.75]|X[-1.5]|X[-1]|X[-0.7]|"

  def reference
    "See section \\ref{type:#{@name}}"
  end
  
  def generate_supertype(f)
    parent = get_parent
    if parent
      if parent.model != @model
        ref = "See #{parent.model.reference} Documentation"
      else
        ref = parent.reference
      end
      f.puts "\\multicolumn{6}{|l|}{Subtype of #{parent.name} (#{ref})} \\\\"
    end
  end

  def hyphenate(s)
    s.gsub(/([a-z])([A-Z])/, '\1\\-\2').
      gsub(/(MT)([A-Z])/, '\1\\-\2')
  end

  
  def generate_attribute_docs(f, header)
    
    if not relations.empty? and relations[0].name == 'Supertype' and @model.name and relations[0].final_target.type.name
        if @model.name.split(' ')[0] == relations[0].final_target.type.name
	      generate_types(f,header) 
          return
		end
    end


    $logger.info "Generating docs for #{@name}"
    relations_with_documentation =
      @relations.select do |r|
      $logger.debug "  Looking for docs for #{r.target.inspect}" if r.target.type.nil?
      (r.documentation or r.target.type.type == 'uml:Enumeration' or not r.documentation) and @model.name.split('Type')[0] != r.final_target.type.name and r.visibility == 'public'
    end

    unless relations_with_documentation.empty? or (relations_with_documentation[0].name == 'Supertype' and relations_with_documentation.length == 1)

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

	  unless attributes.empty?

      f.puts <<-EOT

\\paragraph{Attributes of #{@name}}\\mbox{}
\\label{sec:Attributes of #{@name}}

\\tbl{attributes of #{@name}} lists the attributes of \\texttt{#{@name}}.

\\begin{table}[ht]
\\centering 
  \\caption{Attributes of #{@name}}
  \\label{table:attributes of #{@name}}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {Attribute} & {Type} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
EOT
      
      attributes.each do |r|
        if r.name == 'Supertype'
          next
        end
        stereo = r.stereotype ? "<<#{r.stereotype}>> " : nil
        
        name = r.association_name ? r.association_name : r.name
        
        if r.redefinesProperty and r.default
          f.puts "\\texttt{#{stereo}#{name}} & \\texttt{#{r.default.gsub(/(\^)/,"\\^{}")}} & #{r.multiplicity} \\\\"
        else
          f.puts "\\texttt{#{stereo}#{name}} & \\texttt{#{r.final_target.type.name}} & #{r.multiplicity} \\\\"
        end
      end
      
      f.puts <<-EOT
\\end{tabu}
\\end{table}
\\FloatBarrier

EOT

	  f.puts "\nDescriptions for attributes of \\texttt{#{@name}}:\n\n"
	  f.puts "\\begin{itemize}\n"
      attributes.each do |r|
        if r.name == 'Supertype'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty
          
          name = r.association_name ? r.association_name : r.name
          if r.association_doc
            f.puts "\\item \\texttt{#{name}} : #{r.association_doc}\n"
          elsif r.documentation
            f.puts "\\item \\texttt{#{name}} : #{r.documentation}\n"
          end
          
          if r.target.type.type == 'uml:Enumeration' and name != "type" and !$enums.include?(r.final_target.type.name)
            r.target.type.generate_enumerations(f)
            f.puts "\\FloatBarrier\n"
			$enums << r.final_target.type.name
          end
        end
      end

	  f.puts "\\end{itemize}\n"
	  end
	
	  unless elements.empty? or (elements[0].name == 'Supertype' and elements.length == 1)

      f.puts <<-EOT

\\paragraph{Elements of #{@name}}\\mbox{}
\\label{sec:Elements of #{@name}}

\\tbl{elements of #{@name}} lists the elements of \\texttt{#{@name}}.

\\begin{table}[ht]
\\centering 
  \\caption{Elements of #{@name}}
  \\label{table:elements of #{@name}}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {Association Name} & {Element} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
EOT
      
      elements.each do |r|
        if r.name == 'Supertype'
          next
        end
        stereo = r.stereotype ? "<<#{r.stereotype}>> " : nil
        
        name = r.association_name ? r.association_name : r.name
        
        if r.redefinesProperty and r.default
          f.puts "\\texttt{#{stereo}#{name}} & \\texttt{#{r.default}} & #{r.multiplicity} \\\\"
        else
          f.puts "\\texttt{#{stereo}#{name}} & \\texttt{#{r.final_target.type.name}} & #{r.multiplicity} \\\\"
        end
      end
      
      f.puts <<-EOT
\\end{tabu}
\\end{table}
\\FloatBarrier

EOT

	  f.puts "\nDescriptions for elements of \\texttt{#{@name}}:\n\n"
	  f.puts "\\begin{itemize}\n"
      elements.each do |r|
        if r.name == 'Supertype'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty
          
          name = r.association_name ? r.association_name : r.name
          if r.association_doc
            f.puts "\\item \\texttt{#{name}} : #{r.association_doc}\n"
          else r.documentation
            f.puts "\\item \\texttt{#{name}} : #{r.documentation}\n"
          end
          
          if r.target.type.type == 'uml:Enumeration' and not r.redefinesProperty
            r.target.type.generate_enumerations(f)
            f.puts "\\FloatBarrier"
          end
        end
      end
	  f.puts "\\end{itemize}\n"

	  end

    end    
  end
  
  
  
  
  
  def generate_types(f, header)
    $logger.info "Generating docs for #{@name}"
    relations_with_documentation =
      @relations.select do |r|
      $logger.debug "  Looking for docs for #{r.target.inspect}" if r.target.type.nil?
      (r.documentation or r.target.type.type == 'uml:Enumeration' or not r.documentation) and @model.name.split('Type')[0] != r.final_target.type.name and r.visibility == 'public'
    end

    

    unless relations_with_documentation.empty? #or (relations_with_documentation[0].name == 'Supertype' and relations_with_documentation.length == 1)


  relations_with_documentation.each do |r|
    name = r.association_name ? r.association_name : r.name
  
    if name == 'Supertype'
      next
    elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty
      
      f.puts "\n\\paragraph{\\texttt{#{name}}}\\mbox{}\n"
	  f.puts "\\label{sec:#{name}}\n\n"

      if r.association_doc
        f.puts "\\newline\\tab #{r.association_doc}\n"
      else r.documentation
        f.puts "\\newline\\tab #{r.documentation}\n"
      end
      
      if r.target.type.type == 'uml:Enumeration' and not r.redefinesProperty 
        r.target.type.generate_enumerations(f)
      end
      
    elsif r.redefinesProperty
      if name == 'result'
        f.puts "\nThe value of \\texttt{#{@name}} \\MUST be one of the following: \n\n"
        r.final_target.type.generate_enumerations(f)
        f.puts "\\FloatBarrier"
      elsif name == 'type' and not r.default
        f.puts "\n \\texttt{type} for \\texttt{#{@name}} are:\n"
        
        f.puts <<-EOT
\\begin{itemize}

EOT
      
        r.final_target.type.literals.each do |lit|
          f.puts "\\item \\texttt{#{lit.name}} : #{lit.description.gsub(/(\^)/,"\\^{}")} \n\n" # "
		  
		  unless !$dataitem_types.key?(toTitleCase(lit.name)) or $dataitem_types[toTitleCase(lit.name)].empty?
			f.puts "Subtypes of \\texttt{#{lit.name}} are: \n"
			$dataitem_types[toTitleCase(lit.name)].each do |subtype|
				subtype.relations.each do |relation|
					if relation.name == 'subType'
						subtype_name = relation.default
						f.puts "\\newline\\tab \\texttt{#{subtype_name}} : #{subtype.documentation} \n"
						break
					end
				end
			end
		  end
        end
        

        f.puts <<-EOT
\\end{itemize}

EOT
	  elsif name == 'units' and r.default
	    f.puts "\nUnits for \\texttt{#{@name}} is: \\texttt{#{r.default.gsub(/(\^)/,"\\^{}")}}.\n\n"
          end
        end
      end
    end    
  end
  
  def generate_subtypes(f)
    return if @is_subtype == true or @subtypes.length == 0

	if @model.name.include?("DataItem")
    f.puts <<-EOT
Subtypes of \\texttt{#{escape_name}} are :

\\begin{itemize}
EOT

    @subtypes.each do |subtype|
      subtype_name = subtype.escape_name
      st = subtype.relation("subType")
      if st and st.default
        f.puts "\\item \\texttt{#{st.default}} : #{subtype.documentation}\n\n"
      else
        f.puts "\\item \\texttt{#{subtype_name}} : #{subtype.documentation}\n\n"
      end
      
    end
    f.puts "\\end{itemize}\n\n"

	elsif @model.name.include?("Types")
	  if @subtypes.size>0
		subtypes_array = []
		@subtypes.each do |subtype|
		  subtypes_array << "\\texttt{#{subtype.relation("subType").default}}" if defined?(subtype.relation("subType").default)
		end
		if subtypes_array.size>2
	      f.puts "\nSubtypes of #{@name} are: #{subtypes_array[0..-1].join(", ")} and #{subtypes_array[-1]}. \n"
		elsif subtypes_array.size==2
		  f.puts "\nSubtypes of #{@name} are: #{subtypes_array[0]} and #{subtypes_array[-1]}. \n"
		elsif subtypes.size==1
		  f.puts "\nSubtype of #{@name} is: #{subtypes_array[0]}.\n"
		end
		
	  end
	  @subtypes.each do |subtype|
	    subtype_name = subtype.escape_name
		subtype.relations.each do |r|
		  name = r.association_name ? r.association_name : r.name
		  if r.redefinesProperty and name == 'result'
			f.puts "\nThe value fof \\texttt{#{@name}} when \\texttt{subType} is \\texttt{#{subtype.relation("subType").default}} \\MUST be one of the following: \n\n"
			r.final_target.type.generate_enumerations(f)
			f.puts "\\FloatBarrier"
		  end
		end	
      end
	end
  end


def generate_enumerations(f)
  if @type == 'uml:Enumeration'
    $logger.debug "***** =====> Generating Enumerations for #{@name}"

    f.puts <<-EOT
\\tabulinesep = 5pt
\\begin{longtabu} to \\textwidth {
    |l|X|}
  \\caption{#{escape_name} Enumeration}
EOT
    unless @@labels.include?(@name)
      f.puts "  \\label{enum:#{@name}} \\\\"
      @@labels.add(@name)
    end

    f.puts <<-EOT
\\hline
Name & Description \\\\
\\hline
\\endfirsthead
\\hline
\\multicolumn{2}{|c|}{Continuation of Table \\texttt{#{escape_name}} Enumeration} \\\\
\\hline
Name & Description \\\\
\\hline
\\endhead
EOT
    
    @literals.each do |lit|
      f.puts "\\texttt{#{lit.name}} & #{lit.description.gsub(/(\^)/,"\\^{}")} \\\\ \\hline"
      end
        
      f.puts <<-EOT
\\end{longtabu}
EOT
    end
  end

  def generate_data_type(f)
    generate_attribute_docs(f, "Field")
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
  
    generate_attribute_docs(f, "Property")
    generate_subtypes(f)
  end

  def generate_latex(f = STDOUT)
    # puts "--- Generating #{@name} #{@stereotype}"
    return if @name =~ /Factory/ or @stereotype =~ /metaclass/
    section_name = if defined?(@relations[0].name) and @relations[0].name == 'Supertype' and false #Subtype subscript?
      "[#{escape_name}]{#{escape_name} \\\\ {\\small Subtype of #{@relations[0].final_target.type.name}}}"
    else
      "{#{escape_name}}"
    end

    f.puts <<-EOT
\n\\subsubsection#{section_name}
  \\label{sec:#{@name}}

EOT
  
    generate_diagram(f)
    generate_documentation(f)

    if @type == 'uml:DataType' or @type == 'uml:PrimitiveType'
      generate_data_type(f)
    else
      generate_class(f)
    end

    f.puts "\\FloatBarrier"

    # generate_class_diagram    
  end


  def generate_glossary_docs(f)
	f.puts <<-EOT
\n\\newglossaryentry{#{@name}}
{
    name={#{@name}},
	description={#{@documentation}}
}
EOT
  end

  def toTitleCase(uppercase)
	titlecase = ""
	uppercase_split = uppercase.split('_')
	uppercase_split.each do |word|
		if word.length>2
			titlecase += word[0] + word[1..-1].downcase!
		else 
			titlecase += word
		end
	end
	return titlecase
  end

end
