require 'json'
require 'latex_model'

LatexModel.skip_models = SkipModels
LatexModel.new(RootModel).find_definitions

$dataitem_types = {}

LatexModel.models['Sample Types'].types.each do |type|
	$dataitem_types[type.name] = []
	type.children.each do |subtype|
		$dataitem_types[type.name] << subtype
	end
end

LatexModel.models['Event Types'].types.each do |type|
	$dataitem_types[type.name] = []
	type.children.each do |subtype|
		$dataitem_types[type.name] << subtype
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


def section_intro(f,root_model,section_package_name, section_name)
  f.puts "\n\\section{#{section_name}}\n\\label{sec:#{section_name}}\n"
  f.puts get_section_documentation(root_model, section_package_name, section_name)
end


$logger.info "\nGenerating Devices LaTex to #{DocumentFile['Device']}"
$enums = []
File.open(DocumentFile['Device'], 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  section_intro(f,RootModel, "Supporting Documents", "Devices Information Model")

  section_intro(f,RootModel, DeviceModels[1], "Structural Elements for MTConnectDevices")
  LatexModel.directory = Directory['Device']
  DeviceModels.each do |m|
    LatexModel.generate_latex(f, m)
  end
  
  section_intro(f,RootModel, CompositionModels[0], CompositionModels[0])
  CompositionModels.each do |c|
    LatexModel.generate_latex(f, c)
  end
  
  section_intro(f,RootModel, DataItemModels[0], DataItemModels[0])
  DataItemModels.each do |c|
    LatexModel.generate_latex(f, c)
  end
  
  section_intro(f,RootModel, ReferenceModels[0], ReferenceModels[0])
  ReferenceModels.each do |c|
    LatexModel.generate_latex(f, c)
  end

  section_intro(f,RootModel, ConfigurationModels[0], ConfigurationModels[0])
  ConfigurationModels.each do |c|
    LatexModel.generate_latex(f, c)
  end
  
  section_intro(f,RootModel, ProfileModels[0], "MTConnect Profile")
  ProfileModels.each do |p|
    LatexModel.generate_latex(f, p)
  end
end



$logger.info "\nGenerating Observations LaTex to #{DocumentFile['Observation']}"
File.open(DocumentFile['Observation'], 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  section_intro(f,RootModel, "Supporting Documents", "Observations Information Model")
  
  section_intro(f,RootModel, ObservationModels[0], ObservationModels[0])
  LatexModel.directory = Directory['Observation']
  ObservationModels.each do |m|
    LatexModel.generate_latex(f, m)
  end
  
  section_intro(f,RootModel, "Observation Types", "Observation Types")
  ObservationTypes.each do |m|
    LatexModel.generate_latex(f, m)
  end
end


$logger.info "\nGenerating Assets LaTex to #{DocumentFile['Asset']}"
File.open(DocumentFile['Asset'], 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  section_intro(f,RootModel, "Supporting Documents", "Assets Information Model")
  
  section_intro(f,RootModel, AssetModels[0], AssetModels[0])
  LatexModel.directory = Directory['Asset']
  AssetModels.each do |m|
	puts "Generating for #{m}"
    LatexModel.generate_latex(f, m)
  end
end

$logger.info "\nGenerating Glossary LaTex to #{DocumentFile['Glossary']}"
File.open(DocumentFile['Glossary'], 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  LatexModel.directory = Directory['Glossary']
  Glossary.each do |m|
    LatexModel.generate_glossary(f, m)
  end
end
