
## Relationship Types for DataItem

This section provides semantic information for the types of {{block(Relationship)}} that can be defined for a {{block(DataItem)}}.

See {{sect(Relationships)}} for details on the {{block(Relationship)}} model.

### SpecificationRelationship


{{block(Relationship)}} that provides a semantic reference to another {{block(Specification)}} described by the {{property(type)}} and {{property(idRef)}} property.


#### Value Properties of SpecificationRelationship

{{tbl(value-properties-of-specificationrelationship)}} lists the Value Properties of {{block(SpecificationRelationship)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(type)}} | `SpecificationRelationshipTypeEnum` | 1 |
| {{property(idRef)}} | `ID` | 1 |
{: caption="Value Properties of SpecificationRelationship"}

Descriptions for Value Properties of {{block(SpecificationRelationship)}}:

* {{property(type)}} 

    specifies how the {{block(Specification)}} is related.

    The value of {{property(type)}} **MUST** be one of the `SpecificationRelationshipTypeEnum` enumeration.

    `SpecificationRelationshipTypeEnum` Enumeration:


    * `LIMIT` 

        referenced {{block(Specification)}} provides process limits.

* {{property(idRef)}} 

    reference to the related {{block(Specification)}} {{property(id)}}.

### DataItemRelationship


{{block(Relationship)}} that provides a semantic reference to another {{block(DataItem)}} described by the {{property(type)}} property.


#### Value Properties of DataItemRelationship

{{tbl(value-properties-of-dataitemrelationship)}} lists the Value Properties of {{block(DataItemRelationship)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(type)}} | `DataItemRelationshipTypeEnum` | 1 |
| {{property(idRef)}} | `ID` | 1 |
{: caption="Value Properties of DataItemRelationship"}

Descriptions for Value Properties of {{block(DataItemRelationship)}}:

* {{property(type)}} 

    specifies how the {{block(DataItem)}} is related.

    The value of {{property(type)}} **MUST** be one of the `DataItemRelationshipTypeEnum` enumeration.

    `DataItemRelationshipTypeEnum` Enumeration:


    * `ATTACHMENT` 

        reference to a {{block(DataItem)}} that associates the values with an external entity.

    * `COORDINATE_SYSTEM` 

        referenced {{block(DataItem)}} provides the {{property(id)}} of the effective Coordinate System.

    * `LIMIT` 

        referenced {{block(DataItem)}} provides process limits.

    * `OBSERVATION` 

        referenced {{block(DataItem)}} provides the observed values.

* {{property(idRef)}} 

    reference to the related {{block(DataItem)}} {{property(id)}}.
