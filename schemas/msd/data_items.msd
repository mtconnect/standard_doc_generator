
package :DataItems, 'Data Items Package' do
  attr :SampleInterval, 'The interval between adjacent sampleing of data', :float
  attr :DataItemSampleRate, 'The frequency a measurement is sampled', :float
  attr :DataItemOption, 'The constrained value for this data item'
  attr :DataItemValue, 'The constrained value for this data item'
  attr :DataItemNumericValue, 'The constrained value for this data item', :float
  attr :SourceComponentId, 'An idref to the component id', :IDREF
  attr :SourceDataItemId, 'An idref to the data item id', :IDREF
  attr :ReferenceId, 'The item\'s reference to the data item or specificatiton', :IDREF
  attr :ComponentName, 'The name of a related component', :NMTOKEN
  attr :CoordinateSystemId, 'The id reference for the coordinate system associated with this data item', :IDREF
  attr :Discrete, 'An discrete event', :boolean

  type :DataItemDescription, 'The description of a data item, can be free form text or elements' do
    mixed
    member :any, 'Any elements', 0..INF
  end  
  
  basic_type :FilterValue, 'The minimum limit on the change in a value', :float
  
  # Measurement types
  enum :Category, 'The measurement sampling type' do
    value :EVENT, 'An event represents a change in state occurs at a point in time. Note: An event does not occur at predefined frequencies.'
    value :SAMPLE, 'A sample is a data point for continuous data items, that is, the value of a data item at a point in time.'
    value :CONDITION, 'The condition of the device'
  end
  
  attr :NativeScale, 'The multiplier for the native value. Conversion divides by this value', :float

  # Data item types and sub types have been moved to common.  
  enum :Representation, 'The possible representations of a DataItem' do
    Glossary.representations.each do |name, val|
      value(name, val['description'])
    end
  end

  enum :DataItemFilterEnum, 'The type of filter' do
    Glossary.filters.each do |name, val|
      value(name, val['description'])
    end
  end

  # Measurement types
  
  type :DataItems, 'A generic list of measurements for all axis' do
    member :DataItem, 'A measurement for this component', 1..INF
  end

  type :DataItem, 'A abstract measurement' do
    member :Name, 'The optional implementors name of the measurement.', 0..1
    member :id, 'The data item identifier', :ID
    member :Type, 'The type of measurement', :DataItemEnum
    member :SubType, 'The sub type for the measurement', 0..1, :DataItemSubEnum
    member :Statistic, 'The statistical operation on this data', 0..1, :DataItemStatistics
    member :Units, 'The units of the measurement', 0..1
    member :NativeUnits, 'The units as expressed by the machine', 0..1
    member :NativeScale, 'The units as expressed by the machine', 0..1
    member :Category, 'The category of the data item'
    member :CoordinateSystem, 'The coordinate system used for the positions', 0..1, :CoordinateSystemEnum
    member :CoordinateSystemId, 'The coordinate system reference to a particular coordinate system', 0..1
    member :CompositionId, 'The optional composition identifier', 0..1
    member :SampleRate, 'Used as the default sample rate for waveforms', 0..1, :DataItemSampleRate
    member(:Representation, 'The data item\'s representation', 0..1) { self.default = :VALUE } 
    member :SignificantDigits, 'The number of significant digits for this data item', 0..1, :SignificantDigitsValue
    
    member :Source, 'Additional information about the component, channel, register, etc... that collects the data.', 0..1, :DataItemSource
    member :Constraints, 'Limits on the set of possible values', 0..1, :DataItemConstraints
    member :Filters, 'Limits on the set of possible values', 0..1, :Filters
    element :InitialValue, 'The initial value for counters', 0..1, :DataItemNumericValue
    element :ResetTrigger, 'The event that triggers the resetting of this counter', 0..1, :DataItemResetValue
    member(:Discrete, 'If this is a discrete event', 0..1) { self.default = 'false' }

    member :Definition, 'The descriptive information about this data item', 0..1, :DataItemDefinition
    member :Relationships, 'Organizes DataItemRelationship and SpecificationRelationship', 0..1, :DataItemRelationships
  end
  
  type :DataItemConstraints, 'A set of limits for a data item' do
    choice(0..1) do
      set do
        member :Value, 'A possible value for this data item. Used for controlled vocabularies.', 1..INF, :DataItemValueElement
      end
      set do
        member :Minimum, 'A minimum value for this data item.', 0..1, :DataItemNumericValue
        member :Maximum, 'A maximum value for this data item.', 0..1, :DataItemNumericValue
        member :Nominal, 'A nominal value for this data item.', 0..1, :DataItemNumericValue
      end
    end
    member :Filter, 'DEPRECATED: A limit on the amount of data by specifying the minimal delta required.', 0..1, :DataItemFilter
  end
  
  type :Filters, 'A set of filters' do
    member :Filter, 'A limit on the amount of data by specifying the minimal delta required.', 1..INF, :DataItemFilter
  end
  
  type :DataItemBase, 'A starting point for a data item' do
    member :Value, 'The base value', :DataItemValue
  end
          
  type :DataItemValueElement, 'The value element' do
    member :Value, 'A possible value for this data item', :DataItemOption
  end

  type :DataItemFilter, 'The filter for the data item' do
    member :Value, 'A numeric value that limits the data depending on it\'s change. Change must be greater than this value.', :FilterValue
    member :Type, 'The type of filter, ABSOLUTE or PERCENT', :DataItemFilterEnum
  end
  
  type :DataItemSource, 'A native data source' do
    member :DataItemId, 'The optional data item within the source component that provides the underlying data', 0..1, :SourceDataItemId
    member :ComponentId, 'The component that is collecting the data associated with this data item', 0..1, :SourceComponentId
    member :CompositionId, 'The optional composition identifier for the source of this data item', 0..1
    member :Value, 'The source or channel for this data', :ItemSource
  end

  type :DataItemDefinition, 'The DataItem Definition' do
    member :Description, 'The description of the data item', 0..1, :DataItemDescription
    member :EntryDefinitions, 'The aggergate of entry definitions', 0..1
    member :CellDefinitions, 'The aggregate of cell definitions', 0..1
  end

  type :EntryDefinitions, 'The aggergation of EntryDefinition' do
    member :EntryDefinition, 'An entry definition', 1..INF
  end

  attrs :DefinitionAttrs, 'The attributes for a definition' do
    member :Key, 'unique key', 0..1
    member :Type, 'The type of measurement', 0..1, :DataItemEnum
    member :KeyType, 'The type of measurement', 0..1, :DataItemEnum
    member :SubType, 'The sub type for the measurement', 0..1, :DataItemSubEnum
    member :Units, 'The units of the measurement', 0..1
  end    

  type :EntryDefinition, 'The entry definition' do
    member :DefinitionAttrs, 'Attributes for the definition'
    member :Description, 'The description of the data item', 0..1, :DataItemDescription
    member :CellDefinitions, 'Optional definitions for cells', 0..1
  end

  type :CellDefinitions, 'The aggergation of CellDefinition' do
    member :CellDefinition, 'A cell definition', 1..INF
  end

  type :CellDefinition, 'The definition of a tabular cell' do
    member :DefinitionAttrs, 'Attributes for the definition'
    member :Description, 'The description of the data item', 0..1, :DataItemDescription
  end

  type :DataItemRelationships, 'Organizes DataItemRelationship and SpecificationRelationship' do
    member :AbstractDataItemRelationship, 'A data item relationship', 1..INF
  end

  type :AbstractDataItemRelationship, 'Common base for data item relationship' do
    abstract
    member :Name, 'A descriptive name associated with this Relationship'
    member :IdRef, 'A reference to the related DataItem id.', :ReferenceId
  end

  enum :DataItemRelationshipTypeEnum, 'How the data items are related' do
    value :ATTACHMENT, 'A reference to a DataItem that associates the values with an external entity'
    value :COORDINATE_SYSTEM, 'The referenced DataItem provides the id of the effective Coordinate System'
    value :LIMIT, 'The referenced DataItem provides process limits.'
    value :OBSERVATION, 'The referenced DataItem provides the observed values.'
  end

  type :DataItemRelationship, 'A Relationship providing a semantic reference to another DataItem described by the type property.',
       :AbstractDataItemRelationship do
    member :type, 'Specifies how the DataItem is related', :DataItemRelationshipTypeEnum
  end
  
  enum :SpecificationRelationshipTypeEnum, 'How the data items are related' do
    value :LIMIT, 'The referenced DataItem provides process limits.'
  end

  type :SpecificationRelationship, 'A Relationship providing a semantic reference to a Specification described by the type and "idref" property.',
       :AbstractDataItemRelationship do
    member :type, 'Specifies how the Specification is related', :SpecificationRelationshipTypeEnum
  end
       
end
