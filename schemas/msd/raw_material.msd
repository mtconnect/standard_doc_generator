
package :raw_material, '{block(RawMaterial)}} is an {{block(Asset)}} that represents {{term(raw material)}}.' do
  
  attr :ContainerType, 'The type of the material container.'
  attr :RawMaterialSerialNumber, 'The serial number of the material container'
  attr :ProcessKind, 'The ISO process type supported by this {{term(raw material)}}'
  attr :RawMaterialMaterialType, 'The type of material.'
  
  basic_type :Manufacturer, 'The name of the raw feed stock manufacturer.', :dateTime
  basic_type :ManufacturingDate, 'The manufacturing date of the raw feed stock from the feed stock manufacturer.', :dateTime
  basic_type :ManufacturingCode, 'The lot code of the raw feed stock from the feed stock manufacturer.', :dateTime
  basic_type :MaterialCode, 'The ASTM standard code that the material complies with.'
  basic_type :Lot, 'The lot code of the material contained within the material container.'
  
  basic_type :HasMaterial, 'The form of the material in the material container.', :boolean
  basic_type :FirstUseDate, 'The date when the material container was first used.', :dateTime
  basic_type :LastUseDate, 'The date when the material container was last used.', :dateTime
  basic_type :InitialVolume, 'The amount of material initially placed in the material container when manufactured.', :float
  basic_type :InitialDimension, 'The dimension of material initially placed in the material container when manufactured.', :ThreeSpaceValue
  basic_type :InitialQuantity, 'The quantity of material initially placed in the material container when manufactured.', :integer
  basic_type :CurrentVolume, 'The quantity of material currently contained in the material container', :float
  basic_type :CurrentDimension, 'The dimension of material currently contained in the material container', :ThreeSpaceValue
  basic_type :CurrentQuantity, 'The quantity of material currently contained in the material container', :integer
 
  enum :Form, 'The form of the material in the material container.' do
    extensible
    value :BAR, ''
	value :SHEET, ''
	value :BLOCK, ''
	value :CASTING, ''
	value :POWDER, ''
	value :LIQUID, ''
	value :GEL, ''
	value :FILAMENT, ''
	value :GAS, ''
  end
 
  type :RawMaterialMaterial, 'material used as the {{block(RawMaterial)}}' do
    member :id, 'The unique identifier for the material', 0..1, :ID
	member :Name, 'The name of the material.', 0..1
	member :Type, 'The type of material.' ,1 , :RawMaterialMaterialType
	
	member :Lot, 'The manufacturer\'s lot code of the material.', 0..1
	member :Manufacturer, 'The name of the material manufacturer.', 0..1
	member :ManufacturingDate, 'The manufacturing date of the material from the material manufacturer.', 0..1
	member :ManufacturingCode, 'The lot code of the raw feed stock for the material, from the feed stock manufacturer.', 0..1
	member :MaterialCode, 'The ASTM standard code that the material complies with.', 0..1
  end
  
  type :RawMaterial, '{block(RawMaterial)}} is an {{block(Asset)}} that represents {{term(raw material)}}.', :Asset do
	member :Name, 'The {{term(raw material)}} name.', 0..1
	member :ContainerType, 'The type of container holding the {{term(raw material)}}.', 0..1
	member :ProcessKind, 'The ISO process type supported by this {{term(raw material)}}.', 0..1
	member :SerialNumber, ' The serial number of the {{term(raw material)}}', 0..1, :RawMaterialSerialNumber
	
	element :Form, 'The form of the {{term(raw material)}}.', 1
	member :HasMaterial, '{{block(Material)}} has existing usable volume', 0..1
	member :ManufacturingDate, 'The date the {{term(raw material)}} was created', 0..1
	member :FirstUseDate, 'The date {{term(raw material)}} was first used.', 0..1
	member :LastUseDate, 'The date {{term(raw material)}} was last used.', 0..1
	member :InitialVolume, 'The amount of material initially placed in {{term(raw material)}} when manufactured.', 0..1
	member :InitialDimension, 'The dimension of material initially placed in the material container when manufactured.', 0..1
    member :InitialQuantity, 'The quantity of material initially placed in the material container when manufactured.', 0..1
    member :CurrentVolume, 'The quantity of material currently contained in the material container', 0..1
    member :CurrentDimension, 'The dimension of material currently contained in the material container', 0..1
    member :CurrentQuantity, 'The quantity of material currently contained in the material container', 0..1
	member :Material, 'material used as the {{block(RawMaterial)}}', 0..1, :RawMaterialMaterial
  end
    
end
