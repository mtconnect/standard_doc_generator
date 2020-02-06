require 'json'
require 'latex_model'

LatexModel.skip_models = SkipModels
LatexModel.new(RootModel).find_definitions

$logger.info "\nGenerating Devices LaTex to #{DocumentFile['Device']}"
File.open(DocumentFile['Device'], 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  f.puts "\\section{Devices Information Model}\n"
  LatexModel.directory = Directory['Device']
  DeviceModels.each do |m|
    LatexModel.generate_latex(f, m)
  end
  
  f.puts "\\section{Configuration}\n"
  ConfigurationModels.each do |c|
    LatexModel.generate_latex(f, c)
  end
  
  f.puts "\\section{MTConnect Profile}\n"
  ProfileModels.each do |p|
    LatexModel.generate_latex(f, p)
  end
end

$logger.info "\nGenerating Observations LaTex to #{DocumentFile['Observation']}"
File.open(DocumentFile['Observation'], 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  f.puts "\\section{Observations Model}\n"
  LatexModel.directory = Directory['Observation']
  ObservationModels.each do |m|
    LatexModel.generate_latex(f, m)
  end

end

