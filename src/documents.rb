

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
  def get_section_documentation(root_model,section_package_name, section_name)
	section_model = root_model.at("//packagedElement[@name='#{section_package_name}']")
	if section_model and section_model.at("//*[@body='#{section_name}']")
		return section_model.at("//*[@body='#{section_name}']").ownedComment['body']
	else
		return ""
	end
  end

  def generate_section_intro(f,root_model,section_package_name, section_name)
    f.puts "\n\\section{#{section_name}}\n\\label{sec:#{section_name}}\n"
    f.puts get_section_documentation(root_model, section_package_name, section_name)
  end
end