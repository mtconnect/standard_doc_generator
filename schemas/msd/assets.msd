package :Assets, 'Mobile Assets' do

  float = '[+-]?\d+(\.\d+)?([Ee][+-]?\d+)?'
  optional_float = "#{float}|"

  attr :Source, 'A URI reference', :anyURI
  attr :AssetStation, 'The station id for this asset'
  attr :RequirementId, '', :ID
  
  type :AssetDescription, 'The description of an asset, can be free form text or elements' do
    mixed
    member :any, 'Any elements', 0..INF
  end  
  
  type :Assets, 'The collection of mobile assets' do
    choice(0..INF) do
      member :Asset, 'An asset'
    end
  end
  
  type :AssetConfiguration, 'The configuration data associated with the asset' do
    mixed
    
    member :Configuration,  'Configuration types', 1..INF, :AbstractConfiguration
  end

  type :Asset, 'An abstract mobile asset' do
    abstract
    member :AssetId, 'The unique identifier of the asset'
    member :Timestamp, 'The time asset information was recorded'
    member :DeviceUuid, 'The uuid this tool is associated with', :Uuid
    member :Removed, 'The asset has been marked as removed', 0..1
    member :Manufacturers, 'The manufacturer', 0..INF, :Name
    member :Model, 'The model', 0..1
    member :SerialNumber, 'The serial number', 0..1, :SerialNumberAttr
    member :Station, 'The station location', 0..1, :AssetStation
  end
  
  # Measurement
  attr :MeasurementAttr, 'A measurement value', :float
  basic_type(:MeasurementValueType, 'A measurement value') { pattern optional_float }

  type :PhysicalMeasurement, 'measurement for physical assets' do
    member :SignificantDigits, "The number of significant digits", 0..1, :SignificantDigitsValue
    member :Units, 'The units for the measurement. This will be defined by MTConnect', 0..1
    member :NativeUnits, 'The native units for the measurement, if different from units', 0..1
    member :Maximum, 'The maximum tolerance value', 0..1, :MeasurementAttr
    member :Minimum, 'The minimum tolerance value', 0..1, :MeasurementAttr
    member :Nominal, 'The nominal value', 0..1, :MeasurementAttr
    member :Value, 'The actual measurement', :MeasurementValueType
  end

  type :PhysicalMeasurements, 'collection of measurements' do
    member :Weight, '', 1..INF, :PhysicalMeasurement
    member :Height, '', 1..INF, :PhysicalMeasurement
    member :Width, '', 1..INF, :PhysicalMeasurement
    member :Length, '', 1..INF, :PhysicalMeasurement
    member :Swing, '', 1..INF, :PhysicalMeasurement
    member :LoadedWeight, '', 1..INF, :PhysicalMeasurement
    member :LoadedHeight, '', 1..INF, :PhysicalMeasurement
    member :LoadedWidth, '', 1..INF, :PhysicalMeasurement
    member :LoadedLength, '', 1..INF, :PhysicalMeasurement
    member :Weight, '', 1..INF, :PhysicalMeasurement
    member :LoadedSwing, '', 1..INF, :PhysicalMeasurement
  end

  # Target
  type :Target do
    abstract
  end

  type :TargetRef, :Target do
    member :GroupIdRef, '', 1, :ID
  end

  type :TargetDevice, :Target do
    member :DeviceUuid, '', 1, :Uuid
  end

  type :TargetGroup, :Target do
    member :GroupId, '', 1, :ID
    member :TargetDevice, '', 0..INF
    member :TargetRef, '', 0..INF
  end

  type :TargetRequirementTable, :Target do
    member :RequirementId, '', 1
    member :Entry, '', 1..INF, :TableEntry
  end

  type :Targets do
    member :Target, '', 1..INF
  end
end
