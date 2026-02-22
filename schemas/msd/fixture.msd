package :Fixture, 'Specialized tool that holds or secures an object' do

  basic_type :FixtureAssetFixtureId, 'id of fixture', :ID
  basic_type :FixtureNumber, 'number or sequence assigned to fixture', :integer

  type :Fixture, 'Specialized tool that holds or secures an object', :Asset do
    member :FixtureId, 'id of pallet', 0..1, :FixtureAssetFixtureId
    member :FixtureNumber, 'number or sequence assigned to fixture', 0..1
    member :ClampingMethod, 'actuation type of clamping mechanism', 0..1
    member :MountingMethod, 'actuation type of mounting mechanism', 0..1
    
    member :ManufactureDate, 'The date and time of manufacture', 0..1
    member :CalibrationDate, 'The date and time of last was calibration', 0..1
    member :InspectionDate, 'The date and time of last inspection', 0..1
    member :NextInspectionDate, 'The date and time of next inspection', 0..1
    member :Measurements, 'collection of measurements', 0..1, :PhysicalMeasurements
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end
end
