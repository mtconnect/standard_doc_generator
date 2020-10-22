
package :Streams, 'Event Package' do
  basic_type :ResultValue, 'An events data'
  
  attr :DataItemId, 'The item\'s unique ID that references the data item id from probe', :NMTOKEN
  attr :NativeCode, 'An Condition code as defined by the component'

  type :Streams, 'Event container for all component events' do
    member :DeviceStream, 'The data from a device', 0..INF
  end

  type :DeviceStream, 'Data related to a single device' do
    member :ComponentStream, 'The data for each component', 0..INF
    member :Name, 'The component name'
    member :Uuid, 'The unque identifier for this device'
  end

  type :ComponentStream, 'The stream of data for a component' do
    member :ComponentId, 'The id of the component (maps to the id from probe)'
    member :Name, 'The component name', 0..1
    member :NativeName, 'The device manufacturer component name', 0..1, :Name
    member :Component, 'The type of the component', :Name
    member :Uuid, 'The unque identifier for this component', 0..1
    member :Samples, 'A collection of samples', 0..1
    member :Events, 'A collection of events', 0..1
    member :Condition, 'A collection of conditions', 0..1, :ConditionList
  end

  type :Samples, 'A collection of samples for this component' do
    member :Sample, 'A subtype of sample', 1..INF
  end

  type :Events, 'A collection of events and alarms for this component' do
    member :Event, 'A subtype of event', 1..INF
  end
  
  type :ConditionList, 'A collection of conditions' do
    member :Condition, 'A subtype of a condition', 1..INF 
  end
  
  enum :UnavailableValue, 'The observation value for indeterminent data' do
    value :UNAVAILABLE, 'Data is unavailable'
  end

  attrs :Observation, 'Attributes for an observation' do
    member :Sequence, 'The events sequence number'
    member :SubType, 'The event subtype corresponding to the measurement subtype', 0..1, :DataItemSubEnum
    member :Timestamp, 'The time the event occurred or recorded'
    member :Name, 'The name of the event corresponding to the measurement', 0..1
    member :DataItemId, 'The unique identifier of the item being produced'
    member :CompositionId, 'The identifier of the sub-element this result is in reference to', 0..1
  end    
end
