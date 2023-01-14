
## Cutting Item

A {{block(CuttingItem)}} is the portion of the tool that physically removes the material from the workpiece by shear deformation. The cutting item can be either a single piece of material attached to the {{block(CuttingTool)}} or it can be one or more separate pieces of material attached to the {{block(CuttingTool)}} using a permanent or removable attachment.  A {{block(CuttingItem)}} can be comprised of one or more cutting edges. Cutting items include: replaceable inserts, brazed tips and the cutting portions of solid {{block(CuttingTools)}}.

MTConnect Standard considers {{block(CuttingItems)}} as part of the {{block(CuttingTool)}}.  A {{block(CuttingItems)}} **MUST NOT** exist in MTConnect unless it is attached to a {{block(CuttingTool)}}.  Some of the measurements, such as {{block(FunctionalLength)}}, **MUST** be made with reference to the entire {{block(CuttingTool)}} to be meaningful.

![CuttingItem](figures/CuttingItem.png "CuttingItem"){: width="0.8"}

> Note: See {{sect(CuttingItem Schema Diagrams)}} for XML schema.

### CuttingItem

part of of the tool that physically removes the material from the workpiece by shear deformation.



#### Value Properties of CuttingItem

{{tbl(value-properties-of-cuttingitem)}} lists the Value Properties of {{block(CuttingItem)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(Description)}}|`string`|0..1|
|{{property(grade)}}|`string`|0..1|
|{{property(indices)}}|`string`|1..*|
|{{property(itemId)}}|`ID`|0..1|
|{{property(Locus)}}|`string`|0..1|
|{{property(manufacturers)}}|`string`|0..*|
|{{property(ProgramToolGroup)}}|`string`|0..1|
{: caption="Value Properties of CuttingItem" label="table:value-properties-of-cuttingitem"}

Descriptions for Value Properties of {{block(CuttingItem)}}:

* {{property(Description)}} 

    free-form description of the cutting item.

* {{property(grade)}} 

    material composition for this cutting item.

* {{property(indices)}} 

    number or numbers representing the individual cutting item or items on the tool.
    
    Indices **SHOULD** start numbering with the inserts or {{block(CuttingItem)}} furthest from the gauge line and increasing in value as the items get closer to the gauge line. Items at the same distance **MAY** be arbitrarily numbered.
    
    > Note: In {{term(XML)}}, the representation **MUST** be a single number ("1") or a comma separated set of individual elements ("1,2,3,4"), or as a inclusive range of values as in ("1-10") or any combination of ranges and numbers as in "1-4,6-10,22". There **MUST NOT** be spaces or non-integer values in the text representation.

* {{property(itemId)}} 

    manufacturer identifier of this cutting item.

* {{property(Locus)}} 

    free form description of the location on the cutting tool.
    
    For clarity, the words `FLUTE`, `INSERT`, and `CARTRIDGE` **SHOULD** be used to assist in noting the location of a {{block(CuttingItem)}}. {{property(Locus)}} **MAY** be any free form string, but **SHOULD** adhere to the following rules:
    
    * The location numbering **SHOULD** start at the furthest {{block(CuttingItem)}} and work it’s way back to the {{block(CuttingItem)}} closest to the gauge line.
    
    * Flutes **SHOULD** be identified as such using the word `FLUTE`:. For example: `FLUTE`: 1, `INSERT`: 2 - would indicate the first flute and the second furthest insert from the end of the tool on that flute.
    
    * Other designations such as `CARTRIDGE` **MAY** be included, but should be identified using upper case and followed by a colon (:).

* {{property(manufacturers)}} 

    manufacturers of the cutting item.
    
    This will reference the tool item and adaptive items specifically. The cutting items
    manufacturers’ will be a property of {{block(CuttingItem)}}.
    
    > Note: In {{term(XML)}}, the representation **MUST** be a comma(,) delimited list of manufacturer names. See {{sect(CuttingItem Schema Diagrams)}}.

* {{property(ProgramToolGroup)}} 

    tool group this item is assigned in the part program.

#### Part Properties of CuttingItem

{{tbl(part-properties-of-cuttingitem)}} lists the Part Properties of {{block(CuttingItem)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Status)}} (organized by `CutterStatus`)|1..*|
|{{block(ItemLife)}}|0..3|
|{{block(Measurement)}} (organized by `Measurements`)|0..*|
{: caption="Part Properties of CuttingItem" label="table:part-properties-of-cuttingitem"}

Descriptions for Part Properties of {{block(CuttingItem)}}:

* {{block(Status)}} 

    status of the cutting tool.

    {{block(CutterStatus)}} provides the status of the assembly and {{term(organize)}} one or more {{block(Status)}} entities. See {{sect(Status)}}.
    
    The following combinations of {{block(Status)}} entities **MUST NOT** occur for a {{block(CutterStatus)}}:
    
    * `NEW` **MUST NOT** be used with `USED`, `RECONDITIONED`, or `EXPIRED`.
    
    * `UNKNOWN` **MUST NOT** be used with any other status.
    
    * `ALLOCATED` and `UNALLOCATED` **MUST NOT** be used together.
    
    * `AVAILABLE` and `UNAVAILABLE` **MUST NOT** be used together.
    
    * If the tool is `EXPIRED`, `BROKEN`, or `NOT_REGISTERED` it **MUST NOT** be `AVAILABLE`.
    
    {{block(CutterStatus)}} **MUST** be defined only for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingTool)}} and **MUST NOT** be defined for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingToolArchetype)}}.

* {{block(ItemLife)}} 

    life of a {{block(CuttingItem)}}.

    See {{sect(ItemLife)}}.

* {{block(Measurement)}} 

    constrained scalar value associated with a cutting tool.

    {{block(Measurements)}} groups one or more {{block(Measurement)}} subtypes. See {{sect(Measurement)}}.

### CuttingItems

{{block(CuttingItems)}} groups one or more {{block(CuttingItem)}} entities. See {{sect(CuttingItem)}} and {{package(Cutting Item)}} for more detail.



#### Value Properties of CuttingItems

{{tbl(value-properties-of-cuttingitems)}} lists the Value Properties of {{block(CuttingItems)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(count)}}|`integer`|1|
{: caption="Value Properties of CuttingItems" label="table:value-properties-of-cuttingitems"}

Descriptions for Value Properties of {{block(CuttingItems)}}:

* {{property(count)}} 

    number of {{block(CuttingItem)}} organized by {{block(CuttingItems)}}.

### ItemLife

life of a {{block(CuttingItem)}}.



The value of {{property(ItemLife)}} **MUST** be `float`.

#### Value Properties of ItemLife

{{tbl(value-properties-of-itemlife)}} lists the Value Properties of {{block(ItemLife)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(countDirection)}}|`CountDirectionTypeEnum`|1|
|{{property(initial)}}|`float`|0..1|
|{{property(limit)}}|`float`|0..1|
|{{property(type)}}|`ToolLifeEnum`|1|
|{{property(warning)}}|`float`|0..1|
{: caption="Value Properties of ItemLife" label="table:value-properties-of-itemlife"}

Descriptions for Value Properties of {{block(ItemLife)}}:

* {{property(countDirection)}} 

    indicates if the item life counts from zero to maximum or maximum to zero.

    The value of {{property(countDirection)}} **MUST** be one of the `CountDirectionTypeEnum` enumeration. 

* {{property(initial)}} 

    initial life of the item when it is new.

* {{property(limit)}} 

    end of life limit for this item.

* {{property(type)}} 

    type of item life being accumulated.

    The value of {{property(type)}} **MUST** be one of the `ToolLifeEnum` enumeration. 

* {{property(warning)}} 

    point at which a item life warning will be raised.
