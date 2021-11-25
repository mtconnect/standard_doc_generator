$: << File.dirname(__FILE__)

require 'lib/model'
require 'latex_type'
require 'markdown_parser'

class LatexModel < Model
  include Document
  include MarkDownParser
    
  def self.directory=(dir)
    @@directory = dir
  end

  def self.directory
    @@directory
  end

  def self.type_class
    LatexType
  end

  def self.generate_latex(f, model)
    if @@models[model]
	  if model.end_with?('Types') or model == "DataItem Types for Interface"
		@@models[model].types.sort_by! { |t| t.name }
		@@models[model].generate_subtypes(model)
	  end
	  @@models[model].generate_latex(f)
    else
      $logger.fatal "Cannot find model: #{model}"
      exit @@models[model]
    end
  end
  
  def generate_latex(f)
    file = "model-sections/#{short_name}.tex"
    f.puts "\n\\input #{file}\n"
    File.open(File.join(@@directory,"model-sections",short_name+".tex"), "w") do |fs|
      $logger.info "Generating model #{@name}"
      fs.puts "% Generated #{Time.now}"
      fs.puts "\\subsection{#{@name}} #{LatexType.get_label("sec:#{@name}")}"
	  LatexType.add_label = "sec:#{@name}"
      
      generate_documentation(fs)
      
      @types.each do |type|
        if type.parent.nil? or type.parent.model != self
          recurse_types(fs, type)
        end
      end
    end
  end
  
  def self.generate_glossary(glossary_config)

	File.open(File.join(@@directory, "glossary.tex"), "w") do |fs|
		glossary_config.each do |glossary_name, glossary_info|
			@@models[glossary_info['model']].types.each do |type|
				if type.parent.nil? or type.parent.model != self
					@@models[glossary_info['model']].recurse_terms(fs, type, glossary_info['type'])
				end
			end
		end
	end
  end

  def self.generate_profile(f, profile_config)
	profile_config.each do |profile_type, profile_info|
		
		f.puts "\n\\subsection{#{profile_type}} \n\\label{sec:#{profile_type}}\n\n"
		f.puts "#{format_diagram("!#{profile_type}.png!")}"
		
		@@models[profile_info['model']].types.each do |type|
			if type.type == 'uml:DataType' or type.type == 'uml:Stereotype'
				type.generate_profile_docs(f)
			end
		end
	end
  end

  def self.generate_subtypes
	models = ["Sample Types", "Event Types", "Condition Types", "DataItem Types for Interface"]
	list_of_types = []
	
	models.each do |model|
	  @@models[model].types.each do |type|
		if type.relation("type")
		  list_of_types << type.id
		  type_name = type.relation("type").default.gsub(/_/,"\\textunderscore ")
	      $dataitemtypes[type_name] = {} unless $dataitemtypes.include?(type_name)
		  $dataitemtypes[type_name]['subTypes'] = [] if model!="Condition Types"
		end
	  end
	end
	
	models.each do |model|
	  @@models[model].types.each do |type|
        type.relations.each do |rel|
		  if list_of_types.include?(rel.final_target.type.id) and model!="Condition Types"
			$dataitemtypes[rel.final_target.type.relation("type").default.gsub(/_/,"\\textunderscore ")]['subTypes'] << "\\texttt{#{type.relation("subType").default.gsub(/_/,"\\textunderscore ")}}"
		  end
		end
	  end
	end
	
	
  end  
  

  def generate_subtypes(model)
	list_of_types = []
	
	@types.each do |type|
	  list_of_types << type.id
	end
	
	@types.each do |type|
        if not (type.parent.nil? or type.parent.model != self)
          type.relations.each do |rel|
			if list_of_types.include?(rel.final_target.type.id)
				rel.final_target.type.subtypes << type
				type.is_subtype = true
			end
		  end
        end
      end
  end

  def recurse_types(f, type, parent = '')
    parent = parent != '' ? parent : type
    if  (type.type == 'uml:Class' or type.type == 'uml:AssociationClass' or type.type == 'uml:Stereotype' or type.type == 'uml:DataType')
      type.generate_latex(f, parent) 
    end

    type.children.each do |t|
      recurse_types(f, t, parent) if t.model == self
    end
  end  
 
  def recurse_terms(f, type, glossary_type)
	type.generate_glossary_docs(f, glossary_type)
  end 

end
