
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
  \\label{fig:#{@name} Diagram}
\\end{figure}

\\FloatBarrier

EOT
    end
  end
end