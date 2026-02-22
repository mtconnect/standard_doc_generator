package :Configuration, 'The component\'s configuration' do
  
  type :ComponentConfiguration, 'The configuration data associated with this component' do
    mixed
    
    member :Configuration,  'Configuration types', 1..INF, :AbstractConfiguration
  end
end

load File.join(File.dirname(__FILE__),'sensors')
load File.join(File.dirname(__FILE__),'specifications')
load File.join(File.dirname(__FILE__),'relationships')
load File.join(File.dirname(__FILE__),'coordinate_systems')
load File.join(File.dirname(__FILE__),'motion')
load File.join(File.dirname(__FILE__),'solid_model')
load File.join(File.dirname(__FILE__),'image_files')
load File.join(File.dirname(__FILE__),'power_sources')
