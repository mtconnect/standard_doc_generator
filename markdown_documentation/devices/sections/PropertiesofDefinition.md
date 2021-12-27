
## Properties of Definition

This section provides semantic information for the elements of the {{block(Definition)}} for a {{block(DataItem)}}.

### CellDefinition


semantic definition of a {{block(Cell)}}.


#### Value Properties of CellDefinition

{{tbl(value-properties-of-celldefinition)}} lists the Value Properties of {{block(CellDefinition)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(units)}}|`UnitEnum`|0..1|
|{{property(key)}}|`string`|0..1|
|{{property(type)}}|`DataItemTypeEnum`|0..1|
|{{property(subType)}}|`DataItemSubTypeEnum`|0..1|
|{{property(keyType)}}|`string`|0..1|
{: caption="Value Properties of CellDefinition"}

Descriptions for Value Properties of {{block(CellDefinition)}}:

* {{property(units)}} 

    same as {{block(DataItem)}} {{property(units,DataItem)}}. See {{sect(Value Properties of DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(key)}} 

    unique identification of the {{block(Cell)}} in the {{block(Definition)}}. 
    
    The description applies to all {{block(Cell)}} {{termplural(observation)}} having this {{property(key)}}.

* {{property(type)}} 

    same as {{block(DataItem)}} {{property(type,DataItem)}}.  See {{sect(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(subType)}} 

    same as {{block(DataItem)}} {{property(subType,DataItem)}}.  See {{sect(DataItem SubTypes)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(keyType)}} 

    {{block(DataItem)}} {{property(type)}} that defines the meaning of the {{property(key)}}.

#### Part Properties of CellDefinition

{{tbl(part-properties-of-celldefinition)}} lists the Part Properties of {{block(CellDefinition)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Description)}}|0..1|
{: caption="Part Properties of CellDefinition"}

Descriptions for Part Properties of {{block(CellDefinition)}}:

* {{block(Description)}} 

    descriptive content.

    See {{sect(Description)}}.

### EntryDefinition


semantic definition of an {{block(Entry)}}.


#### Value Properties of EntryDefinition

{{tbl(value-properties-of-entrydefinition)}} lists the Value Properties of {{block(EntryDefinition)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(key)}}|`string`|0..1|
|{{property(units)}}|`UnitEnum`|0..1|
|{{property(type)}}|`DataItemTypeEnum`|0..1|
|{{property(subType)}}|`DataItemSubTypeEnum`|0..1|
|{{property(keyType)}}|`string`|0..1|
{: caption="Value Properties of EntryDefinition"}

Descriptions for Value Properties of {{block(EntryDefinition)}}:

* {{property(key)}} 

    unique identification of the {{block(Entry)}} in the {{block(Definition)}}. 
    
    The description applies to all {{block(Entry)}} {{termplural(observation)}} having this {{property(key)}}.

* {{property(units)}} 

    same as {{block(DataItem)}} {{property(units,DataItem)}}. See {{sect(Value Properties of DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(type)}} 

    same as {{block(DataItem)}} {{property(type,DataItem)}}. See {{sect(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(subType)}} 

    same as {{block(DataItem)}} {{property(subType,DataItem)}}. See {{sect(DataItem SubTypes)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(keyType)}} 

    {{block(DataItem)}} {{property(type)}} that defines the meaning of the {{property(key)}}.

#### Part Properties of EntryDefinition

{{tbl(part-properties-of-entrydefinition)}} lists the Part Properties of {{block(EntryDefinition)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Description)}}|0..1|
|{{block(CellDefinition)}} (organized by {{block(CellDefinitions)}})|0..*|
{: caption="Part Properties of EntryDefinition"}

Descriptions for Part Properties of {{block(EntryDefinition)}}:

* {{block(Description)}} 

    descriptive content.

    See {{sect(Description)}}.

* {{block(CellDefinition)}} 

    semantic definition of a {{block(Cell)}}.

    {{block(CellDefinitions)}} groups one or more {{block(CellDefinition)}} entities if the {{property(representation,DataItem)}} of {{block(DataItem)}} is `TABLE`. See {{sect(CellDefinition)}}.
