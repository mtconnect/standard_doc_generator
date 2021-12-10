
## Configurations

{{fig(Configuration)}} shows the abstract {{block(Configuration)}} and its types.

![Configuration](figures/Configuration.png "Configuration"){: width="0.8"}

> Note: See {{fig(Configuration Schema)}} for XML schema.

### Configuration


technical information about a piece of equipment describing its physical layout, functional characteristics, and relationships with other pieces of equipment.


#### Part Properties of Configuration

{{tbl(part-properties-of-configuration)}} lists the Part Properties of {{block(Configuration)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(SolidModel)}} | 0..1 |
| {{block(SensorConfiguration)}} | 0..1 |
| {{block(Motion)}} | 0..1 |
| {{block(Relationship)}} (organized by {{block(Relationships)}}) | 0..* |
| {{block(CoordinateSystem)}} (organized by {{block(CoordinateSystems)}}) | 0..* |
| {{block(Specification)}} (organized by {{block(Specifications)}}) | 0..* |
{: caption="Part Properties of Configuration"}

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

* {{block(Relationship)}} 

    association between two pieces of equipment that function independently but together perform a manufacturing operation.
    {{block(Relationships)}} groups one or more {{block(Relationship)}} types. See {{sect(Relationships)}}.

* {{block(CoordinateSystem)}} 

    reference system that associates a unique set of n parameters with each point in an n-dimensional space. {{cite(ISO 10303-218:2004)}}
    {{block(CoordinateSystems)}} groups one or more {{block(CoordinateSystem)}} entities. See {{sect(CoordinateSystems)}}.

* {{block(Specification)}} 

    design characteristics for a piece of equipment.
    {{block(Specifications)}} groups one or more {{block(Specification)}} entities. See {{sect(Specifications)}}.
