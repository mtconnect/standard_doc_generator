package :PowerSources, 'collection of power sources' do

  basic_type :PowerSourceValue, 'name of the power source', :string
  attr :ComponentIdRef, 'A reference to a component', :IDREF
  attr :Order, 'optional precedence', :integer

  enum :PowerSourceType, 'type of the power source' do
    extensible
    value :PRIMARY, 'main or principle'
    value :SECONDARY, 'alternate or not primary'
    value :STANDBY, 'held near at hand and ready for use and is uninterruptible'
  end

  type :PowerSources, 'A collection of power sources', :AbstractConfiguration do
    mixed
    member :PowerSource, 'potential energy sources for the component', 1..INF
  end

  type :PowerSource, 'potential energy sources for the component' do
    member :Type, 'type of the power source', :PowerSourceType
    member :Id, 'unique identifier for the power source', :ID
    member :ComponentIdRef, 'reference to the Component providing observations about the power source', 0..1
    member :Order, 'optional precedence for a given power source', 0..1
    member :Value, 'name of the power source', :PowerSourceValue, 1
  end  
end
