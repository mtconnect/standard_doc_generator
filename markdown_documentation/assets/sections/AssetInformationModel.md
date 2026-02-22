
## Asset

abstract {{term(Asset)}}. 


It is used in the manufacturing process, but is not permanently associated with a single piece of equipment. It can be removed from the piece of equipment without compromising its function, and can be associated with other pieces of equipment during its lifecycle.


![Asset](figures/Asset.png "Asset"){: width="0.8"}

> Note: See {{sect(Assets Schema Diagrams)}} for XML schema.


### Value Properties of Asset

{{tbl(value-properties-of-asset)}} lists the Value Properties of {{block(Asset)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(assetId)}}|`ID`|1|
|{{property(deviceUuid)}}|`UUID`|0..1|
|{{property(removed)}}|`boolean`|0..1|
|{{property(timestamp)}}|`datetime`|1|
|{{property(hash)}}|`string`|0..1|
{: caption="Value Properties of Asset" label="table:value-properties-of-asset"}

Descriptions for Value Properties of {{block(Asset)}}:

* {{property(assetId)}} 

    unique identifier for an {{block(Asset)}}.

* {{property(deviceUuid)}} 

    associated piece of equipment's {{term(UUID)}} that supplied the {{block(Asset)}}'s data.
    
    It references to {{property(Device::uuid)}} defined in {{package(Device Information Model)}}.

* {{property(removed)}} 

    indicator that the {{block(Asset)}} has been removed from the piece of equipment.

* {{property(timestamp)}} 

    time the {{block(Asset)}} data was last modified.

* {{property(hash)}} 

    condensed message digest from a secure one-way hash function. {{cite(FIPS PUB 180-4)}}

### Part Properties of Asset

{{tbl(part-properties-of-asset)}} lists the Part Properties of {{block(Asset)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Configuration)}}|0..1|
{: caption="Part Properties of Asset" label="table:part-properties-of-asset"}

Descriptions for Part Properties of {{block(Asset)}}:

* {{block(Configuration)}} 

    technical information about an entity describing its physical layout, functional characteristics, and relationships with other entities.

    See {{block(Configuration)}} in {{package(Device Information Model)}}.

## PhysicalAsset

abstract physical {{block(Asset)}}.



### Part Properties of PhysicalAsset

{{tbl(part-properties-of-physicalasset)}} lists the Part Properties of {{block(PhysicalAsset)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Measurement)}} (organized by `Measurements`)|0..*|
{: caption="Part Properties of PhysicalAsset" label="table:part-properties-of-physicalasset"}

Descriptions for Part Properties of {{block(PhysicalAsset)}}:

* {{block(Measurement)}} 

    constrained scalar value associated with an {{block(Asset)}}.
