
## Compositions

This section provides semantic information for the {{block(Composition)}} entity.

See {{figure(Components)}} for the {{block(Composition)}} model diagram.

![Component with Compositions Example](figures/Component%20with%20Compositions%20Example.png "Component with Compositions Example"){: width="0.8"}

> Note: See {{lst(component-with-compositions-example)}} for the {{term(XML)}} representation of the same example.

### Composition

functional part of a piece of equipment contained within a {{block(Component)}}.



{{block(Composition)}} **MUST NOT** have child {{block(Component)}}, {{block(Composition)}}, or {{block(DataItems)}} elements.


#### Value Properties of Composition

{{tbl(value-properties-of-composition)}} lists the Value Properties of {{block(Composition)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`CompositionTypeEnum`|1|
|{{property(id)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
|{{property(uuid)}}|`ID`|0..1|
{: caption="Value Properties of Composition" label="table:value-properties-of-composition"}

Descriptions for Value Properties of {{block(Composition)}}:

* {{property(type)}} 

    type of {{block(Composition)}}. See {{package(Composition Types)}}.

    The value of {{property(type)}} **MUST** be one of the `CompositionTypeEnum` enumeration. 

* {{property(id)}} 

    unique identifier for the {{block(Composition)}} element.

* {{property(name)}} 

    name of the {{block(Composition)}} element.

* {{property(uuid)}} 

    universally unique identifier for the {{block(Composition)}}.

#### Part Properties of Composition

{{tbl(part-properties-of-composition)}} lists the Part Properties of {{block(Composition)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Description)}}|0..1|
|{{block(Configuration)}}|0..1|
{: caption="Part Properties of Composition" label="table:part-properties-of-composition"}

Descriptions for Part Properties of {{block(Composition)}}:

* {{block(Description)}} 

    descriptive content.

    See {{sect(Description)}}.

* {{block(Configuration)}} 

    technical information about an entity describing its physical layout, functional characteristics, and relationships with other entities.

    See {{sect(Configurations Model)}}.
