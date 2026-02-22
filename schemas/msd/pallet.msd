package :Pallet, 'portable platform for handling, storing, or moving materials, parts, blanks etc' do

  basic_type :PalletType, 'type of pallet'
  basic_type :PalletAssetId, 'id of pallet', :ID
  basic_type :PalletNumber, 'number or sequence assigned to pallet', :integer
  basic_type :ClampingMethod, 'actuation type of clamping mechanism'
  basic_type :MountingMethod, 'actuation type of mounting mechanism'


  type :Pallet, 'portable platform for handling, storing, or moving materials, parts, blanks etc', :Asset do
    member :Type, 'type of pallet', 0..1, :PalletType
    member :PalletId, 'id of pallet', 0..1, :PalletAssetId
    member :PalletNumber, 'number or sequence assigned to pallet', 0..1
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
