# coding: utf-8

package :Events, 'Event Package' do
  basic_type(:IntegerEventValue, 'Integer event value') {
    union(:integer, :UnavailableValue)
  }
  basic_type(:FloatEventValue, 'Integer event value') {
    union(:float, :UnavailableValue)
  }
  basic_type(:StringEventValue, 'Srring event value') {
    union(:string, :UnavailableValue)
  }
  basic_type(:StringListValue, 'A list of axis names') {
    list(:string)
  }
  basic_type(:StringListEventValue, 'A list of axis for an event') {
    union(:StringListValue, :UnavailableValue)
  }

  type :Event, 'An abstract event' do
    abstract
    mixed
    member :Observation, 'The attributes for all observations'
    attribute :ResetTriggered, 'An optional indicator that the event or sample was reset', 0..1, :DataItemResetValue
  end

  type :StringEvent, 'An unfaceted string event', :Event do
    member :Value, 'A string value', :StringEventValue
  end

  type :StringListEvent, 'An unfaceted string event', :Event do
    member :Value, 'A string value', :StringListEventValue
  end

  type :IntegerEvent, 'An event with an integer value', :Event do
    member :Value, 'A string value', :IntegerEventValue
  end

  type :FloatEvent, 'An event with an integer value', :Event do
    member :Value, 'A string value', :FloatEventValue
  end

  facets = { "string" => :StringEvent,
             "integer" => :IntegerEvent,
             "float" => :FloatEvent,
             "arraystring" => :StringListEvent,
			 "enumeration" => :StringEvent}

  Glossary.events.each do |name, event|
    unless event['parent'] == 'Event' and name != "Alarm"
      next
    end
    
    value_type = facets[event['facet']]
    unless value_type
      puts "Warning: Cannot find facet for '#{name}' facet #{event['facet']}, defaulting to string" 
      value_type = :StringEvent
    end
    
    if event['enums'] != ""
      value_type = "#{name}Value".to_sym
      enum(value_type, "Controlled vocabulary for #{name}") do
        event['enums'].each do |literal_name, literal|
          value(literal_name, literal['description'])
        end
        value(:UNAVAILABLE, 'Value is indeterminate')
      end
      
      type(name.to_sym, event['description'], :Event) do
        member :Value, "the value for #{name}", value_type
      end
    else
      type(name.to_sym, event['description'], value_type)      
    end
    
  end

  %w{AssetChanged AssetRemoved}.each do |s|
    self.schema.type(s.to_sym).member(:AssetType, 'The type of asset', :AssetAttrType)
  end
      
  # Create discrete events for non-state events
  %w{PartCount ToolId ToolNumber ToolAssetId PalletId Message Block}.each do |s| 
    type = self.schema.type(s.to_sym) 
    self.type "#{type.name}Discrete".to_sym, "Discrete of #{type.annotation}", type.name
  end
end
