require 'markdown_parser'
include MarkDownParser

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
      f.puts "\n\n\\input #{documentation_name}\n\n"
    elsif @documentation
      f.puts "\n\n#{format_markdown(@documentation)}\n\n"
    end
  end
  def get_section_documentation(root_model,section_package_name, section_name)
	section_model = root_model.at("//packagedElement[@name='#{section_package_name}']")
	if section_model and section_model.at("//*[@body='#{section_name}']")
		return format_markdown(section_model.at("//*[@body='#{section_name}']").ownedComment['body'])
	else
		return ""
	end
  end

  def generate_section_intro(f,root_model,section_package_name, section_name)
    f.puts "\n\\section{#{section_name}}\n\\label{sec:#{section_name}}\n\n"
    f.puts get_section_documentation(root_model, section_package_name, section_name)
  end
end

module CommonDocument
  attr_reader :root_model, :doc_num, :doc_title, :version_num, :part_dir
  
  def generate_common_docs(root_model, doc_num, doc_title, version_num, part_dir)
  
	@root_model, @doc_num, @doc_title, @version_num, @part_dir = root_model, doc_num, doc_title, version_num, part_dir
	
	generate_main()
	generate_part_intro()
  end

  def generate_main
	common_docs = root_model.at("//packagedElement[@name='Common Documents']")

	main_doc_node = common_docs.at("//*[@body='Main Template']")
	main_doc = main_doc_node.ownedComment['body']
	
	main_doc = main_doc.gsub("\\docnum{}","\\docnum{#{@doc_num}}")
	main_doc = main_doc.gsub("\\doctitle{}","\\doctitle{#{@doc_title}}")
	main_doc = main_doc.gsub("\\doctitleshort{}","\\doctitleshort{#{@doc_title}}")
	main_doc = main_doc.gsub("\\versionnum{}","\\versionnum{#{@version_num}}")
	main_doc = main_doc.gsub("\\input{%MAIN%}","\\input{#{@part_dir}.tex}")
	
	File.open(File.join(File.dirname(__FILE__), '..', @part_dir, 'main.tex'), 'w') do |f|
	  f.write(main_doc)
	end
	
	generate_mtconnect_doc(common_docs, "MTConnect Class", "mtconnect.cls")
	generate_mtconnect_doc(common_docs, "MTConnect References", "mtc.bib")
	generate_mtconnect_doc(common_docs, "MTConnect Specification and Materials", "legal.tex")
	generate_mtconnect_doc(common_docs, "External References", "references.bib")
	generate_mtconnect_doc(common_docs, "Acronyms", "acronyms.tex")
	generate_appendix(common_docs)
  end

  def generate_mtconnect_doc(common_docs, node_name, file_name, write_mode = 'w')
	node = common_docs.at("//*[@body='#{node_name}']")
	return if not node

	doc = format_markdown(node.ownedComment['body'])
	
	File.open(File.join(File.dirname(__FILE__), '..', @part_dir, file_name), write_mode) do |f|
	  f.write(doc)
	end
  end
  
  def generate_part_intro
	supporting_docs = @root_model.at("//packagedElement[@name='Supporting Documents']")
	generate_mtconnect_doc(supporting_docs, @part_dir.capitalize + " Introduction", "introduction.tex")
  end
  
  def generate_appendix(common_docs)
	generate_mtconnect_doc(common_docs, "Appendix", "appendix.tex")
	supporting_docs = @root_model.at("//packagedElement[@name='Supporting Documents']")
	generate_mtconnect_doc(supporting_docs, @part_dir.capitalize + " Appendix", "appendix.tex", 'a')
  end
  
end