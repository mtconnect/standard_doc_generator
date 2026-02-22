
# coding: utf-8
package :ComponentConfigurationParameters, 'Parameters that govern functionality of the related Component' do
  
  basic_type :ParameterValue, 'configured value', :string

  type :Parameter, 'property that determines the characteristic or behavior of an entity' do
    member :Identifier, 'internal identifier, register, or address', :ID
    member :Name, 'descriptive name'
    member :Minimum, 'minimal allowed value', 0..1, :LimitValue
    member :Maximum, 'maximum allowed value', 0..1, :LimitValue
    member :Nominal, 'nominal value', 0..1, :LimitValue
    member :Units, 'engineering units', 0..1
    member :Value, 'configured value', :ParameterValue
  end

  type :Parameters, 'collection of parameters' do
    member :Parameter, 'property that determines the characteristic or behavior of an entity', 1..INF
  end

  type :ParameterSet, 'set of parameters' do
    member :Name, 'name of the parameter set if more than one exists', 0..1
    member :Parameters, 'collection of parameters', 1
  end

  type :ParameterSets, 'collection of parameter sets' do
    member :ParameterSet, 'collection of parameter sets', 1..INF
  end

  type :ComponentConfigurationParameters, 'Parameters that govern functionality of the related Component', :Asset do
    member :ParameterSets, 'collection of parameter sets', 1
    
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end
end
