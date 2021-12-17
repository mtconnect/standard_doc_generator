
## Raw Material

This section provides semantic information for the {{block(RawMaterial)}} model.

![RawMaterial](figures/RawMaterial.png "RawMaterial"){: width="0.8"}

> Note: See {{sect(RawMaterial Schema Diagrams)}} for XML schema.

### RawMaterial


{{block(Asset)}} that represents {{term(raw material)}}.


#### Value Properties of RawMaterial

{{tbl(value-properties-of-rawmaterial)}} lists the Value Properties of {{block(RawMaterial)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(name)}} | `string` | 0..1 |
| {{property(containerType)}} | `string` | 0..1 |
| {{property(processKind)}} | `string` | 0..1 |
| {{property(serialNumber)}} | `string` | 0..1 |
| {{property(HasMaterial)}} | `boolean` | 0..1 |
| {{property(Form)}} | `FormEnum` | 1 |
| {{property(ManufacturingDate)}} | `dateTime` | 0..1 |
| {{property(FirstUseDate)}} | `dateTime` | 0..1 |
| {{property(LastUseDate)}} | `dateTime` | 0..1 |
| {{property(InitialVolume)}} | `CUBIC_MILLIMETER` | 0..1 |
| {{property(InitialDimension)}} | `MILLIMETER` | 0..3 |
| {{property(InitialQuantity)}} | `integer` | 0..1 |
| {{property(CurrentVolume)}} | `CUBIC_MILLIMETER` | 0..1 |
| {{property(CurrentDimension)}} | `MILLIMETER` | 0..3 |
| {{property(CurrentQuantity)}} | `integer` | 0..1 |
{: caption="Value Properties of RawMaterial"}

Descriptions for Value Properties of {{block(RawMaterial)}}:

* {{property(name)}} 

    name of the {{term(raw material)}}.
    
    Examples: `Container1` and `AcrylicContainer`.

* {{property(containerType)}} 

    type of container holding the {{term(raw material)}}. 
    
    Examples: `Pallet`, `Canister`, `Cartridge`, `Tank`, `Bin`, `Roll`, and `Spool`.

* {{property(processKind)}} 

    ISO process type supported by this {{term(raw material)}}. 
    
    Examples include: `VAT_POLYMERIZATION`, `BINDER_JETTING`, `MATERIAL_EXTRUSION`, `MATERIAL_JETTING`, `SHEET_LAMINATION`, `POWDER_BED_FUSION` and `DIRECTED_ENERGY_DEPOSITION`.

* {{property(serialNumber)}} 

    serial number of the {{term(raw material)}}.

* {{property(HasMaterial)}} 

    {{block(Material)}} has existing usable volume.

* {{property(Form)}} 

    form of the {{term(raw material)}}.

    The value of {{property(Form)}} **MUST** be one of the `FormEnum` enumeration.

    `FormEnum` Enumeration:


    * `BAR` 

        

    * `SHEET` 

        

    * `BLOCK` 

        

    * `CASTING` 

        

    * `POWDER` 

        

    * `LIQUID` 

        

    * `GEL` 

        

    * `FILAMENT` 

        

    * `GAS` 

        

* {{property(ManufacturingDate)}} 

    date the {{term(raw material)}} was created.

* {{property(FirstUseDate)}} 

    date {{term(raw material)}} was first used.

* {{property(LastUseDate)}} 

    date {{term(raw material)}} was last used.

* {{property(InitialVolume)}} 

    amount of material initially placed in {{term(raw material)}} when manufactured.

* {{property(InitialDimension)}} 

    dimension of material initially placed in {{term(raw material)}} when manufactured.

* {{property(InitialQuantity)}} 

    quantity of material initially placed in {{term(raw material)}} when manufactured.

* {{property(CurrentVolume)}} 

    amount of material currently in {{term(raw material)}}.

* {{property(CurrentDimension)}} 

    dimension of material currently in {{term(raw material)}}.

* {{property(CurrentQuantity)}} 

    quantity of material currently in {{term(raw material)}}.

#### Part Properties of RawMaterial

{{tbl(part-properties-of-rawmaterial)}} lists the Part Properties of {{block(RawMaterial)}}.

| Part Property name | Multiplicity |
|:-------------------------------------|:-------------:|
| {{block(Material)}} | 0..1 |
{: caption="Part Properties of RawMaterial"}

Descriptions for Part Properties of {{block(RawMaterial)}}:

* {{block(Material)}} 

    material used as the {{block(RawMaterial)}}.
    See {{sect(Material)}}.

### Material


material used as the {{block(RawMaterial)}}.


#### Value Properties of Material

{{tbl(value-properties-of-material)}} lists the Value Properties of {{block(Material)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(id)}} | `ID` | 0..1 |
| {{property(name)}} | `string` | 0..1 |
| {{property(type)}} | `string` | 1 |
| {{property(Lot)}} | `string` | 0..1 |
| {{property(Manufacturer)}} | `string` | 0..1 |
| {{property(ManufacturingDate)}} | `dateTime` | 0..1 |
| {{property(ManufacturingCode)}} | `string` | 0..1 |
| {{property(MaterialCode)}} | `string` | 0..1 |
{: caption="Value Properties of Material"}

Descriptions for Value Properties of {{block(Material)}}:

* {{property(id)}} 

    unique identifier for the material.

* {{property(name)}} 

    name of the material. 
    
    Examples: `ULTM9085`, `ABS`, `4140`.

* {{property(type)}} 

    type of material. 
    
    Examples: `Metal`, `Polymer`, `Wood`, `4140`, `Recycled`, `Prestine` and `Used`.

* {{property(Lot)}} 

    manufacturer's lot code of the material.

* {{property(Manufacturer)}} 

    name of the material manufacturer.

* {{property(ManufacturingDate)}} 

    manufacturing date of the material from the material manufacturer.

* {{property(ManufacturingCode)}} 

    lot code of the raw feed stock for the material, from the feed stock manufacturer.

* {{property(MaterialCode)}} 

    {{term(ASTM)}} standard code that the material complies with.
