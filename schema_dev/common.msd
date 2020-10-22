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
  
  attr :Timestamp, 'The time the sample was reported', :dateTime
  attr :OccurrenceTime, 'The time a sample occurred', :dateTime
  attr :Version, 'A version number', :NMTOKEN
  attr :Name, 'A short name for any element'
  attr :Uuid, 'A universally unique id that uniquely identifies the element for it\'s entire life'
  attr :SerialNumberAttr, 'A serial number for a piece of equipment'
  attr :ItemSource, 'The measurement source'
  attr :Rate, 'A sample rate in milliseconds per sample', :float
  attr :ComponentId, 'The id of the component (maps to the id from probe)', :ID
  attr :ID, 'An identifier', :ID
  attr :SignificantDigitsValue, 'The number significant digits', :integer
  attr :CompositionId, 'The item\'s reference to the Device model composition', :IDREF
  attr :DurationTime, 'A length of time in seconds', :float
  attr :Removed, 'A flag indicating the item has been removed', :boolean
  attr :Key, 'The key for adata set', :NMTOKEN
  attr :IdRef, 'A reference to an identifier', :IDREF
  
  attr :AssetId, 'The unique id of the asset'
  attr :AssetAttrType, 'An asset type'
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

  basic_type :DescriptionText, 'A description'
  basic_type(:DataItemExt, 'An extension point for data item types') do
    pattern '[a-ln-z]:[A-Z_0-9]+'
  end
  
  basic_type(:DataItemStatsExt, 'An extension point for data item statistics types') do
    pattern '[a-ln-z]:[A-Z_0-9]+'
  end
  
  enum :DataItemEnum, 'The types of measurements available' do
    extensible :DataItemExt

    Glossary.types.each do |name, val|
	  value(name, val['description'])
	end

    value :VARIABLE, 'A user variable'
  end

  enum :DataItemSubEnum, 'The sub-types for a measurement' do
    extensible :DataItemExt

    uniq = Set.new
    Glossary.subtypes.each do |name, val|
      if !uniq.include?(name)
        value(name, val['description'])
        uniq << name
      end
    end
  end
  
  enum :DataItemStatistics, 'Statistical operations on data' do
    extensible :DataItemStatsExt

    Glossary.statistics.each do |name, val|
	  value(name, val['description'])
	end
  end
  
  # Common Units
  basic_type(:UnitsExt, 'An extension point for data item types') do
    pattern '[a-ln-z]:[A-Z_0-9]+'
  end

  enum :Units, 'The units supported' do
    extensible :UnitsExt

    Glossary.units.each do |name, val|
	  value(name, val['description'])
	end
  end

  enum :NativeUnits, 'The units supported for the source equipment that can be converted into MTC Units.', :Units do
    # Alternate types for the source system.
    extensible :UnitsExt

    Glossary.native_units.each do |name, val|
	  value(name, val['description'])
	end
  end
  
  enum :CoordinateSystemEnum, 'The coordinate system to be used for the position' do
    Glossary.coordinate_systems_attr.each do |name, val|
	  value(name, val['description'])
	end
  end
  
  basic_type(:DataItemResetValueExt, 'An extension point for reset types') do
    pattern '[a-ln-z]:[A-Z_0-9]+'
  end
  
  enum :DataItemResetValue, 'The reset intervals' do
    extensible :DataItemResetValueExt

    Glossary.reset_triggers.each do |name, val|
      value(name, val['description'])
    end
  end
  
end
