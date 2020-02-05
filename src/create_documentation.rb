require 'json'
require 'latex_model'

LatexModel.skip_models = SkipModels
LatexModel.new(RootModel).find_definitions

$logger.info "\nGenerating Devices LaTex to #{DeviceDocumentFile}"
File.open(DeviceDocumentFile, 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  f.puts "\\section{Devices Information Model}\n"
  LatexModel.directory = DeviceDirectory
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

