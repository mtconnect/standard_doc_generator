require 'type'
require 'set'

module Diagram
  def png_diagram_name
    "./diagrams/types/#{short_name}.png"
  end

  def tex_diagram_name
    "./diagrams/types/#{short_name}.tex"
  end

  def png_diagram_file_name
    "./#{LatexModel.directory}/#{png_diagram_name}"
  end

  def tex_diagram_file_name
    "./#{LatexModel.directory}/#{tex_diagram_name}"
  end

  def png_diagram_exists?
    File.exists?(png_diagram_file_name)      
  end

  def tex_diagram_exists?
    File.exists?(tex_diagram_file_name)
  end
  
  def generate_diagram(f)
    if tex_diagram_exists?
      # puts "** Generating png diagrams #{tex_diagram_file_name}"

      f.puts "\n\\input #{tex_diagram_name}\n\n"
    elsif png_diagram_exists?
      # puts "** Generating png diagrams #{png_diagram_file_name}"
      
      f.puts <<-EOT

\\begin{figure}[ht]
  \\centering
    \\includegraphics[width=1.0\\textwidth]{#{png_diagram_name}}
  \\caption{#{@name} Diagram}
  \\label{fig:#{short_name}}
\\end{figure}

\\FloatBarrier

EOT
    end
  end
end

module Document
  def documentation_name
    "./type-sections/#{short_name}.tex"
  end

  def documentation_file_name
    "./#{LatexModel.directory}/#{documentation_name}"
  end


  def documentation_exists?
    File.exists?(documentation_file_name)
  end

  def generate_documentation(f)
    if documentation_exists?
      f.puts "\n\\input #{documentation_name}\n\n"
    elsif @documentation
      f.puts "\n#{@documentation}\n\n"
    end
  end
end

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

  def mixin_relations(f)
    @parent.mixin_relations(f) if @parent
    generate_relations(f)
  end

  def hyphenate(s)
    s.gsub(/([a-z])([A-Z])/, '\1\\-\2').
      gsub(/(MT)([A-Z])/, '\1\\-\2')
  end

  

  def generate_relations(f)
    # puts "Generating relations for #{@name}"
    @relations.each do |r|
      if r.is_reference?
        begin
          # puts "  Ref: '#{r.name}' '#{r.stereotype}' '#{r.final_target.type.name}' #{r.target_node_name} #{r.is_derived?}"
          next if r.is_derived? or (r.stereotype and r.stereotype =~ /Attribute/)  
          
          array = '[]' if r.is_array?
          
          if r.is_property? or r.is_folder?
            type_info = "#{hyphenate(r.final_target.type.name)}#{array} & #{hyphenate(r.target_node_name)}"
          elsif r.target.type.is_variable?
            type_info = "#{hyphenate(r.target.type.variable_data_type.name)}#{array} & #{hyphenate(r.target_node_name)}"
          else
            type_info = "\\multicolumn{2}{l|}{#{r.target_node_name}#{array}}"
          end

          f.puts "#{hyphenate(r.reference_type)} & #{r.target.type.base_type} & #{hyphenate(r.browse_name)} & #{type_info} & #{r.rule} \\\\"
        rescue
          $logger.error "#{$!}: #{@name}::#{r.name} #{r.final_target.name} #{r.final_target.type_id} #{r.final_target.type}"
          raise 
        end
      end
    end
  end

  def generate_attribute_docs(f, header)
    
    if not relations.empty? and relations[0].name == 'Supertype' and @model.name.split('Type')[0] == relations[0].final_target.type.name
      generate_types(f,header)
      return
    end


    $logger.info "Generating docs for #{@name}"
    relations_with_documentation =
      @relations.select do |r|
      $logger.debug "  Looking for docs for #{r.target.inspect}" if r.target.type.nil?
      (r.documentation or r.target.type.type == 'uml:Enumeration' or not r.documentation) and @model.name.split('Type')[0] != r.final_target.type.name and r.visibility == 'public'
    end

    unless relations_with_documentation.empty? or (relations_with_documentation[0].name == 'Supertype' and relations_with_documentation.length == 1)

      f.puts <<-EOT
\\begin{table}[ht]
\\centering 
  \\caption{\\texttt{#{header} of #{@name}}}
  \\label{properties:#{@name}}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {#{header}} & {Value} & {Multiplicity} \\\\
\\tabucline[1.5pt]{}
EOT
      
      relations_with_documentation.each do |r|
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

      relations_with_documentation.each do |r|
        if r.name == 'Supertype'
          next
        elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty
          
          name = r.association_name ? r.association_name : r.name
          f.puts "\n\\paragraph{\\texttt{#{name}}}\\mbox{}\n"
          if r.association_doc
            f.puts "\\newline\\tab #{r.association_doc}\n"
          else r.documentation
            f.puts "\\newline\\tab #{r.documentation}\n"
          end
          
          if r.target.type.type == 'uml:Enumeration' and not r.redefinesProperty
            r.target.type.generate_enumerations(f)
            f.puts "\\FloatBarrier"
          end
        end
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

    

    unless relations_with_documentation.empty? or (relations_with_documentation[0].name == 'Supertype' and relations_with_documentation.length == 1)

      f.puts <<-EOT
\\begin{table}[ht]
\\centering 
  \\caption{\\texttt{#{header} of #{@name}}}
  \\label{properties:#{@name}}
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|l|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {#{header}} & {Value} \\\\
\\tabucline[1.5pt]{}
EOT
      
      relations_with_documentation.each do |r|
        name = r.association_name ? r.association_name : r.name         
        
        if name == 'Supertype'
          next
        end
        stereo = r.stereotype ? "<<#{r.stereotype}>> " : nil
        
        if r.redefinesProperty and r.default
          f.puts "\\texttt{#{stereo}#{name}} & \\texttt{#{r.default.gsub(/(\^)/,"\\^{}")}} \\\\"
        else
                  f.puts "\\texttt{#{stereo}#{name}} & \\texttt{#{r.final_target.type.name}} \\\\"
        end
      end

f.puts <<-EOT
\\end{tabu}
\\end{table}
\\FloatBarrier

EOT

  relations_with_documentation.each do |r|
    name = r.association_name ? r.association_name : r.name
  
    if name == 'Supertype'
      next
    elsif (r.association_doc or r.documentation or r.target.type.type == 'uml:Enumeration') and not r.redefinesProperty
      
      f.puts "\n\\paragraph{\\texttt{#{name}}}\\mbox{}\n"
      if r.association_doc
        f.puts "\\newline\\tab #{r.association_doc}\n"
      else r.documentation
        f.puts "\\newline\\tab #{r.documentation}\n"
      end
      
      if r.target.type.type == 'uml:Enumeration' and not r.redefinesProperty 
        r.target.type.generate_enumerations(f)
        f.puts "\\FloatBarrier"
      end
      
    elsif r.redefinesProperty and (name == 'result' or (name == 'type' and not r.default))
      if name == 'result'
        f.puts "\n Enumerated \\texttt{result} values for \\texttt{#{@name}} are:\n"
        r.final_target.type.generate_enumerations(f, false)
        f.puts "\\FloatBarrier"
      elsif name == 'type'
        f.puts "\n Enumerated \\texttt{type}s for \\texttt{#{@name}} are:\n"
        
        f.puts <<-EOT
\\begin{itemize}

EOT
      
        r.final_target.type.literals.each do |lit|
          f.puts "\\item \\texttt{#{lit.name}} : #{lit.description.gsub(/(\^)/,"\\^{}")} \n\n" # "
        end
        

        f.puts <<-EOT
\\end{itemize}

EOT
          end
        end
      end
    end    
  end
  
  def generate_subtypes(f)
    return if @is_subtype == true or @subtypes.length == 0

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
  end


def generate_enumerations(f, new_section = true)
  if @type == 'uml:Enumeration'
    $logger.debug "***** =====> Generating Enumerations for #{@name}"
    
    generate_documentation(f) if new_section


    f.puts <<-EOT
\\begin{table}[ht]
\\centering 
  \\caption{\\texttt{#{escape_name}} Enumeration}
EOT
    unless @@labels.include?(@name)
      f.puts "  \\label{enum:#{@name}}"
      @@labels.add(@name)
    end

    f.puts <<-EOT
\\tabulinesep=3pt
\\begin{tabu} to 6in {|l|X|} \\everyrow{\\hline}
\\hline
\\rowfont\\bfseries {Name} & {Description} \\\\
\\tabucline[1.5pt]{}
EOT
    
    @literals.each do |lit|
      f.puts "\\texttt{#{lit.name}} & #{lit.description.gsub(/(\^)/,"\\^{}")} \\\\"
      end
        
      f.puts <<-EOT
\\end{tabu}
\\end{table} 
EOT
    end
  end

  def generate_dependencies(f)

    deps = dependencies.select { |d|
      d.target.type.stereotype.nil? or not (d.target.type.stereotype =~ /Factory/)
    }

    if !deps.empty? or @mixin
      f.puts "\\paragraph{Dependencies and Relationships}"

      f.puts "\n\\begin{itemize}"
      
      deps.each do |dep|
        target = dep.target
        
        if dep.stereotype and dep.stereotype == 'values' and
          target.type.type == 'uml:Enumeration'
          
          #f.puts "\\item \\textbf{Allowable Values} for \\texttt{#{target.type.name}}"
          f.puts "\\FloatBarrier"
          target.type.generate_enumerations(f)
          f.puts "\\FloatBarrier"
        else
          f.puts "\\item Dependency on #{target.type.name}\n\n"
          rel = dep.stereotype && dep.stereotype
          if rel
            f.puts "This class relates to \\texttt{#{target.type.name}} (#{target.type.reference}) for a(n) \\texttt{#{rel}} relationship.\n\n"
          else
            $logger.error "Cannot find stereo for #{@name}::#{dep.name} to #{target.type.name}"
          end
        end
      end

      f.puts "\\item Mixes in \\texttt{#{@mixin.escape_name}}, see #{@mixin.reference}" if @mixin
      f.puts "\\end{itemize}"
    end
  end

  def generate_data_type(f)
    generate_attribute_docs(f, "Data Type Fields")
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
  
    generate_attribute_docs(f, "Properties")
    generate_dependencies(f) 
    generate_subtypes(f)
  end

  def generate_latex(f = STDOUT)
    # puts "--- Generating #{@name} #{@stereotype}"
    return if @name =~ /Factory/ or @stereotype =~ /metaclass/
    section_name = if defined?(@relations[0].name) and @relations[0].name == 'Supertype' 
      "[#{escape_name}]{#{escape_name} \\\\ {\\small Subtype of #{@relations[0].final_target.type.name}}}"
    else
      "{#{escape_name}}"
    end

    f.puts <<-EOT
\\subsubsection#{section_name}
  \\label{type:#{@name}}

\\FloatBarrier
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
end
