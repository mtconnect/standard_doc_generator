
## Components

This section provides semantic information for the {{block(Component)}} entity. {{figure(Components)}} shows the {{block(Component)}} model. 

![Components](figures/Components.png "Components"){: width="0.8"}

> Note: See {{sect(Components Schema Diagrams)}} for XML schema.


### Component

logical or physical entity that provides a capability.


{{block(Component)}} is an abstract entity and will be realized by specific {{block(Component)}} types for an {{block(MTConnectDevices)}} entity. See {{package(Component Types)}} for more details on the {{block(Component)}} types.

{{block(Component)}} also provides structure for describing the {{term(lower level)}} entities associated with it.

At least one of {{block(Component)}}, {{block(DataItem)}}, or {{block(Reference)}} entities **MUST** be provided for a {{block(Component)}}.

![Component Example](figures/Component%20Example.png "Component Example"){: width="0.8"}

> Note: See {{lst(component-example)}} for the {{term(XML)}} representation of the same example.


#### Value Properties of Component

{{tbl(value-properties-of-component)}} lists the Value Properties of {{block(Component)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(id)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
|{{property(nativeName)}}|`string`|0..1|
|{{property(sampleInterval)}}|`float`|0..1|
|`<<deprecated>>` {{property(sampleRate)}}|`float`|0..1|
|{{property(uuid)}}|`ID`|0..1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
{: caption="Value Properties of Component" label="table:value-properties-of-component"}

Descriptions for Value Properties of {{block(Component)}}:

* {{property(id)}} 

    unique identifier for the {{block(Component)}}.

* {{property(name)}} 

    name of the {{block(Component)}}.
    
    When provided, {{property(name)}} **MUST** be unique for all child {{block(Component)}} entities of a parent {{block(Component)}}.

* {{property(nativeName)}} 

    common name associated with {{block(Component)}}.

* {{property(sampleInterval)}} 

    interval in milliseconds between the completion of the reading of the data associated with the {{block(Component)}} until the beginning of the next sampling of that data.
    
    This information may be used by client software applications to understand how often information from a {{block(Component)}} is expected to be refreshed.
    
    The refresh rate for data from all child {{block(Component)}} entities will be the
    same as for the parent {{block(Component)}} element unless specifically overridden by another {{property(sampleInterval)}} provided for the child
    {{block(Component)}}.

* `<<deprecated>>` {{property(sampleRate)}} 

    **DEPRECATED** in *MTConnect Version 1.2*. Replaced by {{property(sampleInterval,Component)}}.

* {{property(uuid)}} 

    universally unique identifier for the {{block(Component)}}.

* {{property(coordinateSystemIdRef)}} 

    specifies the {{block(CoordinateSystem)}} for this {{block(Component)}} and its children.

#### Reference Properties of Component

{{tbl(reference-properties-of-component)}} lists the Reference Properties of {{block(Component)}}.

|Reference Property name|Multiplicity|
|:-|:-:|
|{{block(ComponentStream)}}|0..1|
{: caption="Reference Properties of Component" label="table:reference-properties-of-component"}

Descriptions for Reference Properties of {{block(Component)}}:

* {{block(ComponentStream)}} 

    organizes the data associated with each {{block(Component)}} entity defined for a {{block(Device)}} in the associated {{term(MTConnectDevices Response Document)}}.

    {{block(ComponentStream)}} {{termplural(organize)}} the {{block(Observation)}} entities associated with the {{block(Component)}}.
    
    See {{package(Observation Information Model)}} for the {{block(ComponentStream)}} model.
    
    > Note 1 to entry: In the {{term(XML)}} representation, {{block(ComponentStream)}} entities **MUST NOT** appear in the {{term(MTConnectDevices Response Document)}}.
    
    > Note 2 to entry: In the {{term(XML)}} representation, {{block(ComponentStream)}} entities **MUST** appear only in the {{term(MTConnectStreams Response Document)}}.

#### Part Properties of Component

{{tbl(part-properties-of-component)}} lists the Part Properties of {{block(Component)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Description)}}|0..1|
|{{block(Composition)}} (organized by `Compositions`)|0..*|
|{{block(Component)}} (organized by `Components`)|0..*|
|{{block(Configuration)}}|0..1|
|{{block(DataItem)}} (organized by `DataItems`)|0..*|
|{{block(Observation)}} (organized by `Observations`)|0..*|
|{{block(Reference)}} (organized by `References`)|0..*|
{: caption="Part Properties of Component" label="table:part-properties-of-component"}

Descriptions for Part Properties of {{block(Component)}}:

* {{block(Description)}} 

    descriptive content.

    See {{sect(Description)}}.

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.
    

    {{block(Compositions)}} groups one or more {{block(Composition)}} entities. See {{package(Compositions)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

    {{block(Components)}} groups one or more {{block(Component)}} entities.

* {{block(Configuration)}} 

    technical information about an entity describing its physical layout, functional characteristics, and relationships with other entities.

    See {{package(Configurations)}}.

* {{block(DataItem)}} 

    information reported about a piece of equipment.

    {{block(DataItems)}} groups one or more {{block(DataItem)}} entities. See {{package(DataItems)}}.

* {{block(Observation)}} 

    abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.

    {{block(Observations)}} groups one or more {{block(Observation)}}s made by the {{block(Component)}} entity. 
    
    {{block(Component)}} make {{block(Observation)}}s about observed {{block(DataItem)}}s.
    
    See {{package(Observation Information Model)}} for the {{block(Observation)}} model.
    
    > Note 1 to entry: In the {{term(XML)}} representation, {{block(Observation)}} entities **MUST NOT** appear in the {{term(MTConnectDevices Response Document)}}.
    
    > Note 2 to entry: In the {{term(XML)}} representation, {{block(Observation)}} entities **MUST** appear only in the {{term(MTConnectStreams Response Document)}}.

* {{block(Reference)}} 

    pointer to information that is associated with another entity defined elsewhere in the {{block(MTConnectDevices)}} entity for a piece of equipment.

    {{block(References)}} groups one or more {{block(Reference)}} entities associated with the {{block(Component)}}. See {{package(References)}}.

### Description

descriptive content.


> Note 1 to entry: See {{figure(Component Example)}} for an example.

> Note 2 to entry: See {{lst(component-example)}} for the {{term(XML)}} representation of the same example.


The value of {{property(Description)}} **MUST** be `string`.

#### Value Properties of Description

{{tbl(value-properties-of-description)}} lists the Value Properties of {{block(Description)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(manufacturer)}}|`string`|0..1|
|{{property(model)}}|`string`|0..1|
|{{property(serialNumber)}}|`string`|0..1|
|{{property(station)}}|`string`|0..1|
{: caption="Value Properties of Description" label="table:value-properties-of-description"}

Descriptions for Value Properties of {{block(Description)}}:

* {{property(manufacturer)}} 

    name of the manufacturer of the physical or logical part of a piece of equipment represented by this element.

* {{property(model)}} 

    model description of the physical part or logical function of a piece of equipment represented by this element.

* {{property(serialNumber)}} 

    serial number associated with a piece of equipment.

* {{property(station)}} 

    station where the physical part or logical function of a piece of equipment is located when it is part of a manufacturing unit or cell with multiple stations.
