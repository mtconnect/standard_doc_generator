$: << File.dirname(__FILE__)

require 'json'
require 'markdown/markdown_model'
require 'markdown/documents'

include Document
include CommonDocument

#Parsing the xmi
xmiDoc = nil
File.open(File.join(File.dirname(__FILE__), '..', 'MTConnect SysML Model.xml')) do |xmi|
  xmiDoc = Nokogiri::XML(xmi).slop!
  RootModel = xmiDoc.at('//uml:Model')
end

$namespaces = Hash[xmiDoc.namespaces.map { |k, v| [k.split(':').last, v] }]

#Defining the MarkdownModel
SkipModels = Set.new
SkipModels.add('CSV Imports')
SkipModels.add('Simulation')
SkipModels.add('MTConnect')
SkipModels.add('Agent Architecture')
SkipModels.add('Development Process')
SkipModels.add('Examples')

MarkdownModel.skip_models = SkipModels
MarkdownModel.new(RootModel).find_definitions

$enums = ['DataItemTypeEnum','DataItemSubTypeEnum','CompositionTypeEnum','CodeEnum']

$dataitemtypes = Hash.new
MarkdownModel.generate_subtypes

#Generating Documentation
document_structure = File.read(File.join(File.dirname(__FILE__),'..','config','document_structure.json'))
document_structure_json = JSON.parse(document_structure)

document_structure_json['documents'].each do |partno, partinfo|
  directory_name = partinfo['directory']
  directory_path = File.join(File.dirname(__FILE__),'..','markdown_documentation',directory_name)
  MarkdownModel.directory = directory_path
  MarkdownModel.generate_glossary(document_structure_json['glossary'])

  #Markdown variables
  doc_num = partno
  doc_title = partinfo['doc_title']
  version_num = Options[:version] ? Options[:version] : "X.X"
  
  generate_common_docs(RootModel, doc_num, doc_title, version_num, directory_name)
  
  models = partinfo['models']
  models_main_file = File.join(directory_path, directory_name+'.md')

  File.open(models_main_file,'w') do |f|
    models.each do |model|
      if model.is_a? String
        generate_section_intro(f,RootModel, 'Supporting Documents', model)
      
      elsif model.is_a? Hash
        section_heading = model.keys[0]
        package_name = model[section_heading][0]
        generate_section_intro(f,RootModel, package_name, section_heading)
        
        $logger.info "\nGenerating Documents for #{section_heading}"
        model[section_heading].each do |m|
          MarkdownModel.generate_md(f, m)
        end
      else
        $logger.error "Invalid model data type #{model.class}"
      end
    end
  end
  
  #MTConnect Profile
  $logger.info "\nGenerating MTConnect Profile"
  File.open(File.join(MarkdownModel.directory, "profile.md"), "w") do |f|
	  generate_section_intro(f,RootModel, 'Supporting Documents', 'MTConnect Profile')
	  MarkdownModel.generate_profile(f, document_structure_json['profile'])
  end
  
  load 'markdown/markdown_merger.rb'
  load 'latex/generate_latex.rb'
end

