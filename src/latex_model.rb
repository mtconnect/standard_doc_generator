require 'latex_type'
require 'model'

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
	  if model == 'Glossary'
		@@models[model].generate_glossary(f)
      else
		@@models[model].generate_latex(f)
	  end
    else
      $logger.fatal "Cannot find model: #{model}"
      exit @@models[model]
    end
  end
  
  def generate_latex(f)
    file = "model-sections/#{short_name}.tex"
    f.puts "\\input #{file}"
    File.open(File.join(@@directory,"model-sections",short_name+".tex"), "w") do |fs|
      $logger.info "Generating model #{@name}"
      fs.puts "% Generated #{Time.now}"
      fs.puts "\\subsection{#{@name}} \\label{sec:#{short_name}}"
      
      generate_diagram(fs)
      
      generate_documentation(fs)
      
      @types.each do |type|
        if type.parent.nil? or type.parent.model != self
          recurse_types(fs, type)
        end
      end
    end
  end
  
  def generate_glossary(f)
	f.puts <<-EOT
\n\\printglossary\n
\n\\printbibliography[title=MTConnect References,keyword=MTC]\n
\n\\printbibliography[title=Other References,notkeyword=MTC]\n
\n\\nolinenumbers\n\n\\glsaddallunused\n\n\\nolinenumbers\n\n\\linenumbers\n
EOT

    File.open(File.join(@@directory,"model-sections",short_name+".tex"), "w") do |fs|
		@types.each do |type|
			if type.parent.nil? or type.parent.model != self
				recurse_terms(fs, type)
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
    if  (type.type == 'uml:Class' or type.type == 'uml:Stereotype' or # type.type == 'uml:AssociationClass' or
        type.type == 'uml:DataType') and type.is_subtype != true
      type.generate_latex(f) 
    end

    type.children.each do |t|
      recurse_types(f, t) if t.model == self
    end
  end  
   
  def recurse_terms(f, type)
	type.generate_glossary_docs(f)

    type.children.each do |t|
      recurse_terms(f, t) if t.model == self
    end
  end 

  def self.generate_subtypes
	dataitem_types = {}
	@@models['Sample Types'].types.each do |type|
	  dataitem_types[type.name] = []
	  type.children.each do |subtype|
		dataitem_types[type.name] << subtype
	  end
    end
	@@models['Event Types'].types.each do |type|
	  dataitem_types[type.name] = []
	  type.children.each do |subtype|
		dataitem_types[type.name] << subtype
	  end
    end
	return dataitem_types
  end
end
