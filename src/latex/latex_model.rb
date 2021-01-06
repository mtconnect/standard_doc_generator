$: << File.dirname(__FILE__)

require 'latex_type'
require 'lib/model'

class LatexModel < Model
  include Diagram
  include Document

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
	  if model.end_with?('Types')
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
      fs.puts "\\subsection{#{@name}} \\label{sec:#{@name}}"
      
	  generate_diagram(fs)
      
      generate_documentation(fs)
      
      @types.each do |type|
        if type.parent.nil? or type.parent.model != self
          recurse_types(fs, type)
        end
      end
    end
  end
  
  def self.generate_glossary

	model = "Glossary"
    File.open(File.join(@@directory, "glossary.tex"), "w") do |fs|
		@@models[model].types.each do |type|
			if type.parent.nil? or type.parent.model != self
				@@models[model].recurse_terms(fs, type)
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

  def recurse_types(f, type)
    if  (type.type == 'uml:Class' or type.type == 'uml:Stereotype' or type.type == 'uml:DataType')
      type.generate_latex(f) 
    end

    type.children.each do |t|
      recurse_types(f, t) if t.model == self
    end
  end  
 
  def recurse_terms(f, type)
	type.generate_glossary_docs(f)
  end 

end
