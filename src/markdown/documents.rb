$: << File.dirname(__FILE__)

module Document
  def documentation_name
    "./type-sections/#{short_name}.md"
  end

  def documentation_file_name
    "./#{MarkdownModel.directory}/#{documentation_name}"
  end


  def documentation_exists?
    File.exists?(documentation_file_name)
  end

  def generate_documentation(f, is_tabulated=false)
    tab = is_tabulated ? "    " : ""
    if documentation_exists?
      f.puts "\n{{input(#{documentation_name})}}\n"
    elsif @documentation
      f.puts "\n#{tab}#{@documentation.gsub("\n","\n#{tab}")}\n"
      f.puts "#{tab}#{@additional_documentation.gsub("\n","\n#{tab}")}\n" if @additional_documentation
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
    f.puts "\n# #{section_name}\n\n"
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

    main_md_node = common_docs.at("//*[@body='Main Template MD']")
    main_md_doc = main_md_node.ownedComment['body']

    main_md_doc = main_md_doc.gsub("{{input(%MAIN%)}}","{{input(#{@part_dir}.md)}}")

    File.write(File.join(File.dirname(__FILE__), '../../markdown_documentation', @part_dir, 'main.md'), main_md_doc)

    main_tex_node = common_docs.at("//*[@body='Main Template TEX']")
    main_tex_doc = main_tex_node.ownedComment['body']
    
    main_tex_doc = main_tex_doc.gsub("\\docnum{}","\\docnum{#{@doc_num}}")
    main_tex_doc = main_tex_doc.gsub("\\doctitle{}","\\doctitle{#{@doc_title}}")
    main_tex_doc = main_tex_doc.gsub("\\doctitleshort{}","\\doctitleshort{#{@doc_title}}")
    main_tex_doc = main_tex_doc.gsub("\\versionnum{}","\\versionnum{#{@version_num}}")
    main_tex_doc = main_tex_doc.gsub("\\input{%MAIN%}","\\input{#{@part_dir}.tex}")
    
    File.write(File.join(File.dirname(__FILE__), '../../latex_documentation', @part_dir, 'main.tex'), main_tex_doc)

    generate_mtconnect_doc(common_docs, "MTConnect Class", "mtconnect.cls")
    generate_mtconnect_doc(common_docs, "MTConnect References", "mtc.bib")
    generate_mtconnect_doc(common_docs, "MTConnect Specification and Materials", "legal.md")
    generate_mtconnect_doc(common_docs, "External References", "references.bib")
    generate_mtconnect_doc(common_docs, "Acronyms", "acronyms.md")
    generate_appendix(common_docs)
  end

  def generate_mtconnect_doc(common_docs, node_name, file_name, write_mode = 'w')
    node = common_docs.at("//*[@body='#{node_name}']")
    return if not node

    doc = node.ownedComment['body']
    md_path = File.join(File.dirname(__FILE__), '../../markdown_documentation', @part_dir, file_name)
    tex_path = File.join(File.dirname(__FILE__), '../../latex_documentation', @part_dir, file_name)
    
    if file_name.end_with?('.md')
      File.open(md_path , write_mode) do |f|
        f.write(doc)
      end
    else
      File.open(tex_path , write_mode) do |f|
        f.write(doc)
      end
    end
  end
  
  def generate_part_intro
    supporting_docs = @root_model.at("//packagedElement[@name='Supporting Documents']")
    generate_mtconnect_doc(supporting_docs, @part_dir.capitalize + " Introduction", "introduction.md")
  end
  
  def generate_appendix(common_docs)
    generate_mtconnect_doc(common_docs, "Appendix", "appendix.md")
    supporting_docs = @root_model.at("//packagedElement[@name='Supporting Documents']")
    generate_mtconnect_doc(supporting_docs, @part_dir.capitalize + " Appendix", "appendix.md", 'a')
  end
  
end