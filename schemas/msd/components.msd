
package :Component, 'Top Level Components Package' do
  attr :ComponentStation, 'The station id for this device'
  attr :Iso841Class, 'The ISO 841 classification for the device', :integer
  attr :Model, 'The model name'
  
  type :Devices, 'The top level components' do
    member :Agent, 'The Agent Device', 0..1
    member :Device, 'A piece of equipment', 1..INF
  end
  
  type :Component, "An abstract component type. This is a placeholder for all components" do
    abstract
    member :id, 'The data item identifier', :ID
    member :NativeName, 'The device manufacturer component name', 0..1, :Name
    member :SampleInterval, 'The rate at which the data is sampled from the component', 0..1
    member :SampleRate, 'DEPRECATED: The rate at which the data is sampled from the component', 0..1, :DataItemSampleRate
    member :Description, 'The descriptive information about this component', 0..1, :ComponentDescription
    member :Configuration, 'The configuration information about this component', 0..1, :ComponentConfiguration
    member :DataItems, 'The component\'s Data Items', 0..1
    member :Components, 'The sub components', 0..1
    member :Compositions, 'A list of composition elements', 0..1
    member :References, 'A list of references', 0..1
  end

  type :ComponentDescription, 'The descriptive information. This can be manufacturer specific' do
    mixed
    
    member :Manufacturer, 'The manufacturer', 0..1, :Name
    member :Model, 'The model', 0..1
    member :SerialNumber, 'The serial number', 0..1, :SerialNumberAttr
    member :Station, 'The station location', 0..1, :ComponentStation
    member :any, 'The content of the description can text or XML elements', 0..INF
  end
  
  type :CommonComponent, "An abstract component that has an optional uuid", :Component do 
    member :Uuid, 'The component\'s universally unique id.', 0..1
    member :Name, 'The component\'s name', 0..1
  end

  type :Components, 'A list of generic components' do
    member :Component, 'Any component', 1..INF
  end

  type :Device, 'A Device', :Component do
    standards :OMAC => 'resources'
    member :Iso841Class, 'DEPRECATED: The device\'s ISO-841 classification', 0..1
    member :Uuid, 'The components universally unique id. This can be composed of the manufactures id or name and the serial number.'
    member :Name, 'The Device name.'
    member :mtconnectVersion, 'The MTConnect version of the Devices Information Model used to configure the information to be published for a piece of equipment in an MTConnect Response Document', 0..1, :Version
  end

  type :Agent, 'The Agent Device is a Device representing the MTConnect Agent and all its connected data sources.', :Device

  Glossary.components.each do |name, component|
    parent = :CommonComponent
    if component['parent'] != 'Component'
      parent = component['parent'].to_sym
    end
    t = type name.to_sym, component['description'], parent
  end

  # Composition Information
  type :Compositions, "A collection of sub elements" do
    member :Composition, 'An assembly of a component', 1..INF
  end

  enum :CompositionEnumType, 'The vocab for the type of composition' do
    extensible

    Glossary.compositions.each do |name, val|
      value(name, val['description'])
    end
  end

  type :Composition, "An abstract element" do
    member :id, 'The data item identifier', :ID
    member :Uuid, 'The composition\'s universally unique id.', 0..1
    member :Name, 'The data item identifier', 0..1
    member :Type, 'The type of composition', :CompositionEnumType
    member :Description, 'The descriptive information about this sub element', 0..1, :ComponentDescription
    member :Configuration, 'The configuration information about this component', 0..1, :ComponentConfiguration
  end  
end

load File.join(File.dirname(__FILE__), 'reference')
load File.join(File.dirname(__FILE__), 'configuration')

