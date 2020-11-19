require 'json'
require 'latex_model'
require 'documents'

include Document
include CommonDocument

#Parsing the xmi
xmiDoc = nil
File.open(File.join(File.dirname(__FILE__), '..', 'MTConnect SysML Model.xml')) do |xmi|
  xmiDoc = Nokogiri::XML(xmi).slop!
  RootModel = xmiDoc.at('//uml:Model')
end

$namespaces = Hash[xmiDoc.namespaces.map { |k, v| [k.split(':').last, v] }]

#Defining the LatexModel
SkipModels = Set.new
SkipModels.add('CSV Imports')
SkipModels.add('Simulation')
SkipModels.add('MTConnect')
SkipModels.add('Agent Architecture')
SkipModels.add('Development Process')
SkipModels.add('Files')

LatexModel.skip_models = SkipModels
LatexModel.new(RootModel).find_definitions

$enums = ['DataItemTypeEnum','DataItemSubTypeEnum', 'CompositionTypeEnum']

#Generating Documentation
document_structure = File.read(File.join(File.dirname(__FILE__),'..','config','document_structure.json'))
document_structure_json = JSON.parse(document_structure)

document_structure_json['documents'].each do |partno, partinfo|
  LatexModel.directory = File.join(File.dirname(__FILE__),'..',partinfo['directory'])
  LatexModel.generate_glossary

  #latex variables
  doc_num = partno
  doc_title = partinfo['doc_title']
  version_num = Options[:version] ? Options[:version] : "X.X"
  
  generate_common_docs(RootModel, doc_num, doc_title, version_num, partinfo['directory'])
  
  models = partinfo['models']
  models_main_file = File.join(File.dirname(__FILE__),'..',partinfo['directory'], partinfo['directory']+'.tex')

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
          LatexModel.generate_latex(f, m)
        end
      else
        $logger.error "Invalid model data type #{model.class}"
      end
    end
  end
end

