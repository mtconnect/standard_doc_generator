# coding: utf-8


package :common, 'Common attributes and elements for all schemas' do
  attr :Sender, 'The sender of the message'
  attr :CreationTime, 'The date and time the document was created', :dateTime
  attr(:Sequence, 'A sequence number', :integer) do
    facet 'minIncl=1;maxExcl=18446744073709551615'
  end
  attr :TestIndicator, 'A debugging flag for testing.', :boolean
  attr(:InstanceId, 'The instance number of the agent, used for fault tolerance', :integer) do
    facet 'minIncl=1;maxExcl=18446744073709551615'
  end
  attr(:BufferSize, 'The size of the agents buffer', :integer) do 
    facet 'minIncl=1;maxExcl=4294967295'
  end
  attr :Validation, 'indicates if the Agent is validating against the normative model', :boolean
  
  attr :Timestamp, 'The time the sample was reported', :dateTime
  attr :OccurrenceTime, 'The time a sample occurred', :dateTime
  attr :Version, 'A version number', :NMTOKEN
  attr :Name, 'A short name for any element'
  attr :Uuid, 'A universally unique id that uniquely identifies the element for it\'s entire life'
  attr :SerialNumberAttr, 'A serial number for a piece of equipment'
  attr :Model, 'The model name'
  attr :ItemSource, 'The measurement source'
  attr :Rate, 'A sample rate in milliseconds per sample', :float
  attr :ComponentId, 'The id of the component (maps to the id from probe)', :ID
  attr :ID, 'An identifier', :ID
  attr :SignificantDigitsValue, 'The number significant digits', :integer
  attr :CompositionId, 'The item\'s reference to the Device model composition', :NMTOKEN
  attr :DurationTime, 'A length of time in seconds', :float
  attr :Removed, 'A flag indicating the item has been removed', :boolean
  attr :Key, 'The key for adata set', :NMTOKEN
  attr :DeviceModelChangeTime, 'A timestamp in 8601 format of the last update of the Device information for any device', :dateTime
  
  attr :AssetId, 'The unique id of the asset'
  attr :AssetAttrType, 'An asset type'
  attr :Hash, 'secure one way hash function'
  attr(:AssetBufferSize, 'The maximum number of assets', :integer) do
    facet 'minIncl=1;maxExcl=4294967295'
  end
  attr(:AssetCountAttr, 'The number of assets', :integer) do
    facet 'minIncl=0;maxExcl=4294967295'    
  end

  basic_type(:FloatListValue, 'Common floating point sample value') {
    list(:float)
  }
  basic_type(:ThreeSpaceValue, 'A three dimensional value \'X Y Z\' or \'A B C\'', :FloatListValue) {
    facet('max=3;min=3')
  }

  basic_type :LimitValue, 'The limit of a value', :float

  attr :FloatEntryValue, 'Entry with only float data type', :float

  type :ThreeDimensionalEntry, 'A three dimensional dataset \'X Y Z\' or \'A B C\'' do
    abstract
    ordered
    member :Key, 'the key'
    member :Value, '', :FloatEntryValue
  end

  type :XYZDataSet, 'A Configuration element with three dimensional value X,Y,Z' do
    ordered
    member :Entry, '3D float Entry type', 0..3, :ThreeDimensionalEntry
  end

  type :ABCDataSet, 'A Configuration element with three dimensional value A,B,C' do
    ordered
    member :Entry, '3D float Entry type', 0..3, :ThreeDimensionalEntry
  end

  basic_type :DescriptionText, 'A description'
  enum :DataItemEnum, 'The types of measurements available' do
    extensible

    Glossary.types.each do |name, val|
	  value(name, val['description'])
	end

    value :VARIABLE, 'A user variable'
  end

  enum :DataItemSubEnum, 'The sub-types for a measurement' do
    extensible

    uniq = Set.new
    Glossary.subtypes.each do |name, val|
      if !uniq.include?(name)
        value(name, val['description'])
        uniq << name
      end
    end
  end
  
  enum :DataItemStatistics, 'Statistical operations on data' do
    extensible

    Glossary.statistics.each do |name, val|
	  value(name, val['description'])
	end
  end
  
  # Common Units
  enum :Units, 'The units supported' do
    extensible

    Glossary.units.each do |name, val|
	  value(name, val['description'])
	end
  end

  enum :NativeUnits, 'The units supported for the source equipment that can be converted into MTC Units.', :Units do
    # Alternate types for the source system.
    extensible

    Glossary.native_units.each do |name, val|
	  value(name, val['description'])
	end
  end
  
  enum :CoordinateSystemEnum, 'The coordinate system to be used for the position' do
    Glossary.coordinate_systems_attr.each do |name, val|
	  value(name, val['description'])
	end
  end
  
  enum :DataItemResetValue, 'The reset intervals' do
    extensible

    Glossary.reset_triggers.each do |name, val|
      value(name, val['description'])
    end
  end

  attrs :HeaderAttributes, "Common header attributes" do
    member :Version, 'The document version'
    member :CreationTime, 'The date and time the document was created'
    member :TestIndicator, 'Indicates that this was a test document', 0..1
    member :InstanceId, 'The unique instance identifier of this agent process'
    member :Sender, 'The sender of the message'
    member :DeviceModelChangeTime, 'A timestamp in 8601 format of the last update of the Device information for any device'
  end
  
  basic_type :CalibrationDate, 'The time the calibration was preformed',:dateTime
  basic_type :NextCalibrationDate, 'The time the next calibration should be preformed',:dateTime
  basic_type :CalibrationInitials, 'The initials of the person doing the calibration', :string
  basic_type :FirmwareVersion, 'The firmware version of this sensor', :string
  basic_type :ManufactureDate, 'The date and time of manufacture', :dateTime
  basic_type :InspectionDate, 'The date and time of last inspection', :dateTime
  basic_type :NextInspectionDate, 'The date and time of next inspection', :dateTime

  type :AbstractConfiguration, 'Abstract configuration' do
    abstract
  end

  type :Entry, 'An entry for a event with a data set representation' do
    mixed
    abstract
    ordered
    member :Key, 'the key'
    member :Removed, 'an indicatore that the entry has been removed', 0..1
  end

  type :TableCell, 'A cell of a table' do
    mixed
    abstract
    ordered
    member :Key, 'the key'
  end

  type :TableEntry, 'An entry for a table', :Entry do
    mixed
    ordered
    member :Cell, 'The table\'s cell', 0..INF, :TableCell
  end

  
end
