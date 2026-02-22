
## Cutting Tool

This section provides semantic information for the {{block(CuttingTool)}} and {{block(CuttingToolArchetype)}} models.

![CuttingTool](figures/CuttingTool.png "CuttingTool"){: width="0.8"}

> Note: See {{sect(CuttingTool Schema Diagrams)}} for XML schema.


### CuttingTool

{{block(Asset)}} that physically removes the material from the workpiece by shear deformation.



#### Value Properties of CuttingTool

{{tbl(value-properties-of-cuttingtool)}} lists the Value Properties of {{block(CuttingTool)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(serialNumber)}}|`string`|1|
|{{property(toolId)}}|`string`|1|
{: caption="Value Properties of CuttingTool" label="table:value-properties-of-cuttingtool"}

Descriptions for Value Properties of {{block(CuttingTool)}}:

* {{property(toolId)}} 

    identifier for a class of cutting tools.

#### Part Properties of CuttingTool

{{tbl(part-properties-of-cuttingtool)}} lists the Part Properties of {{block(CuttingTool)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(CuttingToolLifeCycle)}}|0..1|
|{{block(CuttingToolArchetypeReference)}}|0..1|
|`<<deprecated>>` {{block(CuttingToolDefinition)}}|0..1|
{: caption="Part Properties of CuttingTool" label="table:part-properties-of-cuttingtool"}

Descriptions for Part Properties of {{block(CuttingTool)}}:

* {{block(CuttingToolLifeCycle)}} 

    data regarding the application or use of the tool.
    
    This data is provided by various pieces of equipment (i.e. machine tool, presetter) and statistical process control applications. Life cycle data will not remain static, but will change periodically when a tool is used or measured.

    See {{sect(CuttingToolLifeCycle)}}.

* {{block(CuttingToolArchetypeReference)}} 

    reference information about the {{property(Asset::assetId)}} and/or the URL of the data source of {{block(CuttingToolArchetype)}}.

* {{block(CuttingToolDefinition)}} 

    detailed structure of the cutting tool which is static during its lifecycle. {{cite(ISO 13399)}}.

    **DEPRECATED** in *Version 1.3.0* for {{block(CuttingTool)}}.

### CuttingToolArchetype

{{block(Asset)}} that describes the static cutting tool geometries and nominal values as one would expect from a tool catalog.



#### Value Properties of CuttingToolArchetype

{{tbl(value-properties-of-cuttingtoolarchetype)}} lists the Value Properties of {{block(CuttingToolArchetype)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(serialNumber)}}|`string`|1|
|{{property(toolId)}}|`string`|1|
{: caption="Value Properties of CuttingToolArchetype" label="table:value-properties-of-cuttingtoolarchetype"}

Descriptions for Value Properties of {{block(CuttingToolArchetype)}}:

* {{property(toolId)}} 

    identifier for a class of cutting tools.

#### Part Properties of CuttingToolArchetype

{{tbl(part-properties-of-cuttingtoolarchetype)}} lists the Part Properties of {{block(CuttingToolArchetype)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(CuttingToolDefinition)}}|0..1|
|{{block(CuttingToolLifeCycle)}}|0..1|
{: caption="Part Properties of CuttingToolArchetype" label="table:part-properties-of-cuttingtoolarchetype"}

Descriptions for Part Properties of {{block(CuttingToolArchetype)}}:

* {{block(CuttingToolDefinition)}} 

    detailed structure of the cutting tool which is static during its lifecycle. {{cite(ISO 13399)}}.

    **DEPRECATED** in *Version 2.1.0* for {{block(CuttingToolArchetype)}}.

* {{block(CuttingToolLifeCycle)}} 

    data regarding the application or use of the tool.
    
    This data is provided by various pieces of equipment (i.e. machine tool, presetter) and statistical process control applications. Life cycle data will not remain static, but will change periodically when a tool is used or measured.

    See {{sect(CuttingToolLifeCycle)}}.

### CuttingToolArchetypeReference

reference information about the {{property(Asset::assetId)}} and/or the URL of the data source of {{block(CuttingToolArchetype)}}.



The value of {{property(CuttingToolArchetypeReference)}} **MUST** be `ID`. See {{sect(id)}}.

#### Value Properties of CuttingToolArchetypeReference

{{tbl(value-properties-of-cuttingtoolarchetypereference)}} lists the Value Properties of {{block(CuttingToolArchetypeReference)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(source)}}|`string`|0..1|
{: caption="Value Properties of CuttingToolArchetypeReference" label="table:value-properties-of-cuttingtoolarchetypereference"}

Descriptions for Value Properties of {{block(CuttingToolArchetypeReference)}}:

* {{property(source)}} 

    {{term(URL)}} of the {{block(CuttingToolArchetype)}} {{term(information model)}}.

### CuttingToolDefinition

detailed structure of the cutting tool which is static during its lifecycle. {{cite(ISO 13399)}}.



The value of {{property(CuttingToolDefinition)}} **MUST** be a list of `string` of size `0..*`.

#### Value Properties of CuttingToolDefinition

{{tbl(value-properties-of-cuttingtooldefinition)}} lists the Value Properties of {{block(CuttingToolDefinition)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(format)}}|`FormatTypeEnum`|0..1|
{: caption="Value Properties of CuttingToolDefinition" label="table:value-properties-of-cuttingtooldefinition"}

Descriptions for Value Properties of {{block(CuttingToolDefinition)}}:

* {{property(format)}} 

    identifies the expected representation of the enclosed data.

    `FormatTypeEnum` Enumeration:

    * `EXPRESS` 

        document will confirm to the ISO 10303 Part 21 standard.

    * `TEXT` 

        document will be a text representation of the tool data.

    * `UNDEFINED` 

        document will be provided in an undefined format.

    * `XML` 

        default value for the definition. The content will be an {{term(XML)}} document.
