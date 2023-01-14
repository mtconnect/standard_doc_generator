
## Configurations

{{figure(Configuration)}} shows the abstract {{block(Configuration)}} and its types.

![Configuration](figures/Configuration.png "Configuration"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

### Configuration

technical information about an entity describing its physical layout, functional characteristics, and relationships with other entities.



#### Part Properties of Configuration

{{tbl(part-properties-of-configuration)}} lists the Part Properties of {{block(Configuration)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(SolidModel)}}|0..1|
|{{block(SensorConfiguration)}}|0..1|
|{{block(Motion)}}|0..1|
|{{block(ConfigurationRelationship)}} (organized by `Relationships`)|0..*|
|{{block(CoordinateSystem)}} (organized by `CoordinateSystems`)|0..*|
|{{block(Specification)}} (organized by `Specifications`)|0..*|
{: caption="Part Properties of Configuration" label="table:part-properties-of-configuration"}

Descriptions for Part Properties of {{block(Configuration)}}:

* {{block(SolidModel)}} 

    references to a file with the three-dimensional geometry of the {{block(Component)}} or {{block(Composition)}}.

    See {{sect(SolidModel)}}.

* {{block(SensorConfiguration)}} 

    configuration for a {{block(Sensor)}}.

    See {{block(SensorConfiguration)}}.

* {{block(Motion)}} 

    movement of the component relative to a coordinate system. 

    See {{sect(Motion)}}.

* {{block(ConfigurationRelationship)}} 

    association between two pieces of equipment that function independently but together perform a manufacturing operation.

    {{block(Relationships)}} groups one or more {{block(ConfigurationRelationship)}} types. See {{package(Relationships)}}.

* {{block(CoordinateSystem)}} 

    reference system that associates a unique set of n parameters with each point in an n-dimensional space. {{cite(ISO 10303-218:2004)}}

    {{block(CoordinateSystems)}} groups one or more {{block(CoordinateSystem)}} entities. See {{package(CoordinateSystems)}}.

* {{block(Specification)}} 

    design characteristics for a piece of equipment.

    {{block(Specifications)}} groups one or more {{block(Specification)}} entities. See {{package(Specifications)}}.
