package :Configuration, 'The component\'s configuration' do
    type :AbstractConfiguration, 'Abstract configuration' do
    abstract
  end
  
  type :ComponentConfiguration, 'The configuration data associated with this component.' do
    mixed
    
    member :Configuration,  'Configuration types', 1..INF, :AbstractConfiguration
  end   
end

load '../schema_dev/sensors'
load '../schema_dev/specifications'
load '../schema_dev/relationships'
load '../schema_dev/coordinate_systems'
