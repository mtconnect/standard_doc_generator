
## Relationships

This section provides semantic information for the {{block(ConfigurationRelationship)}} entity.

![Relationships](figures/Relationships.png "Relationships"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![Relationship Example](figures/Relationship%20Example.png "Relationship Example"){: width="0.8"}

> Note: See {{lst(relationship-example)}} for the {{term(XML)}} representation of the same example.

### ConfigurationRelationship

association between two pieces of equipment that function independently but together perform a manufacturing operation.


{{block(ConfigurationRelationship)}} is an abstract entity and hence will be realized by specific {{block(ConfigurationRelationship)}} types in an {{block(MTConnectDevices)}} entity. See {{sect(ComponentRelationship)}} and {{sect(DeviceRelationship)}}.


#### Value Properties of ConfigurationRelationship

{{tbl(value-properties-of-configurationrelationship)}} lists the Value Properties of {{block(ConfigurationRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(name)}}|`string`|0..1|
|{{property(id)}}|`ID`|1|
|{{property(type)}}|`RelationshipTypeEnum`|1|
|{{property(criticality)}}|`CriticalityTypeEnum`|0..1|
{: caption="Value Properties of ConfigurationRelationship" label="table:value-properties-of-configurationrelationship"}

Descriptions for Value Properties of {{block(ConfigurationRelationship)}}:

* {{property(name)}} 

    name associated with this {{block(ConfigurationRelationship)}}.

* {{property(id)}} 

    unique identifier for this {{block(ConfigurationRelationship)}}.

* {{property(type)}} 

    defines the authority that this piece of equipment has relative to the associated piece of equipment.

    `RelationshipTypeEnum` Enumeration:

    * `CHILD` 

        functions as a child in the relationship with the associated element.

    * `PARENT` 

        functions as a parent in the relationship with the associated element.

    * `PEER` 

        functions as a peer which provides equal functionality and capabilities in the relationship with the associated element.

* {{property(criticality)}} 

    defines whether the services or functions provided by the associated piece of equipment is required for the operation of this piece of equipment.

    `CriticalityTypeEnum` Enumeration:

    * `CRITICAL` 

        services or functions provided by the associated element is required for the operation of this element.

    * `NONCRITICAL` 

        services or functions provided by the associated element is not required for the operation of this element.

### ComponentRelationship

{{block(ConfigurationRelationship)}} that describes the association between two components within a piece of equipment that function independently but together perform a capability or service within a piece of equipment.



#### Value Properties of ComponentRelationship

{{tbl(value-properties-of-componentrelationship)}} lists the Value Properties of {{block(ComponentRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(idRef)}}|`ID`|1|
{: caption="Value Properties of ComponentRelationship" label="table:value-properties-of-componentrelationship"}

Descriptions for Value Properties of {{block(ComponentRelationship)}}:

* {{property(idRef)}} 

    reference to the associated {{block(Component)}}.

### DeviceRelationship

{{block(ConfigurationRelationship)}} that describes the association between two pieces of equipment that function independently but together perform a manufacturing operation.



#### Value Properties of DeviceRelationship

{{tbl(value-properties-of-devicerelationship)}} lists the Value Properties of {{block(DeviceRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(deviceUuidRef)}}|`ID`|1|
|{{property(href)}}|`xlinkhref`|0..1|
|{{property(role)}}|`RoleTypeEnum`|0..1|
|{{property(xlink:type)}}|`xlinktype`|0..1|
{: caption="Value Properties of DeviceRelationship" label="table:value-properties-of-devicerelationship"}

Descriptions for Value Properties of {{block(DeviceRelationship)}}:

* {{property(deviceUuidRef)}} 

    reference to the {{property(uuid)}} attribute of the {{block(Device)}} element of the associated piece of equipment.

* {{property(href)}} 

    {{term(URI)}} identifying the {{term(agent)}} that is publishing information for the associated piece of equipment. 

* {{property(role)}} 

    defines the services or capabilities that the referenced piece of equipment provides relative to this piece of equipment.

    `RoleTypeEnum` Enumeration:

    * `AUXILIARY` 

        associated element performs the functions as an `Auxiliary` for this element.

    * `SYSTEM` 

        associated element performs the functions of a {{block(System)}} for this element.

* {{property(xlink:type)}} 

    `xlink:type`**MUST** have a fixed value of `locator` as defined in W3C XLink 1.1 {{cite(https://www.w3.org/TR/xlink11/)}}.

### AssetRelationship

{{block(ConfigurationRelationship)}} that describes the association between a {{block(Component)}} and an {{block(Asset)}}.



#### Value Properties of AssetRelationship

{{tbl(value-properties-of-assetrelationship)}} lists the Value Properties of {{block(AssetRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(assetIdRef)}}|`ID`|1|
|{{property(assetType)}}|`string`|1|
|{{property(href)}}|`xlinkhref`|0..1|
{: caption="Value Properties of AssetRelationship" label="table:value-properties-of-assetrelationship"}

Descriptions for Value Properties of {{block(AssetRelationship)}}:

* {{property(assetIdRef)}} 

    uuid of the related {{block(Asset)}}.

* {{property(assetType)}} 

    type of {{block(Asset)}} being referenced.

* {{property(href)}} 

    {{term(URI)}} reference to the associated {{block(Asset)}}.
