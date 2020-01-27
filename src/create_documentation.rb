require 'json'
require 'latex_model'

LatexModel.skip_models = SkipModels
LatexModel.new(RootModel).find_definitions

$logger.info "\nGenerating Devices LaTex to #{DeviceDocumentFile}"
File.open(DeviceDocumentFile, 'w') do |f|
  f.puts "% Generated #{Time.now}"
  
  LatexModel.directory = DeviceDirectory
  DeviceModels.each do |m|
    LatexModel.generate_latex(f, m)
  end
end

