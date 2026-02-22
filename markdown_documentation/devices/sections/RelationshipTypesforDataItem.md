
## Relationship Types for DataItem

This section provides semantic information for the types of {{block(AbstractDataItemRelationship)}} that can be defined for a {{block(DataItem)}}.

### AbstractDataItemRelationship

association between a {{block(DataItem)}} and another entity.


{{block(AbstractDataItemRelationship)}} is an abstract entity and hence will be realized by specific {{block(AbstractDataItemRelationship)}} types in an {{block(MTConnectDevices)}} entity. See {{package(Relationship Types for DataItem)}}.


#### Value Properties of AbstractDataItemRelationship

{{tbl(value-properties-of-abstractdataitemrelationship)}} lists the Value Properties of {{block(AbstractDataItemRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(idRef)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
{: caption="Value Properties of AbstractDataItemRelationship" label="table:value-properties-of-abstractdataitemrelationship"}

Descriptions for Value Properties of {{block(AbstractDataItemRelationship)}}:

* {{property(idRef)}} 

    reference to the related entity's `id`.

* {{property(name)}} 

    descriptive name associated with this {{block(AbstractDataItemRelationship)}}.

### SpecificationRelationship

{{block(AbstractDataItemRelationship)}} that provides a semantic reference to another {{block(Specification)}} described by {{property(SpecificationRelationship::type)}} and {{property(SpecificationRelationship::idRef)}}.



#### Value Properties of SpecificationRelationship

{{tbl(value-properties-of-specificationrelationship)}} lists the Value Properties of {{block(SpecificationRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`SpecificationRelationshipTypeEnum`|1|
{: caption="Value Properties of SpecificationRelationship" label="table:value-properties-of-specificationrelationship"}

Descriptions for Value Properties of {{block(SpecificationRelationship)}}:

* {{property(type)}} 

    specifies how the {{block(Specification)}} is related.

    `SpecificationRelationshipTypeEnum` Enumeration:

    * `LIMIT` 

        referenced {{block(Specification)}} provides process limits.

### DataItemRelationship

{{block(AbstractDataItemRelationship)}} that provides a semantic reference to another {{block(DataItem)}} described by {{property(DataItemRelationship::type)}}.



#### Value Properties of DataItemRelationship

{{tbl(value-properties-of-dataitemrelationship)}} lists the Value Properties of {{block(DataItemRelationship)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`DataItemRelationshipTypeEnum`|1|
{: caption="Value Properties of DataItemRelationship" label="table:value-properties-of-dataitemrelationship"}

Descriptions for Value Properties of {{block(DataItemRelationship)}}:

* {{property(type)}} 

    specifies how the {{block(DataItem)}} is related.

    `DataItemRelationshipTypeEnum` Enumeration:

    * `ATTACHMENT` 

        reference to a {{block(DataItem)}} that associates the values with an external entity.

    * `COORDINATE_SYSTEM` 

        referenced {{block(DataItem)}} provides the `id` of the effective Coordinate System.

    * `LIMIT` 

        referenced {{block(DataItem)}} provides process limits.

    * `OBSERVATION` 

        referenced {{block(DataItem)}} provides the observed values.
