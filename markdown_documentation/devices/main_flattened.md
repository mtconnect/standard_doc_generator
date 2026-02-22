# MTConnect Specification and Material Statement

{{term(AMT)}} owns the copyright in this MTConnect Specification or Material. {{term(AMT)}} grants to you a non-exclusive, non-transferable, revocable, non-sublicensable, fully-paid-up copyright license to reproduce, copy and redistribute this MTConnect Specification or Material, provided that you may only copy or redistribute the MTConnect Specification or Material in the form in which you received it, without modifications, and with all copyright notices and other notices and disclaimers contained in the MTConnect Specification or Material.

If you intend to adopt or implement an MTConnect Specification or Material in a product, whether hardware, software or firmware, which complies with an MTConnect Specification, you shall agree to the MTConnect Specification Implementer License Agreement ("Implementer License") or to the MTConnect Intellectual Property Policy and Agreement ("IP Policy"'). The Implementer License and IP Policy each sets forth the license terms and other terms of use for MTConnect Implementers to adopt or implement the MTConnect Specifications, including certain license rights covering necessary patent claims for that purpose. These materials can be found at {{url(www.MTConnect.org)}}, or or by contacting {{url(mailto:info@MTConnect.org)}}. 

MTConnect Institute and {{term(AMT)}} have no responsibility to identify patents, patent claims or patent applications which may relate to or be required to implement a Specification, or to determine the legal validity or scope of any such patent claims brought to their attention. Each MTConnect Implementer is responsible for securing its own licenses or rights to any patent or other intellectual property rights that may be necessary for such use, and neither {{term(AMT)}} nor MTConnect Institute have any obligation to secure any such rights.

This Material and all MTConnect Specifications and Materials are provided "as is" and MTConnect Institute and {{term(AMT)}}, and each of their respective members, officers, affiliates, sponsors and agents, make no representation or warranty of any kind relating to these materials or to any implementation of the MTConnect Specifications or Materials in any product, including, without limitation, any expressed or implied warranty of noninfringement, merchantability, or fitness for particular purpose, or of the accuracy, reliability, or completeness of information contained herein. In no event shall MTConnect Institute or {{term(AMT)}} be liable to any user or implementer of MTConnect Specifications or Materials for the cost of procuring substitute goods or services, lost profits, loss of use, loss of data or any incidental, consequential, indirect, special or punitive damages or other direct damages, whether under contract, tort, warranty or otherwise, arising in any way out of access, use or inability to use the MTConnect Specification or other MTConnect Materials, whether or not they had advance notice of the possibility of such damage.

The normative XMI is located at the following URL: [`MTConnectSysMLModel.xml`](https://model.mtconnect.org/MTConnectSysMLModel.xml)


# Purpose of This Document

This document, {{package(Device Information Model)}} of the MTConnect Standard, establishes the rules and terminology to be used by designers to describe the function and operation of a piece of equipment and to define the data that is provided by an {{term(agent)}} from the equipment.  The {{term(Device Information Model)}}  also defines the structure for the {{term(response document)}} that is returned from an {{term(agent)}} in response to a {{term(probe request)}}. 

In the MTConnect Standard, equipment represents any tangible property that is used in the operations of a manufacturing facility.  Examples of equipment are machine tools, ovens, sensor units, workstations, software applications, and bar feeders. 

> Note: See {{package(Observation Information Model)}} of the MTConnect Standard for details on the {{term(response document)}} that are returned from an {{term(agent)}} in response to a {{term(sample request)}} or {{term(current request)}}.

# Terminology and Conventions

Refer to {{package(Fundamentals)}} for a dictionary of terms, reserved language, and document conventions used in the MTConnect Standard.

{{printglossary[title=General Terms, type=general]()}}
{{printglossary[title=Information Model Terms, type=informationmodel]()}}
{{printglossary[title=Protocol Terms, type=protocol]()}}
{{printglossary[title=HTTP Terms, type=http]()}}
{{printglossary[title=XML Terms, type=xml]()}}
{{printglossary[title=MTConnect Terms, type=conceptmodel]()}}

{{printacronyms()}}

{{printbibliography[title=MTConnect References,keyword=MTC]()}}

{{printbibliography[title=Other References,notkeyword=MTC]()}}

{{glsaddall()}}


# Device Information Model

The {{term(Device Information Model)}} provides a representation of the physical and logical configuration for a piece of equipment used for a manufacturing process or for any other purpose.  It also provides the definition of data that may be reported by that equipment. 

Using information defined in the {{term(Device Information Model)}}, a software application can determine the configuration and reporting capabilities of a piece of equipment.  To do this, the software application issues a {{term(probe request)}} (defined in {{package(Fundamentals)}}) to an {{term(agent)}} associated with a piece of equipment. An {{term(agent)}} responds to the {{term(probe request)}} with an {{term(MTConnectDevices Response Document)}} that contains information describing both the physical and logical structure of the piece of equipment and a detailed description of each {{term(Observation)}} that can be reported by the {{term(agent)}} associated with the piece of equipment. This information allows the client software application to interpret the document and to extract the data with the same meaning, value, and context that it had at its original source.  

The {{term(MTConnectDevices Response Document)}} is comprised of two sections: {{block(Header)}} and {{block(Devices)}}.

The {{block(Header)}} section contains protocol related information as defined in {{package(Fundamentals)}}.

The {{block(Devices)}} section of the {{term(MTConnectDevices Response Document)}} contains a {{block(Device)}} entity for each piece of equipment described in the document.  Each {{block(Device)}} is comprised of two primary types of entities - {{termplural(Component)}} and {{termplural(DataItem)}}.  

{{termplural(Component)}} organize information that represents the physical and logical parts and sub-parts of a piece of equipment (See {{package(Components)}} for more details).  

{{termplural(DataItem)}} describe data that can be reported by a piece of equipment.  In the {{term(Device Information Model)}}, {{termplural(DataItem)}} are defined as {{block(DataItem)}} entities (See {{package(DataItem Types)}}).

The {{termplural(Component)}} and {{termplural(DataItem)}} in the {{term(MTConnectDevices Response Document)}} provide information representing the physical and logical structure for a piece of equipment and the types of data that the piece of equipment can report relative to that structure.   The {{term(MTConnectDevices Response Document)}} does not contain values for the data types reported by the piece of equipment.  The {{term(MTConnectStreams Response Document)}} defined in {{package(Observation Information Model)}} provides the data values that are reported by the piece of equipment.

> Note:  The MTConnect Standard also defines the information model for {{termplural(asset)}}.  An {{term(asset)}} is something that is used in the manufacturing process, but is not permanently associated with a single piece of equipment, can be removed from the piece of equipment without compromising its function, and can be associated with other pieces of equipment during its lifecycle.  See {{package(Asset Information Model)}} for more details on {{termplural(asset)}}.


## Device

{{block(Component)}} composed of a piece of equipment that produces {{termplural(observation)}} about itself.


A {{block(Device)}} {{termplural(organize)}} its parts as {{block(Component)}} entities.

A {{block(Device)}} **MUST** have a {{property(Device::name)}} and {{property(Device::uuid)}} to identify itself. 

A {{block(Device)}} **MUST** have the following {{block(DataItems)}}: {{block(Availability)}}, {{block(AssetChanged)}}, and {{block(AssetRemoved)}}.

See {{package(Components)}} for more details on the properties of {{block(Device)}}.

> See {{sect(Part Properties of Device)}} for a list of {{term(top level)}} {{block(Component)}} types for a {{block(Device)}}.



### Value Properties of Device

{{tbl(value-properties-of-device)}} lists the Value Properties of {{block(Device)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|`<<deprecated>>` {{property(iso841Class)}}|`string`|0..1|
|{{property(uuid)}}|`UUID`|1|
|{{property(mtconnectVersion)}}|`string`|0..1|
|{{property(name)}}|`string`|1|
|{{property(hash)}}|`string`|0..1|
{: caption="Value Properties of Device" label="table:value-properties-of-device"}

Descriptions for Value Properties of {{block(Device)}}:

* `<<deprecated>>` {{property(iso841Class)}} 

    **DEPRECATED** in *MTConnect Version 1.2*.

* {{property(mtconnectVersion)}} 

    MTConnect version of the {{term(Device Information Model)}} used to configure the information to be published for a piece of equipment in an {{term(MTConnect Response Document)}}.

* {{property(hash)}} 

    condensed message digest from a secure one-way hash function. {{cite(FIPS PUB 180-4)}}

### Part Properties of Device

{{tbl(part-properties-of-device)}} lists the Part Properties of {{block(Device)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Auxiliary)}} (organized by `<<organizer>>` `Auxiliaries`)|0..*|
|{{block(Controller)}} (organized by `<<organizer>>` `Controllers`)|0..*|
|{{block(Interface)}} (organized by `<<organizer>>` `Interfaces`)|0..*|
|{{block(Resource)}} (organized by `<<organizer>>` `Resources`)|0..*|
|{{block(Structure)}} (organized by `<<organizer>>` `Structures`)|0..*|
|{{block(System)}} (organized by `<<organizer>>` `Systems`)|0..*|
|{{block(Axis)}} (organized by `<<organizer>>` `Axes`)|0..*|
|{{block(Adapter)}} (organized by `<<organizer>>` `Adapters`)|0..*|
{: caption="Part Properties of Device" label="table:part-properties-of-device"}

Descriptions for Part Properties of {{block(Device)}}:

* {{block(Auxiliary)}} 

    abstract {{block(Component)}} composed of removable part(s) of a piece of equipment that provides supplementary or extended functionality.

* {{block(Controller)}} 

    {{block(System)}} that provides regulation or management of a system or component. {{cite(ISO 16484-5:2017)}}

* {{block(Interface)}} 

    abstract {{block(Component)}} that coordinates actions and activities between pieces of equipment.
    

* {{block(Resource)}} 

    abstract {{block(Component)}} composed of material or personnel involved in a manufacturing process.

* {{block(Structure)}} 

    {{block(Component)}} composed of part(s) comprising the rigid bodies of the piece of equipment.

* {{block(System)}} 

    abstract {{block(Component)}} that is permanently integrated into the piece of equipment.

* {{block(Axis)}} 

    abstract {{block(Component)}} composed of a motion system that provides linear or rotational motion for a piece of equipment.

* {{block(Adapter)}} 

    {{block(Component)}} that provides information about the data source for an {{term(MTConnect Agent)}}.

### Commonly Observed DataItem Types for Device

{{tbl(commonly-observed-dataitem-types-for-device)}} lists the Commonly Observed DataItem Types for {{block(Device)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(Availability)}}|1|
|{{block(AssetChanged)}}|1|
|{{block(AssetRemoved)}}|1|
{: caption="Commonly Observed DataItem Types for Device" label="table:commonly-observed-dataitem-types-for-device"}


# Components Model

{{block(MTConnectDevices)}} provides the physical and logical architecture of a piece of equipment. {{figure(Device Entity Hierarchy Example)}} provides an overview of the entities used in an example of an {{block(MTConnectDevices)}} entity.

![Device Entity Hierarchy Example](figures/Device%20Entity%20Hierarchy%20Example.png "Device Entity Hierarchy Example"){: width="0.8"}

> Note 1 to entry: See {{lst(device-entity-hierarchy-example)}} for the {{term(XML)}} representation of the same example.

> Note 2 to entry: Example above only shows the {{block(Component)}} and {{block(Composition)}} level hierarchy. For a complete semantics on each kind see {{package(Components)}} and {{package(Compositions)}}.

A variety of entities are defined to describe a piece of equipment.  Some of these entities **MUST** always be defined for an {{block(MTConnectDevices)}} entity, while others are optional and **MAY** be used, as required, to provide additional structure.

The first, or highest level, entity defined for an {{block(MTConnectDevices)}} entity is {{block(Devices)}}. {{block(Devices)}} is used to group one or more pieces of equipment into a single document.  {{block(Devices)}} **MUST** always be defined for an {{block(MTConnectDevices)}} entity.

{{block(Device)}} is the next entity defined for the {{block(MTConnectDevices)}} entity. A separate {{block(Device)}} entity is used to identify each piece of equipment for an {{block(MTConnectDevices)}} entity. Each {{block(Device)}} provides information on the physical and logical structure of the piece of equipment and the data associated with that equipment. {{block(Device)}} can also represent any logical grouping of pieces of equipment that function as a unit or any other data source that provides data through an {{term(agent)}}.

One or more {{block(Device)}} entities **MUST** always be defined for an {{block(MTConnectDevices)}} entity.

{{block(Components)}} is the next entity defined for the {{block(MTConnectDevices)}} entity. {{block(Components)}} is used to group information describing lower level physical parts or logical functions of a piece of equipment.

{{block(Component)}} is the next level of entity defined for the {{block(MTConnectDevices)}} entity. {{block(Component)}} is both an abstract type entity and an {{term(organizer)}} type entity. 

As an abstract entity, {{block(Component)}} will always be realized by a specific {{block(Component)}} type defined in {{package(Component Types)}}. Each {{block(Component)}} can also be used to organize information describing {{term(lower level)}} entities or {{termplural(DataItem)}} associated with the {{block(Component)}}.

If {{term(lower level)}} entities are described, these entities are by definition child {{block(Component)}} entities of a parent {{block(Component)}}. At this next level, the {{term(lower level)}} child {{block(Component)}} entities are grouped by {{block(Components)}}.

A {{block(Component)}} **MAY** be further decomposed into {{block(Composition)}} entities that are grouped by {{block(Compositions)}}. These describe the lowest level basic structural or functional building blocks contained within a {{block(Component)}}. Data provided for a {{block(Component)}} provides more specific meaning when it is associated with one of the {{block(Composition)}} entities of the {{block(Component)}}. The different {{block(Composition)}} types that **MAY** be defined for the {{block(MTConnectDevices)}} entity are defined in {{package(Compositions)}}.

This parent-child relationship can continue to any depth required to fully define a piece of equipment.

> Note: See {{figure(Device Entity Hierarchy Example)}} for an example.


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
|{{property(uuid)}}|`UUID`|0..1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
{: caption="Value Properties of Component" label="table:value-properties-of-component"}

Descriptions for Value Properties of {{block(Component)}}:

* {{property(id)}} 

    unique identifier for the {{block(Component)}}.

* {{property(name)}} 

    name of the {{block(Component)}}.
    
    When provided, {{property(Component::name)}} **MUST** be unique for all child {{block(Component)}} entities of a parent {{block(Component)}}.

* {{property(nativeName)}} 

    common name associated with {{block(Component)}}.

* {{property(sampleInterval)}} 

    interval in milliseconds between the completion of the reading of the data associated with the {{block(Component)}} until the beginning of the next sampling of that data.
    
    This information may be used by client software applications to understand how often information from a {{block(Component)}} is expected to be refreshed.
    
    The refresh rate for data from all child {{block(Component)}} entities will be the
    same as for the parent {{block(Component)}} element unless specifically overridden by another {{property(Component::sampleInterval)}} provided for the child {{block(Component)}}.

* `<<deprecated>>` {{property(sampleRate)}} 

    **DEPRECATED** in *MTConnect Version 1.2*. Replaced by {{property(Component::sampleInterval)}}.

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

    identifier where a manufacturing function takes place.



## Devices

This section provides semantic information for the {{block(Device)}} types.

### Agent

{{block(Device)}} composed of an {{term(MTConnect Agent)}} and all its connected data sources.


An {{block(Agent)}} **MUST** be provided by all {{term(MTConnect Agent)}} implementations.

An {{block(Agent)}} **MUST** provide notifications when devices are added or changed.

An {{block(Agent)}} **MUST** provide connection information for each data source currently supplying data to the {{term(MTConnect Agent)}}.

An {{block(Agent)}} **MAY** provide information about telemetry relating to data sources.

An {{block(Agent)}} **MAY** provide information about the {{term(MTConnect Agent)}} resource utilization.





## Component Types

This section provides semantic information for the types of {{block(Component)}}. 

> Note: In the {{term(XML)}} representation, {{block(Component)}} entities are defined into two major categories:

> * {{term(top level)}} {{block(Component)}} entities that {{termplural(organize)}} the most significant physical or logical functions of a piece of equipment (see {{sect(Part Properties of Device)}}).  They **MAY** also be used as {{term(lower level)}} {{block(Component)}} entities; as required. See {{package(Component Organizer Types)}}.

> * {{term(lower level)}} {{block(Component)}} entities composed of the sub-parts of the parent {{block(Component)}} to provide more clarity and granularity to the physical or logical structure of the {{term(top level)}} {{block(Component)}} entities.

This section provides guidance for the most common relationships between {{block(Component)}} types.  However, all {{block(Component)}} types **MAY** be used in any configuration, as required, to fully describe a piece of equipment.

As described in {{package(Components)}}, {{block(Component)}} is an abstract entity and will be always realized by a specific {{block(Component)}} type.

### Adapter

{{block(Component)}} that provides information about the data source for an {{term(MTConnect Agent)}}.


It **MAY** contain connectivity state of the data source and additional telemetry about the data source and source-specific information.


### Amplifier

leaf {{block(Component)}} composed of an electronic component or circuit that amplifies power, electric current, or voltage.



#### Part Properties of Amplifier

{{tbl(part-properties-of-amplifier)}} lists the Part Properties of {{block(Amplifier)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Amplifier" label="table:part-properties-of-amplifier"}

Descriptions for Part Properties of {{block(Amplifier)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Auxiliary

abstract {{block(Component)}} composed of removable part(s) of a piece of equipment that provides supplementary or extended functionality.



#### Deposition

{{block(Auxiliary)}} that manages the addition of material or state change of material being performed in an additive manufacturing process.


For example, this could describe the portion of a piece of equipment that manages a material extrusion process or a vat polymerization process.


#### Loader

{{block(Auxiliary)}} that provides movement and distribution of materials, parts, tooling, and other items to or from a piece of equipment.



##### BarFeeder

{{block(Loader)}} that delivers bar stock to a piece of equipment.



#### ToolingDelivery

{{block(Auxiliary)}} that manages, positions, stores, and delivers tooling within a piece of equipment.




##### GangToolBar

{{block(ToolingDelivery)}} composed of a tool mounting mechanism that holds any number of tools. 


Tools are located in {{block(Station)}} entities. Tools are positioned for use in the manufacturing process by linearly positioning the {{block(GangToolBar)}}.


##### AutomaticToolChanger

{{block(ToolingDelivery)}} composed of a tool delivery mechanism that moves tools between a {{block(ToolMagazine)}} and a {{term(spindle)}} a {{block(Turret)}}.


{{block(AutomaticToolChanger)}} may also transfer tools between a location outside of a piece of equipment and a {{block(ToolMagazine)}} or {{block(Turret)}}.


##### ToolMagazine

{{block(ToolingDelivery)}} composed of a tool storage mechanism that holds any number of tools. 



Tools are located in {{block(Pot)}}s. {{block(Pot)}}s are moved into position to transfer tools into or out of the {{block(ToolMagazine)}} by an {{block(AutomaticToolChanger)}}.


##### ToolRack

{{block(ToolingDelivery)}} composed of a linear or matrixed tool storage mechanism that holds any number of tools.


Tools are located in {{block(Station)}} entities.


##### Turret

{{block(ToolingDelivery)}} composed of a tool mounting mechanism that holds any number of tools.


Tools are positioned for use in the manufacturing process by rotating the {{block(Turret)}}.


#### WasteDisposal

{{block(Auxiliary)}} that removes manufacturing byproducts from a piece of equipment.



### Axis

abstract {{block(Component)}} composed of a motion system that provides linear or rotational motion for a piece of equipment.


In robotics, the term *Axis* is synonymous with *Joint*. A *Joint* is the connection between two parts of the structure that move in relation to each other.

{{block(Linear)}} and {{block(Rotary)}} components **MUST** have {{property(Component::name)}} that **MUST** follow the conventions described below. Use the {{property(Component::nativeName)}} for the manufacturer's name of the axis if it differs from the assigned {{property(Component::name)}}.

MTConnect has two high-level classes for automation equipment as follows: (1) Equipment that controls cartesian coordinate axes and (2) Equipment that controls articulated axes. There are ambiguous cases where some machines exhibit both characteristics; when this occurs, the primary control system's configuration determines the classification.

Examples of cartesian coordinate equipment are CNC Machine Tools, Coordinate measurement machines, as specified in ISO 841, and 3D Printers. Examples of articulated automation equipment are Robotic systems as specified in ISO 8373.

The following sections define the designation of names for the axes and additional guidance when selecting the correct scheme to use for a given piece of equipment.

#### Cartesian Coordinate Naming Conventions

A Three-Dimensional Cartesian Coordinate control system organizes its axes orthogonally relative to a machine coordinate system where the manufacturer of the equipment specifies the origin. 

{{block(Axes)}} {{property(Component::name)}} **SHOULD** comply with ISO 841, if possible.

##### Linear Motion

A piece of equipment **MUST** represent prismatic motion using a {{block(Linear)}} axis and assign its {{property(Component::name)}} using the designations `X`, `Y`, and `Z`. A {{block(Linear)}} axis {{property(Component::name)}} **MUST** append a monotonically increasing suffix when there are more than one parallel axes; for example, `X2`, `X3`, and `X4`. 

##### Rotary Motion

MTConnect **MUST** assign the {{property(Component::name)}} to {{block(Rotary)}} axes exhibiting rotary motion using `A`, `B`, and `C`. A {{block(Rotary)}} axis {{property(Component::name)}} **MUST** append a monotonically increasing suffix when more than one {{block(Rotary)}} axis rotates around the same {{block(Linear)}} axis; for example, `A2`, `A3`, and `A4`. 

#### Articulated Machine Control Systems

An articulated control system's axes represent the connecting linkages between two adjacent rigid members of an assembly. The {{block(Linear)}} axis represents prismatic motion, and the {{block(Rotary)}} axis represents the rotational motion of the two related members. The control organizes the axes in a kinematic chain from the mounting surface (base) to the end-effector or tooling.

#### Articulated Machine Axis Names

The axes of articulated machines represent forward kinematic relationships between mechanical linkages. Each axis is a connection between linkages, also referred to as joints, and **MUST** be named using a `J` followed by a monotonically increasing number; for example, `J1`, `J2`, `J3`.  The numbering starts at the base axis connected or closest to the mounting surface, `J1`, incrementing to the mechanical interface, `Jn`, where `n` is the number of the last axis. The chain forms a parent-child relationship with the parent being the axis closest to the base.

A machine having an axis with more than one child **MUST** number each branch using its numeric designation followed by a branch number and a monotonically increasing number. For example, if `J2` has two children, the first child branch **MUST** be named `J2.1.1` and the second child branch `J2.2.1`. A child of the first branch **MUST** be named `J2.1.2`, incrementing to `J2.1.n`, where `J2.1.n` is the number of the last axis in that branch.


#### Linear

{{block(Component Types::Axis)}} that provides prismatic motion along a fixed axis.



#### Part Properties of Linear

{{tbl(part-properties-of-linear)}} lists the Part Properties of {{block(Linear)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesLoad)}}|0..1|
|{{block(observesTemperature)}}|0..1|
|{{block(observesAxisFeedrateActual)}}|0..1|
{: caption="Part Properties of Linear" label="table:part-properties-of-linear"}

Descriptions for Part Properties of {{block(Linear)}}:

* {{block(Load)}} 

    {{def(SampleEnum::LOAD)}}

* {{block(Temperature)}} 

    {{def(SampleEnum::TEMPERATURE)}}

* {{block(AxisFeedrate.Actual)}} 

    measured or reported value of an {{term(observation)}}.

#### Rotary

{{block(Component Types::Axis)}} that provides rotation about a fixed axis.



#### Part Properties of Rotary

{{tbl(part-properties-of-rotary)}} lists the Part Properties of {{block(Rotary)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesLoad)}}|0..1|
|{{block(observesTemperature)}}|0..1|
|{{block(observesRotaryVelocity)}}|0..1|
|{{block(observesAxisFeedrate)}}|0..1|
{: caption="Part Properties of Rotary" label="table:part-properties-of-rotary"}

Descriptions for Part Properties of {{block(Rotary)}}:

* {{block(Load)}} 

    {{def(SampleEnum::LOAD)}}

* {{block(Temperature)}} 

    {{def(SampleEnum::TEMPERATURE)}}

* {{block(RotaryVelocity)}} 

    {{def(SampleEnum::ROTARY_VELOCITY)}}

* {{block(AxisFeedrate)}} 

    {{def(SampleEnum::AXIS_FEEDRATE)}}

#### `<<deprecated>>`Spindle

{{block(Component)}} that provides an axis of rotation for the purpose of rapidly rotating a part or a tool to provide sufficient surface speed for cutting operations.

{{block(Spindle)}} was **DEPRECATED** in *MTConnect Version 1.1* and was replaced by {{block(RotaryMode)}}.



### Ballscrew

leaf {{block(Component)}} composed of a mechanical structure that transforms rotary motion into linear motion.



#### Part Properties of Ballscrew

{{tbl(part-properties-of-ballscrew)}} lists the Part Properties of {{block(Ballscrew)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Ballscrew" label="table:part-properties-of-ballscrew"}

Descriptions for Part Properties of {{block(Ballscrew)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Belt

leaf {{block(Component)}} composed of an endless flexible band that transmits motion for a piece of equipment or conveys materials and objects.



#### Part Properties of Belt

{{tbl(part-properties-of-belt)}} lists the Part Properties of {{block(Belt)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Belt" label="table:part-properties-of-belt"}

Descriptions for Part Properties of {{block(Belt)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Brake

leaf {{block(Component)}} that slows or stops a moving object by the absorption or transfer of the energy of momentum, usually by means of friction, electrical force, or magnetic force.



#### Part Properties of Brake

{{tbl(part-properties-of-brake)}} lists the Part Properties of {{block(Brake)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Brake" label="table:part-properties-of-brake"}

Descriptions for Part Properties of {{block(Brake)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Chain

leaf {{block(Component)}} composed of interconnected series of objects that band together and are used to transmit motion for a piece of equipment or to convey materials and objects.



#### Part Properties of Chain

{{tbl(part-properties-of-chain)}} lists the Part Properties of {{block(Chain)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Chain" label="table:part-properties-of-chain"}

Descriptions for Part Properties of {{block(Chain)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Chopper

leaf {{block(Component)}} that breaks material into smaller pieces.



#### Part Properties of Chopper

{{tbl(part-properties-of-chopper)}} lists the Part Properties of {{block(Chopper)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Chopper" label="table:part-properties-of-chopper"}

Descriptions for Part Properties of {{block(Chopper)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Chuck

leaf {{block(Component)}} composed of a mechanism that holds a part or stock material in place.



### Chute

leaf {{block(Component)}} composed of an inclined channel that conveys material.



#### Part Properties of Chute

{{tbl(part-properties-of-chute)}} lists the Part Properties of {{block(Chute)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Chute" label="table:part-properties-of-chute"}

Descriptions for Part Properties of {{block(Chute)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### CircuitBreaker

leaf {{block(Component)}} that interrupts an electric circuit.



#### Part Properties of CircuitBreaker

{{tbl(part-properties-of-circuitbreaker)}} lists the Part Properties of {{block(CircuitBreaker)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of CircuitBreaker" label="table:part-properties-of-circuitbreaker"}

Descriptions for Part Properties of {{block(CircuitBreaker)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Clamp

leaf {{block(Component)}} that strengthens, support, or fastens objects in place.



#### Part Properties of Clamp

{{tbl(part-properties-of-clamp)}} lists the Part Properties of {{block(Clamp)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Clamp" label="table:part-properties-of-clamp"}

Descriptions for Part Properties of {{block(Clamp)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Compressor

leaf {{block(Component)}} composed of a pump or other mechanism that reduces volume and increases pressure of gases in order to condense the gases to drive pneumatically powered pieces of equipment.



#### Part Properties of Compressor

{{tbl(part-properties-of-compressor)}} lists the Part Properties of {{block(Compressor)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Compressor" label="table:part-properties-of-compressor"}

Descriptions for Part Properties of {{block(Compressor)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### CoolingTower

leaf {{block(Component)}} composed of a heat exchange system that uses a fluid to transfer heat to the atmosphere.



#### Part Properties of CoolingTower

{{tbl(part-properties-of-coolingtower)}} lists the Part Properties of {{block(CoolingTower)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of CoolingTower" label="table:part-properties-of-coolingtower"}

Descriptions for Part Properties of {{block(CoolingTower)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Door

{{block(Component)}} composed of a mechanical mechanism or closure that can cover a physical access portal into a piece of equipment allowing or restricting access to other parts of the equipment.


The closure can be opened or closed to allow or restrict access to other parts of the equipment.

{{block(Door)}} **MUST** have {{block(DoorState)}} data item to indicate if the door is `OPEN`, `CLOSED`, or `UNLATCHED`. A {{block(Component)}} **MAY** contain multiple {{block(Door)}} entities.


#### Commonly Observed DataItem Types for Door

{{tbl(commonly-observed-dataitem-types-for-door)}} lists the Commonly Observed DataItem Types for {{block(Door)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(DoorState)}}|1|
{: caption="Commonly Observed DataItem Types for Door" label="table:commonly-observed-dataitem-types-for-door"}

### Drain

leaf {{block(Component)}} that allows material to flow for the purpose of drainage from, for example, a vessel or tank.



#### Part Properties of Drain

{{tbl(part-properties-of-drain)}} lists the Part Properties of {{block(Drain)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Drain" label="table:part-properties-of-drain"}

Descriptions for Part Properties of {{block(Drain)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Encoder

leaf {{block(Component)}} that measures position.



#### Part Properties of Encoder

{{tbl(part-properties-of-encoder)}} lists the Part Properties of {{block(Encoder)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Encoder" label="table:part-properties-of-encoder"}

Descriptions for Part Properties of {{block(Encoder)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Environmental

{{block(Component)}} that observes the surroundings of another {{block(Component)}}.

> Note: {{block(Environmental)}} **SHOULD** be organized by {{block(Auxillaries)}}, {{block(Systems)}} or {{block(Parts)}} depending on the relationship to the {{block(Component)}}.



### ExpiredPot

leaf {{block(Component)}} that is a {{block(Pot)}} for a tool that is no longer usable for removal from a {{block(ToolMagazine)}} or {{block(Turret)}}.



#### Part Properties of ExpiredPot

{{tbl(part-properties-of-expiredpot)}} lists the Part Properties of {{block(ExpiredPot)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of ExpiredPot" label="table:part-properties-of-expiredpot"}

Descriptions for Part Properties of {{block(ExpiredPot)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### ExposureUnit

leaf {{block(Component)}} that emits a type of radiation.



#### Part Properties of ExposureUnit

{{tbl(part-properties-of-exposureunit)}} lists the Part Properties of {{block(ExposureUnit)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of ExposureUnit" label="table:part-properties-of-exposureunit"}

Descriptions for Part Properties of {{block(ExposureUnit)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### ExtrusionUnit

leaf {{block(Component)}} that dispenses liquid or powered materials.



#### Part Properties of ExtrusionUnit

{{tbl(part-properties-of-extrusionunit)}} lists the Part Properties of {{block(ExtrusionUnit)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of ExtrusionUnit" label="table:part-properties-of-extrusionunit"}

Descriptions for Part Properties of {{block(ExtrusionUnit)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Fan

leaf {{block(Component)}} that produces a current of air.



#### Part Properties of Fan

{{tbl(part-properties-of-fan)}} lists the Part Properties of {{block(Fan)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Fan" label="table:part-properties-of-fan"}

Descriptions for Part Properties of {{block(Fan)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Filter

leaf {{block(Component)}} through which liquids or gases are passed to remove suspended impurities or to recover solids.



#### Part Properties of Filter

{{tbl(part-properties-of-filter)}} lists the Part Properties of {{block(Filter)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Filter" label="table:part-properties-of-filter"}

Descriptions for Part Properties of {{block(Filter)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Galvanomotor

leaf {{block(Component)}} composed of an electromechanical actuator that produces deflection of a beam of light or energy in response to electric current through its coil in a magnetic field.



#### Part Properties of Galvanomotor

{{tbl(part-properties-of-galvanomotor)}} lists the Part Properties of {{block(Galvanomotor)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Galvanomotor" label="table:part-properties-of-galvanomotor"}

Descriptions for Part Properties of {{block(Galvanomotor)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Gripper

leaf {{block(Component)}} that holds a part, stock material, or any other item in place.



#### Part Properties of Gripper

{{tbl(part-properties-of-gripper)}} lists the Part Properties of {{block(Gripper)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Gripper" label="table:part-properties-of-gripper"}

Descriptions for Part Properties of {{block(Gripper)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Hopper

leaf {{block(Component)}} composed of a chamber or bin in which materials are stored temporarily, typically being filled through the top and dispensed through the bottom.



#### Part Properties of Hopper

{{tbl(part-properties-of-hopper)}} lists the Part Properties of {{block(Hopper)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Hopper" label="table:part-properties-of-hopper"}

Descriptions for Part Properties of {{block(Hopper)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### LinearPositionFeedback

leaf {{block(Component)}} that measures linear motion or position.

**DEPRECATION WARNING** : May be deprecated in the future. Recommend using {{block(Encoder)}}.



#### Part Properties of LinearPositionFeedback

{{tbl(part-properties-of-linearpositionfeedback)}} lists the Part Properties of {{block(LinearPositionFeedback)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of LinearPositionFeedback" label="table:part-properties-of-linearpositionfeedback"}

Descriptions for Part Properties of {{block(LinearPositionFeedback)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Lock

{{block(Component)}} that physically prohibits a {{block(Device)}} or {{block(Component)}} from opening or operating.



#### Commonly Observed DataItem Types for Lock

{{tbl(commonly-observed-dataitem-types-for-lock)}} lists the Commonly Observed DataItem Types for {{block(Lock)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(LockState)}}|0..1|
{: caption="Commonly Observed DataItem Types for Lock" label="table:commonly-observed-dataitem-types-for-lock"}

### Motor

leaf {{block(Component)}} that converts electrical, pneumatic, or hydraulic energy into mechanical energy.



#### Part Properties of Motor

{{tbl(part-properties-of-motor)}} lists the Part Properties of {{block(Motor)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Motor" label="table:part-properties-of-motor"}

Descriptions for Part Properties of {{block(Motor)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Oil

leaf {{block(Component)}} composed of a viscous liquid.



#### Part Properties of Oil

{{tbl(part-properties-of-oil)}} lists the Part Properties of {{block(Oil)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Oil" label="table:part-properties-of-oil"}

Descriptions for Part Properties of {{block(Oil)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Part

abstract {{block(Component)}} composed of a {{term(part)}} being processed by a piece of equipment.



#### PartOccurrence

{{block(Part)}} that exists at a specific place and time, such as a specific instance of a bracket at a specific timestamp.


{{block(PartId)}} **MUST** be defined for {{block(PartOccurrence)}}.


~~~~xml
<Parts id="partOccSet">
   <Components>
	   <PartOccurrence id="partOccur">
		 <DataItems>
		   <DataItem id="partSet" category="EVENT" representation="TABLE" type ="COMPONENT_DATA">
			  <Definition>
				 <EntryDefinitions>
					  <EntryDefinition keyType="PART_UNIQUE_ID"/>
				 </EntryDefinitions>
				 <CellDefinitions>
					<CellDefinition key="partNumber" type="PART_KIND_ID" subType="PART_NUMBER"/>
					<CellDefinition key="batchId" type="PART_GROUP_ID" subType="BATCH"/>
					<CellDefinition key="quantity" type="PART_COUNT" subType="TARGET"/>
					<CellDefinition key="actualCompleteTime" type="PROCESS_TIME" subType="COMPLETE"/>
					<CellDefinition key="partState" type="PROCESS_STATE"/>
				</CellDefinitions>
			  </Definition>
			</DataItem>
		 </DataItems>
	   </PartOccurrence>
	</Components>
</Parts>
~~~~
{: caption="XML Device Model Example for PartOccurrence and ComponentData"}


~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="/styles/Streams.xsl"?>
<MTConnectStreams>
  <Streams>
    <DeviceStream name="VMC-3Axis" uuid="test_27MAY">
      <ComponentStream component="PartOccurrence" name="partSet" componentId="partOccur">
        <Events>
          <ComponentDataTable dataItemId="partSet" timestamp="2020-10-28T19:45:43.070010Z" sequence="95" count="2">
            <Entry key="part1">
              <Cell key="actualStartTime">2009-06-15T00:00:00.000000</Cell>
              <Cell key="partId">part1</Cell>
              <Cell key="partName">SomeName</Cell>
              <Cell key="uniqueID">abc-123</Cell>
            </Entry>
            <Entry key="part2">
              <Cell key="actualStartTime">2009-06-15T00:00:00.007925</Cell>
              <Cell key="partId">part2</Cell>
              <Cell key="partName">AnotherName</Cell>
              <Cell key="uniqueID">def-123</Cell>
            </Entry>
          </ComponentDataTable>
        </Events>
      </ComponentStream>
    </DeviceStream>
  </Streams>
</MTConnectStreams>
~~~~
{: caption="XML Streams Response Example for PartOccurrence and ComponentData"}


#### Commonly Observed DataItem Types for PartOccurrence

{{tbl(commonly-observed-dataitem-types-for-partoccurrence)}} lists the Commonly Observed DataItem Types for {{block(PartOccurrence)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(PartId)}}|1|
|{{block(PartUniqueId)}}|0..1|
|{{block(PartGroupId)}}|0..1|
|{{block(PartKindId)}}|0..1|
|{{block(PartCount)}}|0..1|
|{{block(PartStatus)}}|0..1|
|{{block(ProcessOccurrenceId)}}|0..1|
|{{block(ProcessTime)}}|0..1|
|{{block(User)}}|0..1|
{: caption="Commonly Observed DataItem Types for PartOccurrence" label="table:commonly-observed-dataitem-types-for-partoccurrence"}

##### FeatureOccurrence

{{block(Component)}} that provides information related to an individual {{term(feature)}}.



#### Part Properties of FeatureOccurrence

{{tbl(part-properties-of-featureoccurrence)}} lists the Part Properties of {{block(FeatureOccurrence)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesFeaturePersisitentId)}}|0..1|
|{{block(observesFeatureMeasurement)}}|0..1|
|{{block(observesMeasurementType)}}|0..1|
|{{block(observesCharacteristicPersistentId)}}|0..1|
|{{block(observesCharacteristicStatus)}}|0..1|
|{{block(observesUncertainty)}}|0..1|
|{{block(observesUncertaintyType)}}|0..1|
|{{block(observesMeasurementUnits)}}|0..1|
|{{block(observesMeasurementValue)}}|0..1|
{: caption="Part Properties of FeatureOccurrence" label="table:part-properties-of-featureoccurrence"}

Descriptions for Part Properties of {{block(FeatureOccurrence)}}:

* {{block(FeaturePersisitentId)}} 

    {{def(EventEnum::FEATURE_PERSISTENT_ID)}}

* {{block(FeatureMeasurement)}} 

    tabular representation of {{def(EventEnum::FEATURE_MEASUREMENT)}}
    
    {{block(FeatureMeasurement)}} **MAY** include a {{term(characteristic)}} in which case it **MAY** include a `CHARACTERISTIC_STATUS`.

* {{block(MeasurementType)}} 

    {{def(EventEnum::MEASUREMENT_TYPE)}}
    
    Examples: `POINT`, `RADIUS`, `ANGLE`, `LENGTH`, etc.

* {{block(CharacteristicPersistentId)}} 

    {{def(EventEnum::CHARACTERISTIC_PERSISTENT_ID)}}

* {{block(CharacteristicStatus)}} 

    {{def(EventEnum::CHARACTERISTIC_STATUS)}}

* {{block(Uncertainty)}} 

    {{def(EventEnum::UNCERTAINTY)}}

* {{block(UncertaintyType)}} 

    {{def(EventEnum::UNCERTAINTY_TYPE)}}

* {{block(MeasurementUnits)}} 

    {{def(EventEnum::MEASUREMENT_UNITS)}}

* {{block(MeasurementValue)}} 

    {{def(EventEnum::MEASUREMENT_VALUE)}}

### Path

{{block(Component)}} that organizes an independent operation or function within a {{block(Controller)}}.


For many types of equipment, {{block(Path)}} organizes a set of {{block(Axes)}}, one or more Program elements, and the data associated with the motion of a control point as it moves through space. However, it **MAY** also represent any independent function within a {{block(Controller)}} that has unique data associated with that function.
 
{{block(Path)}} **SHOULD** provide an {{block(Execution)}} data item to define the operational state of the {{block(Controller)}} of the piece of equipment.

If the {{block(Controller)}} is capable of performing more than one independent operation or function simultaneously, a separate {{block(Path)}} **MUST** be used to organize the data associated with each independent operation or function.


#### Part Properties of Path

{{tbl(part-properties-of-path)}} lists the Part Properties of {{block(Path)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesProgram)}}|0..1|
|{{block(observesPathFeedrateOverrideProgrammed)}}|0..1|
|{{block(observesPathFeedrateOverrideRapid)}}|0..1|
|{{block(observesRotaryVelocityOverride)}}|0..1|
|{{block(observesPathFeedrate)}}|0..1|
|{{block(observesPartCount)}}|0..1|
{: caption="Part Properties of Path" label="table:part-properties-of-path"}

Descriptions for Part Properties of {{block(Path)}}:

* {{block(Program)}} 

    {{def(EventEnum::PROGRAM)}}

* {{block(PathFeedrateOverride.Programmed)}} 

    directive value without offsets and adjustments.

* {{block(PathFeedrateOverride.Rapid)}} 

    performing an operation faster or in less time than nominal rate.

* {{block(RotaryVelocityOverride)}} 

    {{def(EventEnum::ROTARY_VELOCITY_OVERRIDE)}}
    
    This command represents a percentage change to the velocity calculated by a logic or motion program or set by a switch for a {{block(Rotary)}} type axis.

* {{block(PathFeedrate)}} 

    {{def(SampleEnum::PATH_FEEDRATE)}}

* {{block(PartCount)}} 

    {{def(EventEnum::PART_COUNT)}}

#### Commonly Observed DataItem Types for Path

{{tbl(commonly-observed-dataitem-types-for-path)}} lists the Commonly Observed DataItem Types for {{block(Path)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(Execution)}}|0..1|
{: caption="Commonly Observed DataItem Types for Path" label="table:commonly-observed-dataitem-types-for-path"}

### Pot

leaf {{block(Component)}} composed of a tool storage location associated with a {{block(ToolMagazine)}} or {{block(AutomaticToolChanger)}}.



#### Part Properties of Pot

{{tbl(part-properties-of-pot)}} lists the Part Properties of {{block(Pot)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Pot" label="table:part-properties-of-pot"}

Descriptions for Part Properties of {{block(Pot)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### `<<deprecated>>`Power

{{block(Power)}} was **DEPRECATED** in *MTConnect Version 1.1* and was replaced by {{block(Availability)}} data item type.



### PowerSupply

leaf {{block(Component)}} that provides power to electric mechanisms.



#### Part Properties of PowerSupply

{{tbl(part-properties-of-powersupply)}} lists the Part Properties of {{block(PowerSupply)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of PowerSupply" label="table:part-properties-of-powersupply"}

Descriptions for Part Properties of {{block(PowerSupply)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Process

abstract {{block(Component)}} composed of a manufacturing process being executed on a piece of equipment.



#### ProcessOccurrence

{{block(Process)}} that takes place at a specific place and time, such as a specific instance of part-milling occurring at a specific timestamp.


{{block(ProcessOccurrenceId)}} **MUST** be defined for {{block(ProcessOccurrence)}}.


#### Commonly Observed DataItem Types for ProcessOccurrence

{{tbl(commonly-observed-dataitem-types-for-processoccurrence)}} lists the Commonly Observed DataItem Types for {{block(ProcessOccurrence)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(ProcessOccurrenceId)}}|1|
|{{block(ProcessAggregateId)}}|0..1|
|{{block(ProcessTime)}}|0..1|
|{{block(ProcessKindId)}}|0..1|
|{{block(User)}}|0..1|
|{{block(Program)}}|0..1|
|{{block(PartUniqueId)}}|0..1|
{: caption="Commonly Observed DataItem Types for ProcessOccurrence" label="table:commonly-observed-dataitem-types-for-processoccurrence"}

### Pulley

leaf {{block(Component)}} composed of a mechanism or wheel that turns in a frame or block and serves to change the direction of or to transmit force.



#### Part Properties of Pulley

{{tbl(part-properties-of-pulley)}} lists the Part Properties of {{block(Pulley)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Pulley" label="table:part-properties-of-pulley"}

Descriptions for Part Properties of {{block(Pulley)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Pump

leaf {{block(Component)}} that raises, drives, exhausts, or compresses fluids or gases by means of a piston, plunger, or set of rotating vanes.



#### Part Properties of Pump

{{tbl(part-properties-of-pump)}} lists the Part Properties of {{block(Pump)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Pump" label="table:part-properties-of-pump"}

Descriptions for Part Properties of {{block(Pump)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Reel

leaf {{block(Component)}} composed of a rotary storage unit for material.



#### Part Properties of Reel

{{tbl(part-properties-of-reel)}} lists the Part Properties of {{block(Reel)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Reel" label="table:part-properties-of-reel"}

Descriptions for Part Properties of {{block(Reel)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### RemovalPot

leaf {{block(Component)}} that is a {{block(Pot)}} for a tool that has to be removed from a {{block(ToolMagazine)}} or {{block(Turret)}} to a location outside of the piece of equipment.



#### Part Properties of RemovalPot

{{tbl(part-properties-of-removalpot)}} lists the Part Properties of {{block(RemovalPot)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of RemovalPot" label="table:part-properties-of-removalpot"}

Descriptions for Part Properties of {{block(RemovalPot)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Resource

abstract {{block(Component)}} composed of material or personnel involved in a manufacturing process.



#### Material

{{block(Resource)}} composed of material that is consumed or used by the piece of equipment for production of parts, materials, or other types of goods.



##### Stock

{{block(Material)}} that is used in a manufacturing process and to which work is applied in a machine or piece of equipment to produce parts.


{{block(Stock)}} may be either a continuous piece of material from which multiple parts may be produced or it may be a discrete piece of material that will be made into a part or a set of parts.


#### Part Properties of Stock

{{tbl(part-properties-of-stock)}} lists the Part Properties of {{block(Stock)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesMaterial)}}|0..1|
|{{block(observesLengthRemaining)}}|0..1|
|{{block(observesLengthStandard)}}|0..1|
{: caption="Part Properties of Stock" label="table:part-properties-of-stock"}

Descriptions for Part Properties of {{block(Stock)}}:

* {{block(Material)}} 

    {{def(EventEnum::MATERIAL)}}

* {{block(Length.Remaining)}} 

    remaining total length of an object.

* {{block(Length.Standard)}} 

    standard or original length of an object.

#### Personnel

{{block(Resource)}} composed of an individual or individuals who either control, support, or otherwise interface with a piece of equipment.




#### Part Properties of Personnel

{{tbl(part-properties-of-personnel)}} lists the Part Properties of {{block(Personnel)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesUserOperator)}}|0..1|
|{{block(observesUserMaintenance)}}|0..1|
{: caption="Part Properties of Personnel" label="table:part-properties-of-personnel"}

Descriptions for Part Properties of {{block(Personnel)}}:

* {{block(User.Operator)}} 

    identifier of the person currently responsible for operating the piece of equipment.

* {{block(User.Maintenance)}} 

    identifier of the person currently responsible for performing maintenance on the piece of equipment.

### ReturnPot

leaf {{block(Component)}} that is a {{block(Pot)}} for a tool that has been removed from {{term(spindle)}} or {{block(Turret)}} and awaiting for return to a {{block(ToolMagazine)}}.



#### Part Properties of ReturnPot

{{tbl(part-properties-of-returnpot)}} lists the Part Properties of {{block(ReturnPot)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of ReturnPot" label="table:part-properties-of-returnpot"}

Descriptions for Part Properties of {{block(ReturnPot)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### SensingElement

leaf {{block(Component)}} that provides a signal or measured value.



#### Part Properties of SensingElement

{{tbl(part-properties-of-sensingelement)}} lists the Part Properties of {{block(SensingElement)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of SensingElement" label="table:part-properties-of-sensingelement"}

Descriptions for Part Properties of {{block(SensingElement)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Sensor

{{block(Component)}} that responds to a physical stimulus and transmits a resulting impulse or value from a sensing unit.


If modeling individual sensors, then sensor should be associated with the {{block(Component)}} that the measured value is most closely associated.

When modeled as an {{block(Auxiliary)}}, sensor **SHOULD** represent an integrated {{term(sensor unit)}} system that provides signal processing, conversion, and communications. A {{term(sensor unit)}} may have multiple {{termplural(sensing element)}}.

See {{block(SensorConfiguration)}} for more details on the use and configuration of a {{block(Sensor)}}.


#### `<<deprecated>>`Thermostat

{{block(Component)}} composed of a sensor or an instrument that measures temperature.

{{block(Thermostat)}} was **DEPRECATED** in *MTConnect Version 1.2* and was replaced by {{block(Temperature)}}.



#### `<<deprecated>>`Vibration

{{block(Component)}} composed of a sensor or an instrument that measures the amount and/or frequency of vibration within a system.

{{block(Vibration)}} was **DEPRECATED** in *MTConnect Version 1.2* and was replaced by {{block(Displacement)}}, {{block(Frequency)}} etc.



### Spreader

leaf {{block(Component)}} that flattens or spreading materials.



#### Part Properties of Spreader

{{tbl(part-properties-of-spreader)}} lists the Part Properties of {{block(Spreader)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Spreader" label="table:part-properties-of-spreader"}

Descriptions for Part Properties of {{block(Spreader)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### StagingPot

leaf {{block(Component)}} that is a {{block(Pot)}} for a tool that is awaiting transfer to a {{block(ToolMagazine)}} or {{block(Turret)}} from outside of the piece of equipment.



#### Part Properties of StagingPot

{{tbl(part-properties-of-stagingpot)}} lists the Part Properties of {{block(StagingPot)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of StagingPot" label="table:part-properties-of-stagingpot"}

Descriptions for Part Properties of {{block(StagingPot)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Station

leaf {{block(Component)}} composed of a storage or mounting location for a tool associated with a {{block(Turret)}}, {{block(GangToolBar)}}, or {{block(ToolRack)}}.



#### Part Properties of Station

{{tbl(part-properties-of-station)}} lists the Part Properties of {{block(Station)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Station" label="table:part-properties-of-station"}

Descriptions for Part Properties of {{block(Station)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### StorageBattery

leaf {{block(Component)}} composed of one or more cells in which chemical energy is converted into electricity and used as a source of power. 



#### Part Properties of StorageBattery

{{tbl(part-properties-of-storagebattery)}} lists the Part Properties of {{block(StorageBattery)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of StorageBattery" label="table:part-properties-of-storagebattery"}

Descriptions for Part Properties of {{block(StorageBattery)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Structure

{{block(Component)}} composed of part(s) comprising the rigid bodies of the piece of equipment.



#### Link

{{block(Structure)}} that provides a connection between {{block(Component)}} entities.



### Switch

leaf {{block(Component)}} that turns on or off an electric current or makes or breaks a circuit.



#### Part Properties of Switch

{{tbl(part-properties-of-switch)}} lists the Part Properties of {{block(Switch)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Switch" label="table:part-properties-of-switch"}

Descriptions for Part Properties of {{block(Switch)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### System

abstract {{block(Component)}} that is permanently integrated into the piece of equipment.



#### Actuator

{{block(Component)}} composed of a physical apparatus that moves or controls a mechanism or system. 


It takes energy usually provided by air, electric current, or liquid and converts the energy into some kind of motion.


##### Hydraulic

{{block(System)}} that provides movement and distribution of pressurized liquid throughout the piece of equipment.



#### Part Properties of Hydraulic

{{tbl(part-properties-of-hydraulic)}} lists the Part Properties of {{block(Hydraulic)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesPressure)}}|0..1|
{: caption="Part Properties of Hydraulic" label="table:part-properties-of-hydraulic"}

Descriptions for Part Properties of {{block(Hydraulic)}}:

* {{block(Pressure)}} 

    {{def(SampleEnum::PRESSURE)}}

##### Pneumatic

{{block(System)}} that uses compressed gasses to actuate components or do work within the piece of equipment.


> Note: Actuation is usually performed using a cylinder.


#### Part Properties of Pneumatic

{{tbl(part-properties-of-pneumatic)}} lists the Part Properties of {{block(Pneumatic)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesPressure)}}|0..1|
{: caption="Part Properties of Pneumatic" label="table:part-properties-of-pneumatic"}

Descriptions for Part Properties of {{block(Pneumatic)}}:

* {{block(Pressure)}} 

    {{def(SampleEnum::PRESSURE)}}

#### Controller

{{block(System)}} that provides regulation or management of a system or component. {{cite(ISO 16484-5:2017)}}


Typical types of controllers for a piece of equipment include CNC (Computer Numerical Control), PAC (Programmable Automation Control), IPC (Industrialized Computer), or IC (Imbedded Computer).

> Note: In {{term(XML)}} representation, {{block(Controller)}} is a {{term(top level)}} element.


#### Part Properties of Controller

{{tbl(part-properties-of-controller)}} lists the Part Properties of {{block(Controller)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Path)}}|0..*|
|{{block(observesEmergencyStop)}}|0..1|
|{{block(observesSystemCondition)}}|0..1|
|{{block(observesControllerMode)}}|0..1|
|{{block(observesCommunicationsCondition)}}|0..1|
|{{block(observesLogicProgramCondition)}}|0..1|
{: caption="Part Properties of Controller" label="table:part-properties-of-controller"}

Descriptions for Part Properties of {{block(Controller)}}:

* {{block(Path)}} 

    {{block(Component)}} that organizes an independent operation or function within a {{block(Controller)}}.

* {{block(EmergencyStop)}} 

    {{def(EventEnum::EMERGENCY_STOP)}}

* {{block(System)}} 

    {{def(ConditionEnum::SYSTEM)}}

* {{block(ControllerMode)}} 

    {{def(EventEnum::CONTROLLER_MODE)}}

* {{block(Communications)}} 

    {{def(ConditionEnum::COMMUNICATIONS)}}

* {{block(LogicProgram)}} 

    {{def(ConditionEnum::LOGIC_PROGRAM)}}

#### Coolant

{{block(System)}} that provides distribution and management of fluids that remove heat from a piece of equipment.



#### Part Properties of Coolant

{{tbl(part-properties-of-coolant)}} lists the Part Properties of {{block(Coolant)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesConcentration)}}|0..1|
{: caption="Part Properties of Coolant" label="table:part-properties-of-coolant"}

Descriptions for Part Properties of {{block(Coolant)}}:

* {{block(Concentration)}} 

    {{def(SampleEnum::CONCENTRATION)}}

#### Dielectric

{{block(System)}} that manages a chemical mixture used in a manufacturing process being performed at that piece of equipment.


For example, this could describe the dielectric system for an EDM process or the chemical bath used in a plating process.


#### Electric

{{block(System)}} composed of the main power supply for the piece of equipment that provides distribution of that power throughout the equipment.


The electric system will provide all the data with regard to electric current, voltage, frequency, etc. that applies to the piece of equipment as a functional unit. Data regarding electric power that is specific to a {{block(Component)}} will be reported for that specific {{block(Component)}}.


#### Part Properties of Electric

{{tbl(part-properties-of-electric)}} lists the Part Properties of {{block(Electric)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(observesWattage)}}|0..1|
{: caption="Part Properties of Electric" label="table:part-properties-of-electric"}

Descriptions for Part Properties of {{block(Electric)}}:

* {{block(Wattage)}} 

    {{def(SampleEnum::WATTAGE)}}

#### Enclosure

{{block(System)}} composed of a structure that is used to contain or isolate a piece of equipment or area.


{{block(Enclosure)}} may provide information regarding access to the internal components of a piece of equipment or the conditions within the enclosure. For example, {{block(Door)}} may be defined as a {{term(lower level)}} {{block(Component)}} or {{block(Composition)}} entity of the {{block(Enclosure)}}.


#### EndEffector

{{block(System)}} composed of functions that form the last link segment of a piece of equipment.


It is the part of a piece of equipment that interacts with the manufacturing process.


#### Feeder

{{block(System)}} that manages the delivery of materials within a piece of equipment.


For example, this could describe the wire delivery system for an EDM or welding process; conveying system or pump and valve system distributing material to a blending station; or a fuel delivery system feeding a furnace.


#### Lubrication

{{block(System)}} that provides distribution and management of fluids used to lubricate portions of the piece of equipment.



#### ProcessPower

{{block(System)}} composed of a power source associated with a piece of equipment that supplies energy to the manufacturing process separate from the {{block(Electric)}} system.


For example, this could be the power source for an EDM machining process, an electroplating line, or a welding system.


#### Protective

{{block(System)}} that provides functions used to detect or prevent harm or damage to equipment or personnel.


{{block(Protective)}} does not include the information relating to the {{block(Enclosure)}}.


#### Heating

{{block(System)}} that delivers controlled amounts of heat to achieve a target temperature at a specified heating rate.


> Note: As an example, Energy Delivery Method can be either through Electric heaters or Gas burners.


#### Vacuum

{{block(System)}} that evacuates gases and liquids from an enclosed and sealed space to a controlled negative pressure or a molecular density below the prevailing atmospheric level.



#### Cooling

{{block(System)}} that extracts controlled amounts of heat to achieve a target temperature at a specified cooling rate.


> Note: As an example, Energy Extraction Method can be via cooling water pipes running through the chamber.


#### Pressure

{{block(System)}} that delivers compressed gas or fluid and controls the pressure and rate of pressure change to a desired target set-point.


> Note: For example, Delivery Method can be a Compressed Air or N2 tank that is piped via an inlet valve to the chamber.


#### WorkEnvelope

{{block(System)}} composed of the physical process execution space within a piece of equipment.


{{block(WorkEnvelope)}} **MAY** provide information regarding the physical workspace and the conditions within that workspace.


#### AirHandler

system that circulates air or regulates airflow without altering temperature or humidity.



### Table

leaf {{block(Component)}} composed of a surface for holding an object or material.



#### Part Properties of Table

{{tbl(part-properties-of-table)}} lists the Part Properties of {{block(Table)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Table" label="table:part-properties-of-table"}

Descriptions for Part Properties of {{block(Table)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Tank

leaf {{block(Component)}} generally composed of an enclosed container.



#### Part Properties of Tank

{{tbl(part-properties-of-tank)}} lists the Part Properties of {{block(Tank)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Tank" label="table:part-properties-of-tank"}

Descriptions for Part Properties of {{block(Tank)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Tensioner

leaf {{block(Component)}} that provides or applies a stretch or strain to another mechanism.



#### Part Properties of Tensioner

{{tbl(part-properties-of-tensioner)}} lists the Part Properties of {{block(Tensioner)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Tensioner" label="table:part-properties-of-tensioner"}

Descriptions for Part Properties of {{block(Tensioner)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### TransferArm

leaf {{block(Component)}} that physically moves a tool from one location to another.



#### Part Properties of TransferArm

{{tbl(part-properties-of-transferarm)}} lists the Part Properties of {{block(TransferArm)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of TransferArm" label="table:part-properties-of-transferarm"}

Descriptions for Part Properties of {{block(TransferArm)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### TransferPot

leaf {{block(Component)}} that is a {{block(Pot)}} for a tool that is awaiting transfer from a {{block(ToolMagazine)}} to {{term(spindle)}} or {{block(Turret)}}.



#### Part Properties of TransferPot

{{tbl(part-properties-of-transferpot)}} lists the Part Properties of {{block(TransferPot)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of TransferPot" label="table:part-properties-of-transferpot"}

Descriptions for Part Properties of {{block(TransferPot)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Transformer

leaf {{block(Component)}} that transforms electric energy from a source to a secondary circuit.



#### Part Properties of Transformer

{{tbl(part-properties-of-transformer)}} lists the Part Properties of {{block(Transformer)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Transformer" label="table:part-properties-of-transformer"}

Descriptions for Part Properties of {{block(Transformer)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Valve

leaf {{block(Component)}} that halts or controls the flow of a liquid, gas, or other material through a passage, pipe, inlet, or outlet.



#### Part Properties of Valve

{{tbl(part-properties-of-valve)}} lists the Part Properties of {{block(Valve)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Valve" label="table:part-properties-of-valve"}

Descriptions for Part Properties of {{block(Valve)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Vat

leaf {{block(Component)}} generally composed of an open container.



#### Part Properties of Vat

{{tbl(part-properties-of-vat)}} lists the Part Properties of {{block(Vat)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Vat" label="table:part-properties-of-vat"}

Descriptions for Part Properties of {{block(Vat)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Water

leaf {{block(Component)}} composed of $$H_2 O$$.



#### Part Properties of Water

{{tbl(part-properties-of-water)}} lists the Part Properties of {{block(Water)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Water" label="table:part-properties-of-water"}

Descriptions for Part Properties of {{block(Water)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Wire

leaf {{block(Component)}} composed of a string like piece or filament of relatively rigid or flexible material provided in a variety of diameters.



#### Part Properties of Wire

{{tbl(part-properties-of-wire)}} lists the Part Properties of {{block(Wire)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Wire" label="table:part-properties-of-wire"}

Descriptions for Part Properties of {{block(Wire)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.

### Workpiece

leaf {{block(Component)}} composed of an object or material on which a form of work is performed.



#### Part Properties of Workpiece

{{tbl(part-properties-of-workpiece)}} lists the Part Properties of {{block(Workpiece)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(hasComposition)}}|0|
|{{block(hasComponent)}}|0|
{: caption="Part Properties of Workpiece" label="table:part-properties-of-workpiece"}

Descriptions for Part Properties of {{block(Workpiece)}}:

* {{block(Composition)}} 

    functional part of a piece of equipment contained within a {{block(Component)}}.

* {{block(Component)}} 

    logical or physical entity that provides a capability.



## Component Organizer Types

This section provides semantic information for the types of {{block(Component)}} that are used to {{term(organize)}} other {{block(Component)}} types. 

### `<<organizer>>`Adapters

{{block(Component)}} that {{termplural(organize)}} {{block(Adapter)}} types. 



### `<<organizer>>`Auxiliaries

{{block(Component)}} that {{termplural(organize)}} {{block(Auxiliary)}} types. 



### `<<organizer>>`Axes

{{block(Component)}} that {{termplural(organize)}} {{block(Component Types::Axis)}} types. 



### `<<organizer>>`Controllers

{{block(Component)}} that {{termplural(organize)}} {{block(Controller)}} entities.



### `<<organizer>>`Interfaces

{{block(Component)}} that {{termplural(organize)}} {{block(Interface)}} types. 



### `<<organizer>>`Parts

{{block(Component)}} that {{termplural(organize)}} {{block(Part)}} types.



### `<<organizer>>`Processes

{{block(Component)}} that {{termplural(organize)}} {{block(Process)}} types. 



### `<<organizer>>`Resources

{{block(Component)}} that {{termplural(organize)}} {{block(Resource)}} types. 



#### `<<organizer>>`Materials

{{block(Resources)}} that {{termplural(organize)}} {{block(Material)}} types.



### `<<organizer>>`Structures

{{block(Component)}} that {{termplural(organize)}} {{block(Structure)}} types. 



### `<<organizer>>`Systems

{{block(Component)}} that {{termplural(organize)}} {{block(System)}} types. 




# Compositions Model

{{block(Composition)}} entities are used to describe the lowest level physical building blocks of a piece of equipment contained within a {{block(Component)}}. By referencing a specific {{block(Composition)}} entity, further clarification and meaning to data associated with a specific {{block(Component)}} can be achieved.

Both {{block(Component)}} and {{block(Composition)}} entities are {{term(lower level)}} entities representing the sub-parts of the parent {{block(Component)}}.  However, there are distinct differences between {{block(Component)}} and {{block(Composition)}} type entities.

{{block(Component)}} entities may be further defined with {{term(lower level)}} {{block(Component)}} entities and may have associated {{termplural(DataItem)}}.

{{block(Composition)}} entities represent the lowest level physical part of a piece of equipment.  They **MUST NOT** be further defined with {{term(lower level)}} {{block(Component)}} entities and they **MUST NOT** have {{termplural(DataItem)}} directly associated with them.   They do provide additional information that can be used to enhance the specificity of {{termplural(DataItem)}} associated with the parent {{block(Component)}}.


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
|{{property(id)}}|`ID`|1|
|{{property(type)}}|`CompositionTypeEnum`|1|
|{{property(name)}}|`string`|0..1|
|{{property(uuid)}}|`UUID`|0..1|
{: caption="Value Properties of Composition" label="table:value-properties-of-composition"}

Descriptions for Value Properties of {{block(Composition)}}:

* {{property(id)}} 

    unique identifier for the {{block(Composition)}} element.

* {{property(type)}} 

    type of {{block(Composition)}}.

    The value of {{property(type)}} **MUST** be one of the `CompositionTypeEnum` enumeration. 

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


# DataItems Model

For an {{block(MTConnectDevices)}} entity, {{termplural(DataItem)}} describe data that can be reported by a piece of equipment and are associated with {{block(Device)}} and {{block(Component)}} entities. While the {{termplural(DataItem)}} describe the data that can be reported by a piece of equipment as an {{block(MTConnectDevices)}} entity, the actual data values are provided by the {{block(MTConnectStreams)}} entity in the {{term(MTConnectStreams Response Document)}}. See {{package(Observation Information Model)}} for detail on the reported values.

Each {{term(DataItem)}} **SHOULD** be modeled for the {{block(MTConnectDevices)}} entity such that it is associated with the entity that the reported data directly applies.

{{block(DataItem)}} describes specific types of {{termplural(DataItem)}} that represent a numeric value, a functioning state, or a health status reported by a piece of equipment. {{block(DataItem)}} provides a detailed description for each {{term(DataItem)}} that is reported; it defines the type of data being reported and an array of optional attributes that further describe that data. The different types of {{block(DataItem)}} elements are defined in {{package(DataItem Types)}}.


## DataItems

This section provides semantic information for the {{block(DataItem)}} entity. {{figure(DataItems)}} shows the {{block(DataItem)}} model. 

![DataItems](figures/DataItems.png "DataItems"){: width="0.8"}

> Note: See {{sect(DataItems Schema Diagrams)}} for XML schema.

### DataItem

information reported about a piece of equipment.



#### Value Properties of DataItem

{{tbl(value-properties-of-dataitem)}} lists the Value Properties of {{block(DataItem)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(category)}}|`CategoryEnum`|1|
|{{property(compositionId)}}|`ID`|0..1|
|`<<deprecated>>` {{property(coordinateSystem)}}|`CoordinateSystemEnum`|0..1|
|{{property(discrete)}}|`boolean`|1|
|{{property(id)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
|{{property(nativeScale)}}|`integer`|0..1|
|{{property(nativeUnits)}}|`NativeUnitEnum`|0..1|
|{{property(sampleRate)}}|`float`|0..1|
|{{property(significantDigits)}}|`integer`|0..1|
|{{property(statistic)}}|`StatisticEnum`|0..1|
|{{property(subType)}}|`DataItemSubTypeEnum`|0..1|
|{{property(type)}}|`DataItemTypeEnum`|1|
|{{property(units)}}|`UnitEnum`|0..1|
|{{property(representation)}}|`RepresentationEnum`|0..1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
{: caption="Value Properties of DataItem" label="table:value-properties-of-dataitem"}

Descriptions for Value Properties of {{block(DataItem)}}:

* {{property(category)}} 

    specifies the kind of information provided by a data item.

    `CategoryEnum` Enumeration:

    * `CONDITION` 

        information about the health of a piece of equipment and its ability to function.

    * `EVENT` 

        discrete piece of information from the piece of equipment.

    * `SAMPLE` 

        continuously variable or analog data value. 
        
        A continuous value can be measured at any point-in-time and will always produce a result.

* {{property(compositionId)}} 

    identifier attribute of the {{block(Composition)}} that the reported data is most closely associated.

* `<<deprecated>>` {{property(coordinateSystem)}} 

    for measured values relative to a coordinate system like {{block(Position)}}, the coordinate system used may be reported.
    
    **DEPRECATED** in *Version 2.0*. Replaced by {{property(Component::coordinateSystemIdRef)}}. 

* {{property(discrete)}} 

    indication signifying whether each value reported for the {{term(Observation)}} is significant and whether duplicate values are to be suppressed.
    
    If a value is not defined for {{property(DataItem::discrete)}}, the default value **MUST** be `false`.

* {{property(id)}} 

    unique identifier for this data item.

* {{property(name)}} 

    name of the data item.

* {{property(nativeScale)}} 

    used to convert the reported value to represent the original measured value.

* {{property(nativeUnits)}} 

    native units of measurement for the reported value of the data item.

    `<<extensible>>` `NativeUnitEnum` Enumeration:

    * `AMPERE_HOUR` 

        electric charge in ampere hour.

    * `BAR` 

        pressure in bar.

    * `CENTIPOISE` 

        viscosity in centipoise.

    * `CUBIC_FOOT` 

        geometric volume in cubic foot.

    * `CUBIC_FOOT/HOUR` 

        change of geometric volume in cubic foot per hour.

    * `CUBIC_FOOT/MINUTE` 

        change of geometric volume in cubic foot per minute.

    * `DEGREE/MINUTE` 

        rotational velocity in degree per minute.

    * `FAHRENHEIT` 

        temperature in Fahrenheit.

    * `FOOT` 

        length in foot.

    * `FOOT/MINUTE` 

        speed in foot per minute.

    * `FOOT/SECOND` 

        speed in foot per second.

    * `FOOT/SECOND^2` 

        acceleration in foot per second squared.

    * `FOOT_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in feet.

    * `GALLON/MINUTE` 

        volumetric flow in gallon per minute.

    * `GRAVITATIONAL_ACCELERATION` 

        acceleration relative to earth's gravity given in meter per second squared.
        
        > Note 1 to entry: At different points on Earth's surface, the free-fall acceleration ranges from 9.764 to 9.834 m/s2 (Wikipedia: Gravitational Acceleration). The constant can be customized depending on the location in the universe.
        
        > Note 2 to entry: In the standard, it is assumed that Earth's average value of gravitational acceleration is 9.90665 m/s2.

    * `GRAVITATIONAL_FORCE` 

        `MASS` times `GRAVITATIONAL_ACCELERATION`  (g).

    * `HOUR` 

        time in hour.

    * `INCH` 

        length in inch.

    * `INCH/MINUTE` 

        speed in inch per minute.

    * `INCH/REVOLUTION` 

        feedrate per revolution in inch per revolution.

    * `INCH/SECOND` 

        speed in inch per second.

    * `INCH/SECOND^2` 

        acceleration in inch per second squared.

    * `INCH_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in inches.

    * `INCH_POUND` 

        torque in inch pound.

    * `KELVIN` 

        temperature in Kelvin.

    * `KILOWATT` 

        power in kilowatt.

    * `KILOWATT_HOUR` 

        energy in kilowatt-hour.

    * `LITER/MINUTE` 

        volumetric flow in liter per minute.

    * `MICROMETER` 

        length in micrometer.

    * `MICROTORR` 

        pressure in microtorr.

    * `MILLIMETER/MINUTE` 

        speed in millimeter per minute.

    * `MILLIMETER_MERCURY` 

        pressure in millimeter of mercury (mmHg).

    * `MINUTE` 

        time in minute.

    * `OTHER` 

        unsupported unit.

    * `PASCAL/MINUTE` 

        pressurization rate in pascal per minute.

    * `POUND` 

        mass in pound.

    * `POUND/INCH^2` 

        pressure in pound per square inch (PSI).

    * `RADIAN` 

        angle in radian.

    * `RADIAN/MINUTE` 

        angular velocity in radian per minute.

    * `RADIAN/SECOND` 

        angular velocity in radian per second.

    * `RADIAN/SECOND^2` 

        angular acceleration in radian per second squared.

    * `RANKINE` 

        temperature in Rankine.

    * `SQUARE_INCH` 

        geometric area in inch squared.

    * `TORR` 

        pressure in torr.

* {{property(sampleRate)}} 

    rate at which successive samples of a data item are recorded by a piece of equipment.

* {{property(significantDigits)}} 

    number of significant digits in the reported value.

* {{property(statistic)}} 

    type of statistical calculation performed on a series of data samples to provide the reported data value.

    `StatisticEnum` Enumeration:

    * `AVERAGE` 

        mathematical average value calculated for the data item during the calculation period.

    * `<<deprecated>>` `KURTOSIS` 

        **DEPRECATED** in *Version 1.6*. ~~A measure of the "peakedness" of a probability distribution; i.e., the shape of the distribution curve.~~

    * `MAXIMUM` 

        maximum or peak value recorded for the data item during the calculation period.

    * `MEDIAN` 

        middle number of a series of numbers.

    * `MINIMUM` 

        minimum value recorded for the data item during the calculation period.

    * `MODE` 

        number in a series of numbers that occurs most often.

    * `RANGE` 

        difference between the maximum and minimum value of a data item during the calculation period. Also represents Peak-to-Peak measurement in a waveform.

    * `ROOT_MEAN_SQUARE` 

        mathematical Root Mean Square (RMS) value calculated for the data item during the calculation period.

    * `STANDARD_DEVIATION` 

        statistical Standard Deviation value calculated for the data item during the calculation period.

* {{property(subType)}} 

    sub-categorization of the {{property(DataItem::type)}}.

    `<<extensible>>` `DataItemSubTypeEnum` Enumeration:

    * `ABORTED` 

        actions or activities that were attempted, but terminated before they could be completed.

    * `ABSOLUTE` 

        relating to or derived in the simplest manner from the fundamental units or measurements.

    * `ACTION` 

        indication of the operating state of a mechanism.

    * `ACTIVE` 

        relating to logic or motion program currently executing.

    * `ACTIVITY` 

        phase or segment of a recipe or program.

    * `ACTUAL` 

        reported value of an {{term(observation)}}.

    * `ALL` 

        all actions, items, or activities being counted independent of the outcome.

    * `<<deprecated>>` `ALTERNATING` 

        measurement of alternating voltage or current. If not specified further in statistic, defaults to RMS voltage. 
        
        **DEPRECATED** in *Version 1.6*.

    * `AUXILIARY` 

        when multiple locations on a piece of bar stock being feed by a bar feeder are referenced as the indication of whether the end of that piece of bar stock has been reached.

    * `A_SCALE` 

        A-Scale weighting factor on the frequency scale.

    * `BAD` 

        actions, items, or activities being counted that do not conform to specification or expectation.

    * `BATCH` 

        group of parts produced in a batch.

    * `BINARY` 

        observed as a binary data type.

    * `BOOLEAN` 

        observed as a boolean data type.

    * `BRINELL` 

        scale to measure the resistance to deformation of a surface.

    * `B_SCALE` 

        B-Scale weighting factor on the frequency scale.

    * `COMMANDED` 

        directive value including adjustments such as an offset or overrides.

    * `COMPLETE` 

        associated with the completion of an activity or event.

    * `CONSUMED` 

        amount of material consumed from an object or container during a manufacturing process.

    * `CONTROL` 

        state of the enabling signal or control logic that enables or disables the function or operation of the entity.

    * `C_SCALE` 

        C-Scale weighting factor on the frequency scale.

    * `DELAY` 

        elapsed time of a temporary halt of action.

    * `DETECT` 

        indicated by the presence or existence of something.

    * `<<deprecated>>` `DIRECT` 

        DC current or voltage.
        
        **DEPRECATED** in *Version 1.6*.

    * `DRY_RUN` 

        setting or operator selection used to execute a test mode to confirm the execution of machine functions.

    * `D_SCALE` 

        D-Scale weighting factor on the frequency scale.

    * `ENDED` 

        boundary when an activity or an event terminates.

    * `ENUMERATED` 

        observed as a set containing a restricted number of discrete values where each discrete value is named and unique.
        {{cite(ISO 21961:2003, 013)}}

    * `EXPIRATION` 

        relating to the expiration or end of useful life for a material or other physical item.

    * `FAILED` 

        actions or activities that were attempted , but failed to complete or resulted in an unexpected or unacceptable outcome.

    * `FIRST_USE` 

        relating to the first use of a material or other physical item.

    * `GAS` 

        fluid that has no definite shape or volume.

    * `GATEWAY` 

        Gateway for the {{block(Component)}} network.

    * `GOOD` 

        actions, items, or activities being counted that conform to specification or expectation.

    * `HEAT_TREAT` 

        material heat number.

    * `INCREMENTAL` 

        relating to or derived from the last {{term(observation)}}.

    * `INSTALL_DATE` 

        date the hardware or software was installed.

    * `IPV4_ADDRESS` 

        IPV4 network address of the {{block(Component)}}.

    * `IPV6_ADDRESS` 

        IPV6 network address of the {{block(Component)}}.

    * `ISO_STEP_EXECUTABLE` 

        reference to a ISO 10303 Executable.

    * `JOG` 

        relating to momentary activation of a function or a movement.
        
        **DEPRECATION WARNING**: May be deprecated in the future.

    * `LATERAL` 

        indication of the position of a mechanism that may move in a lateral direction.

    * `LEEB` 

        scale to measure the elasticity of a surface.

    * `LENGTH` 

        reference to a length type tool offset variable.

    * `LICENSE` 

        license code to validate or activate the hardware or software.

    * `LINE` 

        state of the power source.

    * `LINEAR` 

        direction of motion of a linear motion.

    * `LIQUID` 

        fluid that has a definite volume but no definite shape.

    * `LOADED` 

        indication that the subparts of a piece of equipment are under load.

    * `LOT` 

        group of parts tracked as a lot.

    * `MACHINE_AXIS_LOCK` 

        setting or operator selection that changes the behavior of the controller on a piece of equipment.

    * `MAC_ADDRESS` 

        Media Access Control Address. The unique physical address of the network hardware.

    * `MAIN` 

        relating to the primary logic or motion program currently being executed.

    * `MAINTENANCE` 

        relating to maintenance on the piece of equipment.

    * `MANUAL_UNCLAMP` 

        indication of the state of an operator controlled interlock that can inhibit the ability to initiate an unclamp action of an electronically controlled chuck.

    * `MANUFACTURE` 

        related to the production of a material or other physical item.

    * `MANUFACTURER` 

        corporate identity for the maker of the hardware or software.

    * `MAXIMUM` 

        maximum value.

    * `MEASURED` 

        {{def(DataItemSubType::ACTUAL)}} that has {{term(uncertainty)}}.

    * `MINIMUM` 

        minimum value.

    * `MODEL` 

        model info of the hardware or software.

    * `MOHS` 

        scale to measure the resistance to scratching of a surface.

    * `MOTION` 

        indication of the open or closed state of a mechanism.

    * `NO_SCALE` 

        no weighting factor on the frequency scale.

    * `OPERATING` 

        piece of equipment that is powered or performing any activity.

    * `OPERATION` 

        step of a discrete manufacturing process.

    * `OPERATOR` 

        relating to the person currently responsible for operating the piece of equipment.

    * `OPTIONAL_STOP` 

        setting or operator selection that changes the behavior of the controller on a piece of equipment. 

    * `ORDER_NUMBER` 

        authorization of a process occurrence.

    * `OVERRIDE` 

        overridden value.

    * `PART` 

        amount included in the {{term(part)}}.

    * `PART_FAMILY` 

        group of parts having similarities in geometry, manufacturing process, and/or functions.

    * `PART_NAME` 

        word or set of words by which a part is known, addressed, or referred to.

    * `PART_NUMBER` 

        particular part design or model.

    * `POWERED` 

        piece of equipment is powered and functioning or {{block(Component)}} that are required to remain on are powered.

    * `PRIMARY` 

        main or principle.

    * `PROBE` 

        position provided by a measurement probe.
        
        **DEPRECATION WARNING**: May be deprecated in the future.

    * `PROCESS` 

        relating to production of a part or product on a piece of equipment.

    * `PROCESS_NAME` 

        word or set of words by which a process being executed (process occurrence) by the device is known, addressed, or referred to.

    * `PROCESS_PLAN` 

        process plan that a process occurrence belongs to.

    * `PROCESS_STEP` 

        step in the process plan that this occurrence corresponds to. 

    * `PROGRAMMED` 

        directive value without offsets and adjustments.

    * `RADIAL` 

        reference to a radial type tool offset variable.

    * `RAPID` 

        performing an operation faster or in less time than nominal rate.

    * `RAW_MATERIAL` 

        material that is used to produce parts.

    * `RECIPE` 

        process as part of product production; can be a subprocess of a larger process.

    * `RELEASE_DATE` 

        date the hardware or software was released for general use.

    * `REMAINING` 

        remaining measure or count of an action, object or activity.

    * `REQUEST` 

        {{term(request)}} by an {{block(Interface)}} for a task.

    * `RESPONSE` 

        {{term(response)}} by an {{block(Interface)}} to a {{term(request)}} for a task.

    * `ROCKWELL` 

        scale to measure the resistance to deformation of a surface.

    * `ROTARY` 

        direction of a rotary motion using the right hand rule convention.

    * `SCHEDULE` 

        identity of a control program that is used to specify the order of execution of other programs.

    * `SEGMENT` 

        phase of a recipe process.

    * `SERIAL_NUMBER` 

        serial number that uniquely identifies a specific part.

    * `SET_UP` 

        relating to the preparation of a piece of equipment for production or restoring the piece of equipment to a neutral state after production.

    * `SHORE` 

        scale to measure the resistance to deformation of a surface.

    * `SINGLE_BLOCK` 

        setting or operator selection that changes the behavior of the controller on a piece of equipment. 

    * `SOLID` 

        matter that has a definite shape and a definite volume.

    * `STANDARD` 

        standard measure of an object or an action.

    * `START` 

        boundary when an activity or an event commences.

    * `SUBNET_MASK` 

        SubNet mask for the {{block(Component)}} network.

    * `SWITCHED` 

        indication of the activation state of a mechanism represented by a {{block(Composition)}}.

    * `TARGET` 

        goal of the operation or process.

    * `TARGET_COMPLETION` 

        relating to the end or completion of an activity or event.

    * `TOOL_CHANGE_STOP` 

        setting or operator selection that changes the behavior of the controller on a piece of equipment.

    * `USEABLE` 

        remaining usable measure of an object or action.

    * `UUID` 

        universally unique identifier as specified in ISO 11578 or RFC 4122.

    * `VERSION` 

        version of the hardware or software.

    * `VERTICAL` 

        indication of the position of a mechanism that may move in a vertical direction.

    * `VICKERS` 

        scale to measure the resistance to deformation of a surface.

    * `VLAN_ID` 

        layer2 Virtual Local Network (VLAN) ID for the {{block(Component)}} network.

    * `WASTE` 

        amount discarded.

    * `WIRELESS` 

        identifies whether the connection type is wireless.

    * `WORKING` 

        piece of equipment performing any activity, the equipment is active and performing a function under load or not.

* {{property(type)}} 

    type of data being measured. See {{package(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(units)}} 

    unit of measurement for the reported value of the data item.

    `<<extensible>>` `UnitEnum` Enumeration:

    * `AMPERE` 

        electric current in ampere.

    * `CELSIUS` 

        temperature in degree Celsius.

    * `COULOMB` 

        electric charge in coulomb.

    * `COUNT` 

        count of something.

    * `COUNT/SECOND` 

        frequency in count per second.

    * `CUBIC_METER` 

        geometric volume in meter.

    * `CUBIC_MILLIMETER` 

        geometric volume in millimeter.

    * `CUBIC_MILLIMETER/SECOND` 

        change of geometric volume per second.

    * `CUBIC_MILLIMETER/SECOND^2` 

        change in geometric volume per second squared.

    * `DECIBEL` 

        sound level in decibel.

    * `DEGREE` 

        angle in degree.

    * `DEGREE/SECOND` 

        angular velocity in degree per second.

    * `DEGREE/SECOND^2` 

        angular acceleration in degree per second squared.

    * `DEGREE_3D` 

        space-delimited, floating-point representation of the angular rotation in degrees around the X, Y, and Z axes relative to a cartesian coordinate system respectively in order as A, B, and C. 
        
        If any of the rotations is not known, it **MUST** be zero (0).

    * `GRAM` 

        mass in gram.

    * `GRAM/CUBIC_METER` 

        density in gram per cubic meter.

    * `HERTZ` 

        frequency in cycles per second.

    * `JOULE` 

        energy in joule.

    * `KILOGRAM` 

        mass in kilogram.

    * `LITER` 

        volume in liter.

    * `LITER/SECOND` 

        volumetric flow in liter per second.

    * `METER/SECOND^2` 

        acceleration in meter per second squared.

    * `MICRO_RADIAN` 

        tilt in micro radian.

    * `MILLIGRAM` 

        mass in milligram.

    * `MILLIGRAM/CUBIC_MILLIMETER` 

        density in milligram per cubic millimeter.

    * `MILLILITER` 

        volume in milliliter.

    * `MILLIMETER` 

        length in millimeter.

    * `MILLIMETER/REVOLUTION` 

        feedrate per revolution in millimeter per revolution.

    * `MILLIMETER/SECOND` 

        speed in millimeter per second.

    * `MILLIMETER/SECOND^2` 

        acceleration in millimeter per second squared.

    * `MILLIMETER_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in millimeters.

    * `NEWTON` 

        force in newton.

    * `NEWTON_METER` 

        torque in newton-meter.

    * `OHM` 

        electrical resistance in ohm.

    * `OHM_METER` 

        resistivity in ohm-meter.

    * `PASCAL` 

        pressure or stress in pascal.

    * `PASCAL/SECOND` 

        pressurization rate in pascal per second.

    * `PASCAL_SECOND` 

        viscosity in pascal-second.

    * `PERCENT` 

        amount in or for every hundred.

    * `PH` 

        acidity or alkalinity of a solution in pH.

    * `REVOLUTION/MINUTE` 

        rotational velocity in revolution per minute.

    * `REVOLUTION/SECOND` 

        rotational velocity in revolution per second.

    * `REVOLUTION/SECOND^2` 

        rotational acceleration in revolution per second squared.

    * `SECOND` 

        time in second.

    * `SIEMENS/METER` 

        electrical conductivity in siemens per meter.

    * `SQUARE_MILLIMETER` 

        geometric area in millimeter.

    * `UNIT_VECTOR_3D` 

        3D Unit Vector.
        
        Space delimited list of three floating point numbers.

    * `VOLT` 

        electric potential, electric potential difference or electromotive force in volt.

    * `VOLT_AMPERE` 

        apparent power in an electrical circuit, equal to the product of root-mean-square (RMS) voltage and RMS current (commonly referred to as VA) in volt-ampere.

    * `VOLT_AMPERE_REACTIVE` 

        reactive power in an AC electrical circuit (commonly referred to as VAR) in volt-ampere-reactive.

    * `WATT` 

        power in watt.

    * `WATT_SECOND` 

        electrical energy in watt-second

* {{property(representation)}} 

    description of a means to interpret data consisting of multiple data points or samples reported as a single value.  
    
    If {{property(DataItem::representation)}} is not specified, it **MUST** be determined to be `VALUE`.
    

    `RepresentationEnum` Enumeration:

    * `DATA_SET` 

        reported value(s) are represented as a set of {{termplural(key-value pair)}}.
        
        Each reported value in the {{term(data set)}} **MUST** have a unique key.

    * `<<deprecated>>` `DISCRETE` 

        **DEPRECATED** as {{property(DataItem::representation)}} type in *MTConnect Version 1.5*. Replaced by the {{property(DataItem::discrete)}}.

    * `TABLE` 

        two dimensional set of {{termplural(key-value pair)}} where the {{block(Entry)}} represents a row, and the value is a set of {{term(key-value pair)}} {{block(Cell)}} elements. 
        
        A {{term(table)}} follows the same behavior as the {{term(data set)}} for change tracking, clearing, and history. When an {{block(Entry)}} changes, all {{block(Cell)}} elements update as a single unit following the behavior of a {{term(data set)}}.
        
        > Note: It is best to use {{block(Variable)}} if the {{block(Cell)}} entities represent multiple semantic types.
        
        Each {{block(Entry)}} in the {{term(table)}} **MUST** have a unique key. Each {{block(Cell)}} of each {{block(Entry)}} in the {{term(table)}} **MUST** have a unique key.
        
        See {{block(Representation)}} in {{package(Observation Information Model)}}, for a description of {{block(Entry)}} and {{block(Cell)}} elements.

    * `TIME_SERIES` 

        series of sampled data.
        
        The data is reported for a specified number of samples and each sample is reported with a fixed period.

    * `VALUE` 

        measured value of the sample data.
        
        If no {{property(DataItem::representation)}} is specified for a data item, the {{property(DataItem::representation)}} **MUST** be determined to be `VALUE`.

* {{property(coordinateSystemIdRef)}} 

    associated {{block(CoordinateSystem)}} context for the {{block(DataItem)}}.

#### Reference Properties of DataItem

{{tbl(reference-properties-of-dataitem)}} lists the Reference Properties of {{block(DataItem)}}.

|Reference Property name|Multiplicity|
|:-|:-:|
|{{block(Observation)}} (organized by `Observations`)|0..*|
{: caption="Reference Properties of DataItem" label="table:reference-properties-of-dataitem"}

Descriptions for Reference Properties of {{block(DataItem)}}:

* {{block(Observation)}} 

    abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.

    {{block(Observations)}} groups one or more {{block(Observation)}} entities made for the {{block(DataItem)}} entity. 
    
    {{block(Component)}} {{termplural(observe)}} {{block(DataItem)}} entities to create {{block(Observation)}} entities for the {{block(DataItem)}} entities.
    
    See {{package(Observation Information Model)}} for the {{block(Observation)}} model.
    
    > Note 1 to entry: In the {{term(XML)}} representation, {{block(Observation)}} entities **MUST NOT** appear in the {{term(MTConnectDevices Response Document)}}.
    
    > Note 2 to entry: In the {{term(XML)}} representation, {{block(Observation)}} entities **MUST** appear only in the {{term(MTConnectStreams Response Document)}}.

#### Part Properties of DataItem

{{tbl(part-properties-of-dataitem)}} lists the Part Properties of {{block(DataItem)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Source)}}|0..1|
|{{block(Constraints)}}|0..1|
|{{block(Filter)}} (organized by `Filters`)|0..*|
|{{block(InitialValue)}}|0..1|
|{{block(ResetTrigger)}}|0..1|
|{{block(Definition)}}|0..1|
|{{block(AbstractDataItemRelationship)}} (organized by `Relationships`)|0..*|
{: caption="Part Properties of DataItem" label="table:part-properties-of-dataitem"}

Descriptions for Part Properties of {{block(DataItem)}}:

* {{block(Source)}} 

    identifies the {{block(Component)}}, {{block(DataItem)}}, or {{block(Composition)}} from which a measured value originates.

    See {{sect(Source)}}.

* {{block(Constraints)}} 

    {{termplural(organize)}} a set of expected values that can be reported for a {{block(DataItem)}}.

    {{block(Constraints)}} organizes a set of expected values that can be reported for the {{block(DataItem)}}. See {{sect(Constraints)}}.

* {{block(Filter)}} 

    provides a means to control when an {{term(agent)}} records updated information for a {{block(DataItem)}}. 

    {{block(Filters)}} groups one or more {{block(Filter)}} entities associated with the {{block(DataItem)}}. 

* {{block(InitialValue)}} 

    starting value for a {{block(DataItem)}} as well as the value to be set for the {{block(DataItem)}} after a reset event.

* {{block(ResetTrigger)}} 

    type of event that may cause a reset to occur.

* {{block(Definition)}} 

    defines the meaning of {{block(Entry)}} and {{block(Cell)}} entities when the associated {{property(DataItem::representation)}} is either `DATA_SET` or `TABLE`.

    See {{sect(Definition)}}.

* {{block(AbstractDataItemRelationship)}} 

    association between a {{block(DataItem)}} and another entity.

    {{block(Relationships)}} groups one or more {{block(DataItemRelationship)}} and {{block(SpecificationRelationship)}}. See {{package(Relationships)}}.



## Properties of DataItem

This section provides additional semantic information for the Part Properties of {{block(DataItem)}}.

> Note: See {{sect(DataItems Schema Diagrams)}} for XML schema of the elements for {{block(DataItem)}}.

### ResetTrigger

type of event that may cause a reset to occur.



`ResetTriggerEnum` Enumeration:

* `ACTION_COMPLETE` 

    {{term(observation)}} of the {{block(DataItem)}} that is measuring an action or operation is to be reset upon completion of that action or operation.

* `ANNUAL` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a 12-month period.

* `DAY` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a 24-hour period.

* `LIFE` 

    {{term(observation)}} of the {{block(DataItem)}} is not reset and accumulates for the entire life of the piece of equipment.

* `MAINTENANCE` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset upon completion of a maintenance event.

* `MONTH` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a monthly period.

* `POWER_ON` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset when power was applied to the piece of equipment after a planned or unplanned interruption of power has occurred.

* `SHIFT` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a work shift.

* `WEEK` 

    {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a 7-day period.

### Source

identifies the {{block(Component)}}, {{block(DataItem)}}, or {{block(Composition)}} from which a measured value originates.



The value of {{property(Source)}} **MUST** be `string`.

#### Value Properties of Source

{{tbl(value-properties-of-source)}} lists the Value Properties of {{block(Source)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(componentId)}}|`ID`|0..1|
|{{property(compositionId)}}|`ID`|0..1|
|{{property(dataItemId)}}|`ID`|0..1|
{: caption="Value Properties of Source" label="table:value-properties-of-source"}

Descriptions for Value Properties of {{block(Source)}}:

* {{property(componentId)}} 

    identifier of the {{block(Component)}} that represents the physical part of a piece of equipment where the data represented by the {{block(DataItem)}} originated.

* {{property(compositionId)}} 

    identifier of the {{block(Composition)}} that represents the physical part of a piece of equipment where the data represented by the {{block(DataItem)}} originated.

* {{property(dataItemId)}} 

    identifier of the {{block(DataItem)}} that represents the originally measured value of the data referenced by this {{block(DataItem)}}.

### InitialValue

starting value for a {{block(DataItem)}} as well as the value to be set for the {{block(DataItem)}} after a reset event.



The value of {{property(InitialValue)}} **MUST** be `string`.

### Filter

provides a means to control when an {{term(agent)}} records updated information for a {{block(DataItem)}}. 



The value of {{property(Filter)}} **MUST** be `float`.

#### Value Properties of Filter

{{tbl(value-properties-of-filter)}} lists the Value Properties of {{block(Filter)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`FilterEnum`|1|
{: caption="Value Properties of Filter" label="table:value-properties-of-filter"}

Descriptions for Value Properties of {{block(Filter)}}:

* {{property(type)}} 

    type of {{block(Filter)}}.

    `FilterEnum` Enumeration:

    * `MINIMUM_DELTA` 

        new value **MUST NOT** be reported for a data item unless the measured value has changed from the last reported value by at least the delta given as the value of this element.
        
        The value of {{block(Filter)}} **MUST** be an absolute value using the same units as the reported data.

    * `PERIOD` 

        data reported for a data item is provided on a periodic basis. The `PERIOD` for reporting data is defined in the value of the {{block(Filter)}}.
        
        The value of {{block(Filter)}} **MUST** be an absolute value reported in seconds representing the time between reported samples of the value of the data item.

### `<<hasFormatSpecificRepresentation>>`MinimumDeltaFilter

{{def(FilterEnum::MINIMUM_DELTA)}}



### `<<hasFormatSpecificRepresentation>>`PeriodFilter

{{def(FilterEnum::PERIOD)}}



The value of {{property(PeriodFilter)}} **MUST** be `SECOND`. See {{sect(second)}}.

### Constraints

{{termplural(organize)}} a set of expected values that can be reported for a {{block(DataItem)}}.



#### Value Properties of Constraints

{{tbl(value-properties-of-constraints)}} lists the Value Properties of {{block(Constraints)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(Maximum)}}|`float`|0..1|
|{{property(Minimum)}}|`float`|0..1|
|{{property(Nominal)}}|`float`|0..1|
|{{property(Value)}}|`string`|0..*|
{: caption="Value Properties of Constraints" label="table:value-properties-of-constraints"}

Descriptions for Value Properties of {{block(Constraints)}}:

* {{property(Maximum)}} 

    numeric upper constraint.
    
    If the data reported for a data item is a range of numeric values, the expected value reported **MAY** be described with an upper limit defined by this constraint.

* {{property(Minimum)}} 

    numeric lower constraint.
    
    If the data reported for a data item is a range of numeric values, the expected value reported **MAY** be described with a lower limit defined by this constraint.

* {{property(Nominal)}} 

    numeric target or expected value.

* {{property(Value)}} 

    single data value that is expected to be reported for a {{block(DataItem)}}.
    
    {{property(Constraints::Value)}} **MUST NOT** be used in conjunction with any other {{block(Constraint)}} elements.

#### Part Properties of Constraints

{{tbl(part-properties-of-constraints)}} lists the Part Properties of {{block(Constraints)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|`<<deprecated>>` {{block(Filter)}}|0..1|
{: caption="Part Properties of Constraints" label="table:part-properties-of-constraints"}

Descriptions for Part Properties of {{block(Constraints)}}:

* {{block(Filter)}} 

    provides a means to control when an {{term(agent)}} records updated information for a {{block(DataItem)}}. 

    **DEPRECATED** in *MTConnect Version 1.4*. Moved to the {{block(Filters)}}. See {{package(Properties of DataItem)}}.

### Definition

defines the meaning of {{block(Entry)}} and {{block(Cell)}} entities when the associated {{property(DataItem::representation)}} is either `DATA_SET` or `TABLE`.



#### Part Properties of Definition

{{tbl(part-properties-of-definition)}} lists the Part Properties of {{block(Definition)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(CellDefinition)}} (organized by `CellDefinitions`)|0..*|
|{{block(EntryDefinition)}} (organized by `EntryDefinitions`)|0..*|
{: caption="Part Properties of Definition" label="table:part-properties-of-definition"}

Descriptions for Part Properties of {{block(Definition)}}:

* {{block(CellDefinition)}} 

    semantic definition of a {{block(Cell)}}.

    {{block(CellDefinitions)}} groups one or more {{block(CellDefinition)}} entities. See {{sect(CellDefinition)}}.

* {{block(EntryDefinition)}} 

    semantic definition of an {{block(Entry)}}.

    {{block(EntryDefinitions)}} groups one or more {{block(EntryDefinition)}} entities. See {{sect(EntryDefinition)}}.



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
|{{property(keyType)}}|`DataItemTypeEnum`|0..1|
{: caption="Value Properties of CellDefinition" label="table:value-properties-of-celldefinition"}

Descriptions for Value Properties of {{block(CellDefinition)}}:

* {{property(units)}} 

    same as {{property(DataItem::units)}}. See {{sect(Value Properties of DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(key)}} 

    unique identification of the {{block(Cell)}} in the {{block(Definition)}}. 
    
    The description applies to all {{block(Cell)}} {{termplural(observation)}} having this {{property(CellDefinition::key)}}.

* {{property(type)}} 

    same as {{property(DataItem::type)}}. See {{package(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(subType)}} 

    same as {{property(DataItem::subType)}}. See {{sect(DataItem)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(keyType)}} 

    {{property(DataItem::type)}} that defines the meaning of {{property(CellDefinition::key)}}.

    The value of {{property(keyType)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

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
|{{property(keyType)}}|`DataItemTypeEnum`|0..1|
{: caption="Value Properties of EntryDefinition" label="table:value-properties-of-entrydefinition"}

Descriptions for Value Properties of {{block(EntryDefinition)}}:

* {{property(key)}} 

    unique identification of the {{block(Entry)}} in the {{block(Definition)}}. 
    
    The description applies to all {{block(Entry)}} {{termplural(observation)}} having this {{property(EntryDefinition::key)}}.

* {{property(units)}} 

    same as {{property(DataItem::units)}}. See {{sect(Value Properties of DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(type)}} 

    same as {{property(DataItem::type)}}. See {{package(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(subType)}} 

    same as {{property(DataItem::subType)}}. See {{sect(DataItem)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(keyType)}} 

    {{property(DataItem::type)}} that defines the meaning of {{property(EntryDefinition::key)}}.

    The value of {{property(keyType)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

#### Part Properties of EntryDefinition

{{tbl(part-properties-of-entrydefinition)}} lists the Part Properties of {{block(EntryDefinition)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(CellDefinition)}} (organized by `CellDefinitions`)|0..*|
{: caption="Part Properties of EntryDefinition" label="table:part-properties-of-entrydefinition"}

Descriptions for Part Properties of {{block(EntryDefinition)}}:

* {{block(CellDefinition)}} 

    semantic definition of a {{block(Cell)}}.

    {{block(CellDefinitions)}} groups one or more {{block(CellDefinition)}} entities if {{property(DataItem::representation)}} is `TABLE`. See {{sect(CellDefinition)}}.



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



## DataItem Types

This section provides semantic information for the types of a {{block(DataItem)}}.

In the MTConnect Standard, {{block(DataItem)}} are defined and organized based upon the {{property(DataItem::category)}} and {{property(DataItem::type)}}.  The {{property(DataItem::category)}} provides a high level grouping for {{block(DataItem)}}s based on the kind of information that is reported by the data item.

These categories are:

* `SAMPLE`: A `SAMPLE` reports a continuously variable or analog data value. 

* `EVENT`: An `EVENT` reports information representing a functional state, with two or more discrete values, associated with a component or it contains a message.  The data provided may be a numeric value or text.

* `CONDITION`: A `CONDITION` reports information about the health of a piece of equipment and its ability to function.

The {{property(DataItem::type)}} specifies the specific kind of data that is reported.   For some types of data items, a {{property(DataItem::subType)}} may also be used to differentiate between multiple data items of the same {{property(DataItem::type)}} where the information reported by the data item has a different, but related, meaning.

Many types of data items provide two forms of data: a value (reported as either a `SAMPLE` or `EVENT`) and a health status (reported as a `CONDITION`).  These {{block(DataItem)}} types **MAY** be defined in more than one {{property(DataItem::category)}} based on the data that they report.


### Condition

abstract {{block(DataItem)}} that is about an entity's status regarding its ability to operate or it provides an indication whether the data reported for the entity is within an expected range.


{{block(Condition)}} is reported differently than {{block(Sample)}} or {{block(Event)}}.  {{block(Condition)}} **MUST** be reported as {{block(Normal)}}, {{block(Warning)}}, or {{block(Fault)}}.

All {{block(Sample)}}s **MAY** have associated {{block(Condition)}} states.  {{block(Condition)}} states indicate whether the value for the data is within an expected range and **MUST** be reported as {{block(Normal)}}, or the value is unexpected or out of tolerance for the data and a {{block(Warning)}} or {{block(Fault)}} **MUST** be provided.


#### Value Properties of Condition

{{tbl(value-properties-of-condition)}} lists the Value Properties of {{block(Condition)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(category)}}|`CONDITION`|1|
|{{property(type)}}|`ConditionEnum`|1|
{: caption="Value Properties of Condition" label="table:value-properties-of-condition"}

Descriptions for Value Properties of {{block(Condition)}}:

* {{property(type)}} 

    `<<extensible>>` `ConditionEnum` Enumeration:

    * `ACTUATOR` 

        indication of a fault associated with an actuator.

    * `COMMUNICATIONS` 

        indication that the piece of equipment has experienced a communications failure.

    * `DATA_RANGE` 

        indication that the value of the data associated with a measured value or a calculation is outside of an expected range.

    * `LOGIC_PROGRAM` 

        indication that an error occurred in the logic program or programmable logic controller (PLC) associated with a piece of equipment.

    * `MOTION_PROGRAM` 

        indication that an error occurred in the motion program associated with a piece of equipment.

    * `SYSTEM` 

        general purpose indication associated with an electronic component of a piece of equipment or a controller that represents a fault that is not associated with the operator, program, or hardware.

### Event

abstract {{block(DataItem)}} that is a discrete piece of information from a piece of equipment. It does not have intermediate values that vary over time.



An {{block(Event)}} is information that, when provided at any specific point in time, represents the current state of the piece of equipment.


#### Value Properties of Event

{{tbl(value-properties-of-event)}} lists the Value Properties of {{block(Event)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(category)}}|`EVENT`|1|
|{{property(type)}}|`EventEnum`|1|
{: caption="Value Properties of Event" label="table:value-properties-of-event"}

Descriptions for Value Properties of {{block(Event)}}:

* {{property(type)}} 

    `<<extensible>>` `EventEnum` Enumeration:

    * `ACTIVATION_COUNT` 

        accumulation of the number of times a function has attempted to, or is planned to attempt to, activate or be performed.

    * `ACTIVE_AXES` 

        set of axes currently associated with a {{block(Path)}} or {{block(Controller)}}.

    * `ACTIVE_POWER_SOURCE` 

        active energy source for the {{block(Component)}}.

    * `ACTUATOR_STATE` 

        operational state of an apparatus for moving or controlling a mechanism or system.

    * `ADAPTER_SOFTWARE_VERSION` 

        originator’s software version of the {{term(adapter)}}.

    * `ADAPTER_URI` 

        {{term(URI)}} of the {{term(adapter)}}.

    * `<<deprecated>>` `ALARM` 

        **DEPRECATED:** Replaced with `CONDITION` category data items in Version 1.1.0.

    * `<<deprecated>>` `ALARM_LIMIT` 

        set of limits used to trigger warning or alarm indicators.
        
        **DEPRECATED** in *Version 2.5*. Replaced by  `ALARM_LIMITS`.

    * `ALARM_LIMITS` 

        set of limits used to trigger warning or alarm indicators.

    * `APPLICATION` 

        application on a {{block(Component)}}.

    * `ASSET_CHANGED` 

        {{block(assetId)}} of the {{term(Asset)}} that has been added or changed.

    * `ASSET_COUNT` 

        {{term(data set)}} of the number of {{termplural(Asset)}} of a given type for a {{term(Device)}}.

    * `ASSET_REMOVED` 

        {{block(assetId)}} of the {{term(Asset)}} that has been removed.

    * `AVAILABILITY` 

        {{term(agent)}}'s ability to communicate with the data source.

    * `AXIS_COUPLING` 

        describes the way the axes will be associated to each other. 
          
        This is used in conjunction with `COUPLED_AXES` to indicate the way they are interacting.

    * `AXIS_FEEDRATE_OVERRIDE` 

        value of a signal or calculation issued to adjust the feedrate of an individual linear type axis.

    * `AXIS_INTERLOCK` 

        state of the axis lockout function when power has been removed and the axis is allowed to move freely.

    * `AXIS_STATE` 

        state of a {{block(Linear)}} or {{block(Rotary)}} component representing an axis.

    * `BATTERY_STATE` 

        present status of the battery.

    * `BLOCK` 

        line of code or command being executed by a {{block(Controller)}} entity.

    * `BLOCK_COUNT` 

        total count of the number of blocks of program code that have been executed since execution started.

    * `CHARACTERISTIC_PERSISTENT_ID` 

        {{term(UUID)}} of the {{term(characteristic)}}.

    * `CHARACTERISTIC_STATUS` 

        pass/fail result of the measurement.

    * `CHUCK_INTERLOCK` 

        state of an interlock function or control logic state intended to prevent the associated {{block(Chuck)}} component from being operated.

    * `CHUCK_STATE` 

        operating state of a mechanism that holds a part or stock material during a manufacturing process. 
        
        It may also represent a mechanism that holds any other mechanism in place within a piece of equipment.

    * `CLOCK_TIME` 

        time provided by a timing device at a specific point in time.

    * `<<deprecated>>` `CODE` 

        programmatic code being executed.
        
        **DEPRECATED** in *Version 1.1*.

    * `COMPONENT_DATA` 

        {{block(Event)}} that represents a {{block(Component)}} where the {{block(EntryDefinition)}} identifies the {{block(Component)}} and the {{block(CellDefinition)}}s define the {{block(Component)}}'s observed {{block(DataItem)}}s.

    * `COMPOSITION_STATE` 

        operating state of a mechanism represented by a {{block(Composition)}} entity.

    * `CONNECTION_STATUS` 

        status of the connection between an {{term(adapter)}} and an {{term(agent)}}.

    * `CONTROLLER_MODE` 

        current mode of the {{block(Controller)}} component.

    * `CONTROLLER_MODE_OVERRIDE` 

        setting or operator selection that changes the behavior of a piece of equipment.

    * `<<deprecated>>` `CONTROL_LIMIT` 

        set of limits used to indicate whether a process variable is stable and in control.
        
        **DEPRECATED** in *Version 2.5*. Replaced by `CONTROL_LIMITS`.

    * `CONTROL_LIMITS` 

        set of limits used to indicate whether a process variable is stable and in control.

    * `COUPLED_AXES` 

        set of associated axes.

    * `CYCLE_COUNT` 

        accumulation of the number of times a cyclic function has attempted to, or is planned to attempt to execute.

    * `DATE_CODE` 

        time and date code associated with a material or other physical item.

    * `DEACTIVATION_COUNT` 

        accumulation of the number of times a function has attempted to, or is planned to attempt to, deactivate or cease.

    * `DEVICE_ADDED` 

        {{term(UUID)}} of new device added to an {{term(MTConnect Agent)}}.

    * `DEVICE_CHANGED` 

        {{term(UUID)}} of the device whose {{term(metadata)}} has changed.

    * `DEVICE_REMOVED` 

        {{term(UUID)}} of a device removed from an {{term(MTConnect Agent)}}.

    * `DEVICE_UUID` 

        identifier of another piece of equipment that is temporarily associated with a component of this piece of equipment to perform a particular function.

    * `DIRECTION` 

        direction of motion.

    * `DOOR_STATE` 

        operational state of a {{block(Door)}} component or composition element.

    * `EMERGENCY_STOP` 

        state of the emergency stop signal for a piece of equipment, controller path, or any other component or subsystem of a piece of equipment.

    * `END_OF_BAR` 

        indication of whether the end of a piece of bar stock being feed by a bar feeder has been reached.

    * `EQUIPMENT_MODE` 

        indication that a piece of equipment, or a sub-part of a piece of equipment, is performing specific types of activities.

    * `EXECUTION` 

        operating state of a {{block(Component)}}.

    * `FEATURE_MEASUREMENT` 

        assessing elements of a {{term(feature)}}.

    * `FEATURE_PERSISTENT_ID` 

        {{term(UUID)}} of a {{term(feature)}}. {{cite(ISO 10303 AP 242/239)}}.

    * `FIRMWARE` 

        embedded software of a {{block(Component)}}.

    * `FIXTURE_ID` 

        identifier for the current workholding or part clamp in use by a piece of equipment.

    * `FUNCTIONAL_MODE` 

        current intended production status of the {{block(Component)}}.

    * `HARDNESS` 

        hardness of a material.

    * `HARDWARE` 

        hardware of a {{block(Component)}}.

    * `HOST_NAME` 

        name of the host computer supplying data.

    * `LEAK_DETECT` 

        indication designating whether a leak has been detected.

    * `LIBRARY` 

        software library on a {{block(Component)}}

    * `<<deprecated>>` `LINE` 

        current line of code being executed.
        
        **DEPRECATED** in *Version 1.4.0*.

    * `LINE_LABEL` 

        identifier for a {{block(Block)}} of code in a {{block(Program)}}.

    * `LINE_NUMBER` 

        position of a block of program code within a control program.

    * `LOAD_COUNT` 

        accumulation of the number of times an operation has attempted to, or is planned to attempt to, load materials, parts, or other items.

    * `LOCATION_ADDRESS` 

        structured information that allows the unambiguous determination of an object for purposes of identification and location. {{cite(ISO 19160-4:2017)}}

    * `LOCATION_NARRATIVE` 

        textual description of the location of an object or activity.

    * `LOCATION_SPATIAL_GEOGRAPHIC` 

        absolute geographic location defined by two coordinates, longitude and latitude and an elevation.

    * `LOCK_STATE` 

        state or operating mode of a {{block(Lock)}}.

    * `MAINTENANCE_LIST` 

        actions or activities to be performed in support of a piece of equipment.

    * `MATERIAL` 

        identifier of a material used or consumed in the manufacturing process.

    * `MATERIAL_LAYER` 

        identifies the layers of material applied to a part or product as part of an additive manufacturing process.

    * `MEASUREMENT_TYPE` 

        class of measurement being performed. {{cite(QIF 3:2018 Section 6.3)}}

    * `MEASUREMENT_UNITS` 

        engineering units of the measurement.

    * `MEASUREMENT_VALUE` 

        measurement based on the measurement type.

    * `MESSAGE` 

        information to be transferred from a piece of equipment to a client software application.

    * `MTCONNECT_VERSION` 

        reference version of the MTConnect Standard supported by the {{term(adapter)}}.

    * `NETWORK` 

        network details of a {{block(Component)}}.

    * `NETWORK_PORT` 

        number of the TCP/IP or UDP/IP port for the connection endpoint.

    * `OPERATING_MODE` 

        state of {{block(Component)}} or {{block(Composition)}} that describes the automatic or manual operation of the entity.

    * `OPERATING_SYSTEM` 

        Operating System (OS) of a {{block(Component)}}.

    * `OPERATOR_ID` 

        identifier of the person currently responsible for operating the piece of equipment.

    * `PALLET_ID` 

        identifier for a pallet.

    * `PART_COUNT` 

        aggregate count of parts.

    * `PART_COUNT_TYPE` 

        interpretation of `PART_COUNT`.

    * `PART_DETECT` 

        indication designating whether a part or work piece has been detected or is present.

    * `PART_GROUP_ID` 

        identifier given to a collection of individual parts. 

    * `PART_ID` 

        identifier of a part in a manufacturing operation.

    * `PART_INDEX` 

        sequence of a part in a group of parts.

    * `PART_KIND_ID` 

        identifier given to link the individual occurrence to a class of parts, typically distinguished by a particular part design.

    * `<<deprecated>>` `PART_NUMBER` 

        identifier of a part or product moving through the manufacturing process.
        
        **DEPRECATED** in *Version 1.7*. `PART_NUMBER` is now a `subType` of `PART_KIND_ID`.

    * `PART_PROCESSING_STATE` 

        particular condition of the part occurrence at a specific time.

    * `PART_STATUS` 

        state or condition of a part.

    * `PART_UNIQUE_ID` 

        identifier given to a distinguishable, individual part. 

    * `PATH_FEEDRATE_OVERRIDE` 

        value of a signal or calculation issued to adjust the feedrate for the axes associated with a {{block(Path)}} component that may represent a single axis or the coordinated movement of multiple axes.

    * `PATH_MODE` 

        describes the operational relationship between a {{block(Path)}} entity and another {{block(Path)}} entity for pieces of equipment comprised of multiple logical groupings of controlled axes or other logical operations.

    * `POWER_STATE` 

        indication of the status of the source of energy for an entity to allow it to perform its intended function or the state of an enabling signal providing permission for the entity to perform its functions.

    * `<<deprecated>>` `POWER_STATUS` 

        status of the {{block(Component)}}.
        
        **DEPRECATED** in *Version 1.1.0*.

    * `PROCESS_AGGREGATE_ID` 

        identifier given to link the individual occurrence to a group of related occurrences, such as a process step in a process plan.

    * `PROCESS_KIND_ID` 

        identifier given to link the individual occurrence to a class of processes or process definition.

    * `PROCESS_OCCURRENCE_ID` 

        identifier of a process being executed by the device.

    * `PROCESS_STATE` 

        particular condition of the process occurrence at a specific time.

    * `PROCESS_TIME` 

        time and date associated with an activity or event.

    * `PROGRAM` 

        name of the logic or motion program being executed by the {{block(Controller)}} component.

    * `PROGRAM_COMMENT` 

        comment or non-executable statement in the control program.

    * `PROGRAM_EDIT` 

        indication of the status of the {{block(Controller)}} components program editing mode.
        
        A program may be edited while another is executed.

    * `PROGRAM_EDIT_NAME` 

        name of the program being edited. 
        
        This is used in conjunction with {{block(ProgramEdit)}} when in `ACTIVE` state. 

    * `PROGRAM_HEADER` 

        non-executable header section of the control program.

    * `PROGRAM_LOCATION` 

        {{term(URI)}} for the source file associated with {{block(Program)}}.

    * `PROGRAM_LOCATION_TYPE` 

        defines whether the logic or motion program defined by {{block(Program)}} is being executed from the local memory of the controller or from an outside source.

    * `PROGRAM_NEST_LEVEL` 

        indication of the nesting level within a control program that is associated with the code or instructions that is currently being executed.

    * `ROTARY_MODE` 

        current operating mode for a {{block(Rotary)}} type axis.

    * `ROTARY_VELOCITY_OVERRIDE` 

        percentage change to the velocity of the programmed velocity for a {{block(Rotary)}} axis.

    * `ROTATION` 

        three space angular displacement of an object or coordinate system relative to a {{term(cartesian coordinate system)}}.

    * `SENSOR_ATTACHMENT` 

        {{term(attachment)}} between a sensor and an entity.

    * `SENSOR_STATE` 

        detection result of a sensor.

    * `SERIAL_NUMBER` 

        serial number associated with a {{block(Component)}}, {{block(Asset)}}, or {{block(Device)}}.

    * `<<deprecated>>` `SPECIFICATION_LIMIT` 

        set of limits defining a range of values designating acceptable performance for a variable.
        
        **DEPRECATED** in *Version 2.5*. Replaced by  `SPECIFICATION_LIMITS`.

    * `SPECIFICATION_LIMITS` 

        set of limits defining a range of values designating acceptable performance for a variable.

    * `SPINDLE_INTERLOCK` 

        indication of the status of the spindle for a piece of equipment when power has been removed and it is free to rotate.

    * `THICKNESS` 

        dimension between two surfaces of an object, usually the dimension of smallest measure, for example an additive layer, or a depth of cut.

    * `TOOL_ASSET_ID` 

        identifier of an individual tool asset.

    * `TOOL_CUTTING_ITEM` 

        references the {{block(CuttingToolLifeCycle)}} {{block(CuttingItem)}} index related to the {{property(CuttingItem::indices)}} of the currently active cutting tool edge.

    * `TOOL_GROUP` 

        identifier for the tool group associated with a specific tool. Commonly used to designate spare tools.

    * `<<deprecated>>` `TOOL_ID` 

        identifier of the tool currently in use for a given `Path`.
        
        **DEPRECATED** in *Version 1.2.0*.   See `TOOL_NUMBER`.

    * `TOOL_NUMBER` 

        identifier assigned by the {{block(Controller)}} component to a cutting tool when in use by a piece of equipment.

    * `TOOL_OFFSET` 

        reference to the tool offset variables applied to the active cutting tool.

    * `TOOL_OFFSETS` 

        properties of each addressable tool offset.

    * `TRANSFER_COUNT` 

        accumulation of the number of times an operation has attempted to, or is planned to attempt to, transfer materials, parts, or other items from one location to another.

    * `TRANSLATION` 

        three space linear displacement of an object or coordinate system relative to a {{term(cartesian coordinate system)}}.

    * `UNCERTAINTY` 

        {{term(uncertainty)}} specified by {{block(UncertaintyType)}}.

    * `UNCERTAINTY_TYPE` 

        method used to compute {{term(standard uncertainty)}}.

    * `UNLOAD_COUNT` 

        accumulation of the number of times an operation has attempted to, or is planned to attempt to, unload materials, parts, or other items.

    * `USER` 

        identifier of the person currently responsible for operating the piece of equipment.

    * `VALVE_STATE` 

        state of a valve is one of open, closed, or transitioning between the states.

    * `VARIABLE` 

        data whose meaning may change over time due to changes in the operation of a piece of equipment or the process being executed on that piece of equipment.

    * `WAIT_STATE` 

        indication of the reason that {{block(Execution)}} is reporting a value of `WAIT`.

    * `WIRE` 

        identifier for the type of wire used as the cutting mechanism in Electrical Discharge Machining or similar processes.

    * `WORKHOLDING_ID` 

        identifier for the current workholding or part clamp in use by a piece of equipment.
        
        **DEPRECATION WARNING**: Recommend using `FIXTURE_ID` instead.

    * `WORK_OFFSET` 

        reference to offset variables for a work piece or part.

    * `WORK_OFFSETS` 

        properties of each addressable work offset.

### Sample

abstract {{block(DataItem)}} that is continuously changing or analog data value.



This data can be measured at any point-in-time and will always produce a result.


The {{property(units)}} for {{block(Sample)}} **MUST** always be specified.

#### Value Properties of Sample

{{tbl(value-properties-of-sample)}} lists the Value Properties of {{block(Sample)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(category)}}|`SAMPLE`|1|
|{{property(type)}}|`SampleEnum`|1|
{: caption="Value Properties of Sample" label="table:value-properties-of-sample"}

Descriptions for Value Properties of {{block(Sample)}}:

* {{property(type)}} 

    `<<extensible>>` `SampleEnum` Enumeration:

    * `ACCELERATION` 

        positive rate of change of velocity.

    * `ACCUMULATED_TIME` 

        accumulated time for an activity or event.

    * `<<deprecated>>` `AMPERAGE` 

        strength of electrical current.
        
        **DEPRECATED** in *Version 1.6*. Replaced by `AMPERAGE_AC` and `AMPERAGE_DC`.

    * `AMPERAGE_AC` 

        electrical current that reverses direction at regular short intervals.

    * `AMPERAGE_DC` 

        electric current flowing in one direction only.

    * `ANGLE` 

        angular position.

    * `ANGULAR_ACCELERATION` 

        positive rate of change of angular velocity.

    * `ANGULAR_DECELERATION` 

        negative rate of change of angular velocity.

    * `ANGULAR_VELOCITY` 

        rate of change of angular position.

    * `ASSET_UPDATE_RATE` 

        average rate of change of values for assets in the MTConnect streams. 
        
        The average is computed over a rolling window defined by the implementation.

    * `AXIS_FEEDRATE` 

        feedrate of a linear axis.

    * `BATTERY_CAPACITY` 

        maximum rated charge a battery is capable of maintaining based on the battery discharging at a specified current over a specified time period.

    * `BATTERY_CHARGE` 

        value of the battery's present capacity expressed as a percentage of the battery's maximum rated capacity.

    * `CAPACITY_FLUID` 

        maximum amount of fluid that can be held by a container.

    * `CAPACITY_SPATIAL` 

        maximum amount of material that can be held by a container.

    * `CHARGE_RATE` 

        value of the current being supplied to the {{block(Component)}} for the purpose of charging.

    * `CONCENTRATION` 

        percentage of one component within a mixture of components.

    * `CONDUCTIVITY` 

        ability of a material to conduct electricity.

    * `CUTTING_SPEED` 

        speed difference (relative velocity) between the cutting mechanism and the surface of the workpiece it is operating on.

    * `DECELERATION` 

        negative rate of change of velocity.

    * `DENSITY` 

        volumetric mass of a material per unit volume of that material.

    * `DEPOSITION_ACCELERATION_VOLUMETRIC` 

        rate of change in spatial volume of material deposited in an additive manufacturing process.

    * `DEPOSITION_DENSITY` 

        density of the material deposited in an additive manufacturing process per unit of volume.

    * `DEPOSITION_MASS` 

        mass of the material deposited in an additive manufacturing process.

    * `DEPOSITION_RATE_VOLUMETRIC` 

        rate at which a spatial volume of material is deposited in an additive manufacturing process.

    * `DEPOSITION_VOLUME` 

        spatial volume of material to be deposited in an additive manufacturing process.

    * `DEW_POINT` 

        temperature at which moisture begins to condense, corresponding to saturation for a given absolute humidity.

    * `DIAMETER` 

        dimension of a diameter.

    * `DISCHARGE_RATE` 

        value of current being drawn from the {{block(Component)}}.

    * `DISPLACEMENT` 

        change in position of an object.

    * `DISPLACEMENT_ANGULAR` 

        absolute value of the change in angular position around a vector

    * `DISPLACEMENT_LINEAR` 

        absolute value of the change in position along a vector.

    * `ELECTRICAL_ENERGY` 

        {{block(Wattage)}} used or generated by a component over an interval of time.

    * `EQUIPMENT_TIMER` 

        amount of time a piece of equipment or a sub-part of a piece of equipment has performed specific activities.

    * `FILL_HEIGHT` 

        amount of a substance in a container.

    * `FILL_LEVEL` 

        amount of a substance remaining compared to the planned maximum amount of that substance.

    * `FLOW` 

        rate of flow of a fluid.

    * `FOLLOWING_ERROR` 

        difference between actual and commanded position at any specific point in time during a motion.

    * `FOLLOWING_ERROR_ANGULAR` 

        angular difference between the commanded encoder/resolver position and the actual encoder/resolver position at any specified point in time during a motion.

    * `FOLLOWING_ERROR_LINEAR` 

        difference between the commanded encoder/resolver position and the actual encoder/resolver position at any specified point in time during a motion.

    * `FREQUENCY` 

        number of occurrences of a repeating event per unit time.

    * `<<deprecated>>` `GLOBAL_POSITION` 

        position in three-dimensional space.
        
        **DEPRECATED** in Version 1.1.

    * `GRAVITATIONAL_ACCELERATION` 

        acceleration relative to Earth's gravity of 9.80665 `METER/SECOND^2`.

    * `GRAVITATIONAL_FORCE` 

        force relative to earth's gravity.

    * `HUMIDITY_ABSOLUTE` 

        amount of water vapor expressed in grams per cubic meter.

    * `HUMIDITY_RELATIVE` 

        amount of water vapor present expressed as a percent to reach saturation at the same temperature.

    * `HUMIDITY_SPECIFIC` 

        ratio of the water vapor present over the total weight of the water vapor and air present expressed as a percent.

    * `LENGTH` 

        length of an object.

    * `<<deprecated>>` `LEVEL` 

        level of a resource.
        
        **DEPRECATED** in *Version 1.2*.  See `FILL_LEVEL`.

    * `LINEAR_FORCE` 

        {{term(force)}} applied to a mass in one direction only.

    * `LOAD` 

        actual versus the standard rating of a piece of equipment.

    * `MASS` 

        mass of an object(s) or an amount of material.

    * `OBSERVATION_UPDATE_RATE` 

        average rate of change of values for data items in the MTConnect streams. The average is computed over a rolling window defined by the implementation.

    * `OPENNESS` 

        percentage open where 100% is fully open and 0% is fully closed.

    * `ORIENTATION` 

        angular position of a plane or vector relative to a {{term(cartesian coordinate system)}}

    * `PARTICLE_COUNT` 

        number of particles counted by their size or other characteristics.

    * `PARTICLE_SIZE` 

        size of particles counted by their size or other characteristics.

    * `PATH_FEEDRATE` 

        feedrate for the axes, or a single axis, associated with a {{block(Path)}} component.

    * `PATH_FEEDRATE_PER_REVOLUTION` 

        feedrate for the axes, or a single axis.

    * `PATH_POSITION` 

        position of a control point associated with a {{block(Controller)}} or a {{block(Path)}}.

    * `PH` 

        acidity or alkalinity of a solution.

    * `POSITION` 

        point along an axis in a {{term(cartesian coordinate system)}}.

    * `POSITION_CARTESIAN` 

        point in a {{term(cartesian coordinate system)}}.

    * `POWER_FACTOR` 

        ratio of real power flowing to a load to the apparent power in that AC circuit.

    * `PRESSURE` 

        force per unit area measured relative to atmospheric pressure. 
        
        Commonly referred to as gauge pressure.

    * `PRESSURE_ABSOLUTE` 

        force per unit area measured relative to a vacuum.

    * `PRESSURIZATION_RATE` 

        change of pressure per unit time.

    * `PROCESS_TIMER` 

        amount of time a piece of equipment has performed different types of activities associated with the process being performed at that piece of equipment.

    * `RESISTANCE` 

        degree to which a substance opposes the passage of an electric current.

    * `RESISTIVITY` 

        inability of a material to conduct electricity.

    * `ROTARY_VELOCITY` 

        rotational speed of a rotary axis.

    * `SETTLING_ERROR` 

        difference between actual and commanded position at the end of a motion.

    * `SETTLING_ERROR_ANGULAR` 

        angular difference between the commanded encoder/resolver position, and the actual encoder/resolver position when motion is complete.

    * `SETTLING_ERROR_LINEAR` 

        difference between the commanded encoder/resolver position, and the actual encoder/resolver position when motion is complete.

    * `SOUND_LEVEL` 

        sound level or sound pressure level relative to atmospheric pressure.

    * `<<deprecated>>` `SPINDLE_SPEED` 

        rotational speed of the rotary axis.
        
        **DEPRECATED** in *Version 1.2*.  Replaced by `ROTARY_VELOCITY`.

    * `STRAIN` 

        amount of deformation per unit length of an object when a load is applied.

    * `TEMPERATURE` 

        degree of hotness or coldness measured on a definite scale.

    * `TENSION` 

        force that stretches or elongates an object.

    * `TILT` 

        angular displacement.

    * `TORQUE` 

        turning force exerted on an object or by an object.

    * `VELOCITY` 

        rate of change of position of a {{block(Component)}}.

    * `VISCOSITY` 

        fluid's resistance to flow.

    * `<<deprecated>>` `VOLTAGE` 

        electrical potential between two points.
        
        **DEPRECATED** in *Version 1.6*. Replaced by `VOLTAGE_AC` and `VOLTAGE_DC`.

    * `VOLTAGE_AC` 

        electrical potential between two points in an electrical circuit in which the current periodically reverses direction.

    * `VOLTAGE_DC` 

        electrical potential between two points in an electrical circuit in which the current is unidirectional.

    * `VOLT_AMPERE` 

        apparent power in an electrical circuit, equal to the product of root-mean-square (RMS) voltage and RMS current (commonly referred to as VA).

    * `VOLT_AMPERE_REACTIVE` 

        reactive power in an AC electrical circuit (commonly referred to as VAR).

    * `VOLUME_FLUID` 

        fluid volume of an object or container.

    * `VOLUME_SPATIAL` 

        geometric volume of an object or container.

    * `WATTAGE` 

        power flowing through or dissipated by an electrical circuit or piece of equipment.

    * `X_DIMENSION` 

        dimension of an entity relative to the X direction of the referenced coordinate system.

    * `Y_DIMENSION` 

        dimension of an entity relative to the Y direction of the referenced coordinate system.

    * `Z_DIMENSION` 

        dimension of an entity relative to the Z direction of the referenced coordinate system.


# References Model

{{block(References)}} {{termplural(organize)}} pointers to information defined elsewhere within the {{block(MTConnectDevices)}} entity for a piece of equipment. It is an efficient method to associate information with an element without duplicating any of the data or structure.


## References

This section provides semantic information for the {{block(Reference)}} entity. {{figure(References)}} shows the {{block(Reference)}} model. 

{{block(Reference)}} may be modeled as part of a {{block(Device)}}, {{block(Component)}} or {{block(Interface)}} type.

![References](figures/References.png "References"){: width="0.8"}

> Note: See {{sect(References Schema Diagrams)}} for XML schema of {{block(Reference)}} and its types.

### Reference

pointer to information that is associated with another entity defined elsewhere in the {{block(MTConnectDevices)}} entity for a piece of equipment.


{{block(Reference)}} is an abstract entity and will be realized by a specific {{block(Reference)}} type for an {{block(MTConnectDevices)}} entity. See {{sect(ComponentRef)}} and {{sect(DataItemRef)}}.


#### Value Properties of Reference

{{tbl(value-properties-of-reference)}} lists the Value Properties of {{block(Reference)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(idRef)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
{: caption="Value Properties of Reference" label="table:value-properties-of-reference"}

Descriptions for Value Properties of {{block(Reference)}}:

* {{property(idRef)}} 

    pointer to the `id` of an entity that contains the information to be associated with this entity.

* {{property(name)}} 

     name of an element or a piece of equipment.

### DataItemRef

{{block(Reference)}} that is a pointer to a {{block(DataItem)}} associated with another entity defined for a piece of equipment.


{{block(DataItemRef)}} allows the data associated with a {{block(DataItem)}} defined in another entity to be directly associated with this entity.


### ComponentRef

{{block(Reference)}} that is a pointer to all of the information associated with another entity defined for a piece of equipment.



{{block(ComponentRef)}} allows all of the information of ({{term(lower level)}} {{block(Component)}} entities that is associated with the other entity to be directly associated with this entity.



# Configurations Model

This section provides semantic information for the {{block(Configuration)}} entity that is used to model technical information about a {{block(Component)}}. 


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
|{{block(ImageFile)}} (organized by `ImageFiles`)|0..*|
|{{block(PowerSource)}} (organized by `PowerSources`)|0..*|
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

* {{block(ImageFile)}} 

    reference to a file containing an image of the {{block(Component)}}.

    {{block(ImageFiles)}} groups one or more {{block(ImageFile)}} entities. See {{package(ImageFiles)}}.

* {{block(PowerSource)}} 

    potential energy sources for the {{block(Component)}}.

    {{block(PowerSources)}} groups one or more {{block(PowerSource)}} entities. See {{package(PowerSources)}}.



## CoordinateSystems

This section provides semantic information for the {{block(CoordinateSystem)}} entity.

![CoordinateSystem](figures/CoordinateSystem.png "CoordinateSystem"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![CoordinateSystem Example](figures/CoordinateSystem%20Example.png "CoordinateSystem Example"){: width="0.8"}

> Note: See {{lst(coordinatesystem-example)}} for the {{term(XML)}} representation of the same example.

### CoordinateSystem

reference system that associates a unique set of n parameters with each point in an n-dimensional space. {{cite(ISO 10303-218:2004)}}


At most only one of {{block(Origin)}} or {{block(Transformation)}} **MUST** be defined for a {{block(CoordinateSystem)}}.


#### Value Properties of CoordinateSystem

{{tbl(value-properties-of-coordinatesystem)}} lists the Value Properties of {{block(CoordinateSystem)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(id)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
|{{property(nativeName)}}|`string`|0..1|
|{{property(parentIdRef)}}|`ID`|0..1|
|{{property(type)}}|`CoordinateSystemTypeEnum`|1|
|{{property(uuid)}}|`UUID`|0..1|
|{{property(Description)}}|`string`|0..1|
{: caption="Value Properties of CoordinateSystem" label="table:value-properties-of-coordinatesystem"}

Descriptions for Value Properties of {{block(CoordinateSystem)}}:

* {{property(id)}} 

    unique identifier for the coordinate system.

* {{property(name)}} 

    name of the coordinate system.

* {{property(nativeName)}} 

    manufacturer's name or users name for the coordinate system.

* {{property(parentIdRef)}} 

    pointer to the {{property(CoordinateSystem::id)}}.

* {{property(type)}} 

    type of coordinate system.

    `CoordinateSystemTypeEnum` Enumeration:

    * `BASE` 

        coordinate system referenced to the base mounting surface. {{cite(ISO 9787:2013)}}
        
        A base mounting surface is a connection surface between the arm and its supporting structure.{{cite(ISO 9787:2013)}}
        
        For non-robotic devices, it is the connection surface between the device and its supporting structure.

    * `CAMERA` 

        coordinate system referenced to the sensor which monitors the site of the task. {{cite(ISO 9787:2013)}}

    * `MACHINE` 

        coordinate system referenced to the home position and orientation of the primary axes of a piece of equipment.

    * `MECHANICAL_INTERFACE` 

        coordinate system referenced to the mechanical interface. {{cite(ISO 9787:2013)}}

    * `MOBILE_PLATFORM` 

        coordinate system referenced to one of the components of a mobile platform. {{cite(ISO 8373:2012)}}

    * `OBJECT` 

        coordinate system referenced to the object. {{cite(ISO 9787:2013)}}

    * `TASK` 

        coordinate system referenced to the site of the task. {{cite(ISO 9787:2013)}}

    * `TOOL` 

        coordinate system referenced to the tool or to the end effector attached to the mechanical interface. {{cite(ISO 9787:2013)}}

    * `WORLD` 

        stationary coordinate system referenced to earth, which is independent of the robot motion. {{cite(ISO 9787:2013)}}
        
        For non-robotic devices, stationary coordinate system referenced to earth, which is independent of the motion of a piece of equipment.

* {{property(uuid)}} 

    {{term(UUID)}} for the coordinate system.

* {{property(Description)}} 

    natural language description of the {{block(CoordinateSystem)}}.

#### Part Properties of CoordinateSystem

{{tbl(part-properties-of-coordinatesystem)}} lists the Part Properties of {{block(CoordinateSystem)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Origin)}}|0..1|
|{{block(Transformation)}}|0..1|
{: caption="Part Properties of CoordinateSystem" label="table:part-properties-of-coordinatesystem"}

Descriptions for Part Properties of {{block(CoordinateSystem)}}:

* {{block(Origin)}} 

    coordinates of the origin position of a coordinate system.

    See {{sect(Origin)}}.

* {{block(Transformation)}} 

    process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.

    See {{sect(Transformation)}}.

### Origin

coordinates of the origin position of a coordinate system.



#### Part Properties of Origin

{{tbl(part-properties-of-origin)}} lists the Part Properties of {{block(Origin)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(value)}}|0..1|
{: caption="Part Properties of Origin" label="table:part-properties-of-origin"}

Descriptions for Part Properties of {{block(Origin)}}:

* {{block(OriginDataSet)}} 

    x-coordinate.

### Transformation

process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.


At a minimum, a {{block(Translation)}} or a {{block(Rotation)}} **MUST** be defined for a {{block(Transformation)}}.


#### Part Properties of Transformation

{{tbl(part-properties-of-transformation)}} lists the Part Properties of {{block(Transformation)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Translation)}}|0..1|
|{{block(Rotation)}}|0..1|
{: caption="Part Properties of Transformation" label="table:part-properties-of-transformation"}

Descriptions for Part Properties of {{block(Transformation)}}:

* {{block(Translation)}} 

    translations along X, Y, and Z axes are expressed as x,y, and z respectively within a 3-dimensional vector. 

    See {{sect(Translation)}}.

* {{block(Rotation)}} 

    rotations about X, Y, and Z axes are expressed in A, B, and C respectively within a 3-dimensional vector. 
    

    See {{sect(Rotation)}}.

### Rotation

rotations about X, Y, and Z axes are expressed in A, B, and C respectively within a 3-dimensional vector. 




#### Part Properties of Rotation

{{tbl(part-properties-of-rotation)}} lists the Part Properties of {{block(Rotation)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(value)}}|0..1|
{: caption="Part Properties of Rotation" label="table:part-properties-of-rotation"}

Descriptions for Part Properties of {{block(Rotation)}}:

* {{block(RotationDataSet)}} 

    rotation about X axis.

### Translation

translations along X, Y, and Z axes are expressed as x,y, and z respectively within a 3-dimensional vector. 



#### Part Properties of Translation

{{tbl(part-properties-of-translation)}} lists the Part Properties of {{block(Translation)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(value)}}|0..1|
{: caption="Part Properties of Translation" label="table:part-properties-of-translation"}

Descriptions for Part Properties of {{block(Translation)}}:

* {{block(TranslationDataSet)}} 

    translation along X axis.



## Motion

This section provides semantic information for the {{block(Motion)}} entity.

![Motion](figures/Motion.png "Motion"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![Motion Example](figures/Motion%20Example.png "Motion Example"){: width="0.8"}

> Note: See {{lst(motion-example)}} for the {{term(XML)}} representation of the same example.

### Motion

movement of the component relative to a coordinate system. 


{{block(Motion)}} specifies the kinematic chain of the {{block(component)}} entities.

At most only one of {{block(Origin)}} or {{block(Transformation)}} **MUST** be defined for a {{block(Motion)}}.


#### Value Properties of Motion

{{tbl(value-properties-of-motion)}} lists the Value Properties of {{block(Motion)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(actuation)}}|`MotionActuationTypeEnum`|1|
|{{property(coordinateSystemIdRef)}}|`ID`|1|
|{{property(id)}}|`ID`|1|
|{{property(parentIdRef)}}|`ID`|0..1|
|{{property(type)}}|`MotionTypeEnum`|1|
{: caption="Value Properties of Motion" label="table:value-properties-of-motion"}

Descriptions for Value Properties of {{block(Motion)}}:

* {{property(actuation)}} 

    describes if this component is actuated directly or indirectly as a result of other motion.

    `MotionActuationTypeEnum` Enumeration:

    * `DIRECT` 

        movement is initiated by the component.

    * `NONE` 

        no actuation of this axis.
        
        > Note: Actuation of `NONE` can be either a derived `REVOLUTE` or `PRISMATIC` motion or static `FIXED` relationship.

    * `VIRTUAL` 

        motion is computed and is used for expressing an imaginary movement.

* {{property(coordinateSystemIdRef)}} 

    coordinate system within which the kinematic motion occurs.

* {{property(id)}} 

    unique identifier for this element.

* {{property(parentIdRef)}} 

    pointer to the {{property(Motion::id)}}.
    
    The kinematic chain connects all components using the parent relations. All motion is connected to the motion of the parent. The first node in the chain will not have a parent.

* {{property(type)}} 

    type of motion.

    `MotionTypeEnum` Enumeration:

    * `CONTINUOUS` 

        revolves around an axis with a continuous range of motion.

    * `FIXED` 

        axis does not move.

    * `PRISMATIC` 

        sliding linear motion along an axis with a fixed range of motion.

    * `REVOLUTE` 

        rotates around an axis with a fixed range of motion.

#### Part Properties of Motion

{{tbl(part-properties-of-motion)}} lists the Part Properties of {{block(Motion)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Axis)}}|0..1|
|{{block(Origin)}}|0..1|
|{{block(Transformation)}}|0..1|
{: caption="Part Properties of Motion" label="table:part-properties-of-motion"}

Descriptions for Part Properties of {{block(Motion)}}:

* {{block(Axis)}} 

    axis along or around which the {{block(Component)}} moves relative to a coordinate system.

    See {{sect(Axis)}}.

* {{block(Origin)}} 

    coordinates of the origin position of a coordinate system.

    See {{sect(Origin)}}.

* {{block(Transformation)}} 

    process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.

    See {{sect(Transformation)}}.

### Axis

axis along or around which the {{block(Component)}} moves relative to a coordinate system.



#### Part Properties of Axis

{{tbl(part-properties-of-axis)}} lists the Part Properties of {{block(Axis)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(value)}}|0..1|
{: caption="Part Properties of Axis" label="table:part-properties-of-axis"}

Descriptions for Part Properties of {{block(Axis)}}:

* {{block(AxisDataSet)}} 

    x-component of {{block(Axis)}}.



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
|{{property(deviceUuidRef)}}|`UUID`|1|
|{{property(href)}}|`xlinkhref`|0..1|
|{{property(role)}}|`RoleTypeEnum`|0..1|
|{{property(xlink:type)}}|`xlinktype`|0..1|
{: caption="Value Properties of DeviceRelationship" label="table:value-properties-of-devicerelationship"}

Descriptions for Value Properties of {{block(DeviceRelationship)}}:

* {{property(deviceUuidRef)}} 

    reference to the {{property(Device::uuid)}} of the associated piece of equipment.

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



## Sensor

This section provides semantic information for the {{block(SensorConfiguration)}} entity.

{{term(sensor)}} is a unique type of a piece of equipment.  A {{term(sensor)}} is typically comprised of two major components: a {{term(sensor unit)}} that provides signal processing, conversion, and communications and the {{termplural(sensing element)}} that provides a signal or measured value.

The {{term(sensor unit)}} is modeled as a {{term(lower level)}} {{block(Component)}} called {{block(Sensor)}}.  The {{term(sensing element)}} may be modeled as a {{block(Composition)}} element of a {{block(Sensor)}} element and the measured value would be modeled as a {{block(DataItem)}} (See {{sect(DataItems)}} for more information on {{block(DataItem)}} elements).  Each {{term(sensor unit)}} may have multiple {{termplural(sensing element)}}; each representing the data for a variety of measured values.

![Sensing Element provided as a DataItem Example](figures/Sensing%20Element%20provided%20as%20a%20DataItem%20Example.png "Sensing Element provided as a DataItem Example"){: width="0.8"}

> Note: See {{lst(example-of-sensing-element-provided-as-data-item-associated-with-a-component)}} for an {{term(XML)}} example.

When a {{term(sensor unit)}} is modeled as a {{block(Component)}} or as a separate piece of equipment, it may provide additional configuration information for the {{termplural(sensor element)}} and the {{term(sensor unit)}} itself.  

![Sensor for Rotary Axis Example](figures/Sensor%20for%20Rotary%20Axis%20Example.png "Sensor for Rotary Axis Example"){: width="0.8"}

> Note: If a {{block(Sensor)}} provides vibration measurement data for the spindle on a piece of equipment, it could be modeled as a {{block(Sensor)}} for rotary axis named `C`. See {{lst(example-of-sensor-for-rotary-axis)}} for an {{term(XML)}} example.

![Sensor unit with Sensing Elements Example](figures/Sensor%20unit%20with%20Sensing%20Elements%20Example.png "Sensor unit with Sensing Elements Example"){: width="0.8"}

> Note: If a {{block(Sensor)}} provides measurement data for multiple {{block(Component)}} elements within a piece of equipment and is not associated with any particular {{block(Component)}}, it **MAY** be modeled as an independent {{block(Component)}} and the data associated with measurements are associated with their associated {{block(Component)}} entities. See {{lst(example-of-sensor-unit-with-sensing-element)}} for an {{term(XML)}} example.

{{block(Configuration)}} data provides information required for maintenance and support of the sensor.

When {{block(Sensor)}} represents the {{term(sensor unit)}} for multiple {{term(sensing element)}}(s), each sensing element is represented by a {{block(Channel)}}.   The {{term(sensor unit)}} itself and each {{block(Channel)}} representing one {{term(sensing element)}} **MAY** have its own configuration data.

![Sensor Configuration Example](figures/Sensor%20Configuration%20Example.png "Sensor Configuration Example"){: width="0.8"}

> Note: See {{lst(example-of-configuration-data-for-sensor)}} for an {{term(XML)}} example.


### SensorConfiguration

configuration for a {{block(Sensor)}}.


![SensorConfiguration](figures/SensorConfiguration.png "SensorConfiguration"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.


#### Value Properties of SensorConfiguration

{{tbl(value-properties-of-sensorconfiguration)}} lists the Value Properties of {{block(SensorConfiguration)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(CalibrationDate)}}|`datetime`|0..1|
|{{property(CalibrationInitials)}}|`string`|0..1|
|{{property(FirmwareVersion)}}|`string`|1|
|{{property(NextCalibrationDate)}}|`datetime`|0..1|
{: caption="Value Properties of SensorConfiguration" label="table:value-properties-of-sensorconfiguration"}

Descriptions for Value Properties of {{block(SensorConfiguration)}}:

* {{property(CalibrationDate)}} 

    Date upon which the {{term(sensor unit)}} was last calibrated.

* {{property(CalibrationInitials)}} 

    The initials of the person verifying the validity of the calibration data.

* {{property(FirmwareVersion)}} 

    Version number for the sensor unit as specified by the manufacturer.

* {{property(NextCalibrationDate)}} 

    Date upon which the {{term(sensor unit)}} is next scheduled to be calibrated.

#### Part Properties of SensorConfiguration

{{tbl(part-properties-of-sensorconfiguration)}} lists the Part Properties of {{block(SensorConfiguration)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Channel)}} (organized by `Channels`)|0..*|
{: caption="Part Properties of SensorConfiguration" label="table:part-properties-of-sensorconfiguration"}

Descriptions for Part Properties of {{block(SensorConfiguration)}}:

* {{block(Channel)}} 

    {{term(sensing element)}} of a {{block(Sensor)}}.

    {{block(Channels)}} groups one or more {{block(Channel)}} entities. See {{block(Channel)}}.

### Channel

{{term(sensing element)}} of a {{block(Sensor)}}.


When {{block(Sensor)}} has multiple {{termplural(sensing element)}}, each {{term(sensing element)}} is modeled as a {{block(Channel)}} for the {{block(Sensor)}}. 


#### Value Properties of Channel

{{tbl(value-properties-of-channel)}} lists the Value Properties of {{block(Channel)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(CalibrationDate)}}|`datetime`|0..1|
|{{property(CalibrationInitials)}}|`string`|0..1|
|{{property(name)}}|`string`|0..1|
|{{property(NextCalibrationDate)}}|`datetime`|0..1|
|{{property(number)}}|`string`|1|
{: caption="Value Properties of Channel" label="table:value-properties-of-channel"}

Descriptions for Value Properties of {{block(Channel)}}:

* {{property(CalibrationDate)}} 

    Date upon which the {{term(sensor unit)}} was last calibrated to the {{term(sensor element)}}.

* {{property(CalibrationInitials)}} 

    The initials of the person verifying the validity of the calibration data.

* {{property(name)}} 

    name of the specific {{term(sensing element)}}.

* {{property(NextCalibrationDate)}} 

    Date upon which the {{term(sensor element)}} is next scheduled to be calibrated with the {{term(sensor unit)}}.

* {{property(number)}} 

    unique identifier that will only refer to a specific {{term(sensing element)}}.



## SolidModel

This section provides semantic information for the {{block(SolidModel)}} entity.

![SolidModel](figures/SolidModel.png "SolidModel"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![SolidModel Example](figures/SolidModel%20Example.png "SolidModel Example"){: width="0.8"}

> Note: See {{lst(solidmodel-example)}} for the {{term(XML)}} representation of the same example.

### SolidModel

references to a file with the three-dimensional geometry of the {{block(Component)}} or {{block(Composition)}}.


The geometry **MAY** have a transformation and a scale to position the {{block(Component)}} with respect to the other {{block(Component)}}s. A geometry file can contain a set of assembled items, in this case, the {{block(SolidModel)}} references the {{property(SolidModel::id)}} of the assembly model file and the specific item within that file.

The {{block(SolidModel)}} **MAY** provide a translation, rotation, and scale to correctly place it relative to the other geometries in the machine. If the {{block(Component)}} can move and has a {{block(Motion)}} {{block(Configuration)}}, the {{block(SolidModel)}} will move when the {{block(Component)}} or {{block(Composition)}} moves.

Either an {{property(SolidModel::href)}} or a {{property(SolidModel::modelIdRef)}} and an {{property(SolidModel::itemRef)}} **MUST** be specified.


#### Value Properties of SolidModel

{{tbl(value-properties-of-solidmodel)}} lists the Value Properties of {{block(SolidModel)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(id)}}|`ID`|1|
|{{property(solidModelIdRef)}}|`ID`|0..1|
|{{property(href)}}|`string`|0..1|
|{{property(itemRef)}}|`string`|0..1|
|{{property(mediaType)}}|`MediaTypeEnum`|1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
|{{property(nativeUnits)}}|`NativeUnitEnum`|0..1|
|{{property(units)}}|`UnitEnum`|0..1|
{: caption="Value Properties of SolidModel" label="table:value-properties-of-solidmodel"}

Descriptions for Value Properties of {{block(SolidModel)}}:

* {{property(id)}} 

    unique identifier for this element.

* {{property(solidModelIdRef)}} 

    associated model file if an item reference is used.

* {{property(href)}} 

    {{term(URL)}} giving the location of the {{block(SolidModel)}}. 
    
    If not present, the model referenced in the {{property(SolidModel::solidModelIdRef)}} is used.
    
    {{property(SolidModel::href)}} is of type `xlink:href` from the W3C XLink specification.

* {{property(itemRef)}} 

    reference to the item within the model within the related geometry. A {{property(SolidModel::solidModelIdRef)}} **MUST** be given. 
    
    > Note: `Item` defined in ASME Y14.100 - A nonspecific term used to denote any unit or product, including materials, parts, assemblies, equipment, accessories, and computer software.

* {{property(mediaType)}} 

    format of the referenced document.

    `MediaTypeEnum` Enumeration:

    * `3DS` 

        Autodesk file format.

    * `ACIS` 

        Dassault file format.

    * `COLLADA` 

        ISO 17506.

    * `GDML` 

        Geometry Description Markup Language.

    * `IGES` 

        Initial Graphics Exchange Specification.

    * `OBJ` 

        Wavefront OBJ file format.

    * `STEP` 

        ISO 10303 STEP AP203 or AP242 format.

    * `STL` 

        STereoLithography file format.

    * `X_T` 

        Parasolid XT Siemens data interchange format.

* {{property(coordinateSystemIdRef)}} 

    reference to the coordinate system for this {{block(SolidModel)}}.

* {{property(nativeUnits)}} 

    same as {{property(DataItem::nativeUnits)}}. See {{sect(DataItem)}}.

    The value of {{property(nativeUnits)}} **MUST** be one of the `NativeUnitEnum` enumeration. 

* {{property(units)}} 

    same as {{property(DataItem::units)}}. See {{sect(DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

#### Part Properties of SolidModel

{{tbl(part-properties-of-solidmodel)}} lists the Part Properties of {{block(SolidModel)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Transformation)}}|0..1|
|{{block(Scale)}}|0..1|
{: caption="Part Properties of SolidModel" label="table:part-properties-of-solidmodel"}

Descriptions for Part Properties of {{block(SolidModel)}}:

* {{block(Transformation)}} 

    process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.

    See {{sect(Transformation)}}.

* {{block(Scale)}} 

    either a single multiplier applied to all three dimensions or a three space multiplier given in the X, Y, and Z dimensions in the coordinate system used for the {{block(SolidModel)}}.

    See {{sect(Scale)}}.

### Scale

either a single multiplier applied to all three dimensions or a three space multiplier given in the X, Y, and Z dimensions in the coordinate system used for the {{block(SolidModel)}}.



#### Part Properties of Scale

{{tbl(part-properties-of-scale)}} lists the Part Properties of {{block(Scale)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(value)}}|0..1|
{: caption="Part Properties of Scale" label="table:part-properties-of-scale"}

Descriptions for Part Properties of {{block(Scale)}}:

* {{block(ScaleDataSet)}} 

    multiplier for X axis.



## Specifications

This section provides semantic information for the {{block(Specification)}} entity.

![Specifications](figures/Specifications.png "Specifications"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![Specification Example](figures/Specification%20Example.png "Specification Example"){: width="0.8"}

> Note: See {{lst(specification-example)}} for the {{term(XML)}} representation of the same example.

### Specification

design characteristics for a piece of equipment.



#### Value Properties of Specification

{{tbl(value-properties-of-specification)}} lists the Value Properties of {{block(Specification)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`DataItemTypeEnum`|1|
|{{property(subType)}}|`DataItemSubTypeEnum`|0..1|
|{{property(dataItemIdRef)}}|`ID`|0..1|
|{{property(units)}}|`UnitEnum`|0..1|
|{{property(compositionIdRef)}}|`ID`|0..1|
|{{property(name)}}|`string`|0..1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
|{{property(id)}}|`ID`|0..1|
|{{property(originator)}}|`OriginatorEnum`|1|
{: caption="Value Properties of Specification" label="table:value-properties-of-specification"}

Descriptions for Value Properties of {{block(Specification)}}:

* {{property(type)}} 

    same as {{property(DataItem::type)}}. See {{package(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(subType)}} 

    same as {{property(DataItem::subType)}}. See {{sect(DataItem)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(dataItemIdRef)}} 

    reference to the {{property(DataItem::id)}} associated with this entity.

* {{property(units)}} 

    same as {{property(DataItem::units)}}. See {{sect(DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(compositionIdRef)}} 

    reference to the {{property(Composition::id)}} associated with this entity.

* {{property(name)}} 

    {{property(Specification::name)}} provides additional meaning and differentiates between {{block(Specification)}} entities.

* {{property(coordinateSystemIdRef)}} 

    references the {{block(CoordinateSystem)}} for geometric {{block(Specification)}} elements.

* {{property(id)}} 

    unique identifier for this {{block(Specification)}}.

* {{property(originator)}} 

    reference to the creator of the {{block(Specification)}}.

    `OriginatorEnum` Enumeration:

    * `MANUFACTURER` 

        manufacturer of a piece of equipment or {{block(Component)}}.

    * `USER` 

        owner or implementer of a piece of equipment or {{block(Component)}}.

#### Part Properties of Specification

{{tbl(part-properties-of-specification)}} lists the Part Properties of {{block(Specification)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Maximum)}}|0..1|
|{{block(UpperLimit)}}|0..1|
|{{block(LowerWarning)}}|0..1|
|{{block(LowerLimit)}}|0..1|
|{{block(UpperWarning)}}|0..1|
|{{block(Nominal)}}|0..1|
|{{block(Minimum)}}|0..1|
{: caption="Part Properties of Specification" label="table:part-properties-of-specification"}

Descriptions for Part Properties of {{block(Specification)}}:

* {{block(Maximum)}} 

    numeric upper constraint.

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(LowerWarning)}} 

    lower boundary indicating increased concern and supervision may be required.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(UpperWarning)}} 

    upper boundary indicating increased concern and supervision may be required.

* {{block(Nominal)}} 

    numeric target or expected value.

* {{block(Minimum)}} 

    numeric lower constraint.

### ProcessSpecification

{{block(Specification)}} that provides information used to assess the conformance of a variable to process requirements.



#### Part Properties of ProcessSpecification

{{tbl(part-properties-of-processspecification)}} lists the Part Properties of {{block(ProcessSpecification)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(SpecificationLimits)}}|0..1|
|{{block(ControlLimits)}}|0..1|
|{{block(AlarmLimits)}}|0..1|
{: caption="Part Properties of ProcessSpecification" label="table:part-properties-of-processspecification"}

Descriptions for Part Properties of {{block(ProcessSpecification)}}:

* {{block(SpecificationLimits)}} 

    set of limits that define a range of values designating acceptable performance for a variable.

    See {{sect(SpecificationLimits)}}.

* {{block(ControlLimits)}} 

    set of limits that is used to indicate whether a process variable is stable and in control.

    See {{sect(ControlLimits)}}.

* {{block(AlarmLimits)}} 

    set of limits that is used to trigger warning or alarm indicators.

    See {{sect(AlarmLimits)}}.

### ControlLimits

set of limits that is used to indicate whether a process variable is stable and in control.



#### Part Properties of ControlLimits

{{tbl(part-properties-of-controllimits)}} lists the Part Properties of {{block(ControlLimits)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(UpperLimit)}}|0..1|
|{{block(UpperWarning)}}|0..1|
|{{block(LowerWarning)}}|0..1|
|{{block(Nominal)}}|0..1|
|{{block(LowerLimit)}}|0..1|
{: caption="Part Properties of ControlLimits" label="table:part-properties-of-controllimits"}

Descriptions for Part Properties of {{block(ControlLimits)}}:

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(UpperWarning)}} 

    upper boundary indicating increased concern and supervision may be required.

* {{block(LowerWarning)}} 

    lower boundary indicating increased concern and supervision may be required.

* {{block(Nominal)}} 

    numeric target or expected value.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

### AlarmLimits

set of limits that is used to trigger warning or alarm indicators.



#### Part Properties of AlarmLimits

{{tbl(part-properties-of-alarmlimits)}} lists the Part Properties of {{block(AlarmLimits)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(UpperLimit)}}|0..1|
|{{block(UpperWarning)}}|0..1|
|{{block(LowerLimit)}}|0..1|
|{{block(LowerWarning)}}|0..1|
{: caption="Part Properties of AlarmLimits" label="table:part-properties-of-alarmlimits"}

Descriptions for Part Properties of {{block(AlarmLimits)}}:

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(UpperWarning)}} 

    upper boundary indicating increased concern and supervision may be required.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(LowerWarning)}} 

    lower boundary indicating increased concern and supervision may be required.

### SpecificationLimits

set of limits that define a range of values designating acceptable performance for a variable.



#### Part Properties of SpecificationLimits

{{tbl(part-properties-of-specificationlimits)}} lists the Part Properties of {{block(SpecificationLimits)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(UpperLimit)}}|0..1|
|{{block(Nominal)}}|0..1|
|{{block(LowerLimit)}}|0..1|
{: caption="Part Properties of SpecificationLimits" label="table:part-properties-of-specificationlimits"}

Descriptions for Part Properties of {{block(SpecificationLimits)}}:

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(Nominal)}} 

    numeric target or expected value.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

### UpperWarning

upper boundary indicating increased concern and supervision may be required.



The value of {{property(UpperWarning)}} **MUST** be `float`.

### UpperLimit

upper conformance boundary for a variable.

> Note: immediate concern or action may be required.



The value of {{property(UpperLimit)}} **MUST** be `float`.

### Maximum

numeric upper constraint.



The value of {{property(Maximum)}} **MUST** be `float`.

### LowerLimit

lower conformance boundary for a variable.

> Note: immediate concern or action may be required.



The value of {{property(LowerLimit)}} **MUST** be `float`.

### LowerWarning

lower boundary indicating increased concern and supervision may be required.



The value of {{property(LowerWarning)}} **MUST** be `float`.

### Minimum

numeric lower constraint.



The value of {{property(Minimum)}} **MUST** be `float`.

### Nominal

numeric target or expected value.



The value of {{property(Nominal)}} **MUST** be `float`.



## ImageFiles

This section provides semantic information for the {{block(ImageFile)}} entity.

### ImageFile

reference to a file containing an image of the {{block(Component)}}.



#### Value Properties of ImageFile

{{tbl(value-properties-of-imagefile)}} lists the Value Properties of {{block(ImageFile)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(id)}}|`ID`|1|
|{{property(href)}}|`string`|1|
|{{property(mediaType)}}|`string`|1|
|{{property(name)}}|`string`|0..1|
{: caption="Value Properties of ImageFile" label="table:value-properties-of-imagefile"}

Descriptions for Value Properties of {{block(ImageFile)}}:

* {{property(id)}} 

    unique identifier of the image file.

* {{property(href)}} 

    {{term(URL)}} giving the location of the image file.

* {{property(mediaType)}} 

    mime type of the image file.

* {{property(name)}} 

    description of the image file.



## PowerSources

This section provides semantic information for the {{block(PowerSource)}} entity.

![PowerSources](figures/PowerSources.png "PowerSources"){: width="0.8"}



### PowerSource

potential energy sources for the {{block(Component)}}.



The value of {{property(PowerSource)}} **MUST** be `string`.

#### Value Properties of PowerSource

{{tbl(value-properties-of-powersource)}} lists the Value Properties of {{block(PowerSource)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`PowerSourceTypeEnum`|1|
|{{property(id)}}|`ID`|1|
|{{property(componentIdRef)}}|`ID`|0..1|
|{{property(order)}}|`integer`|0..1|
{: caption="Value Properties of PowerSource" label="table:value-properties-of-powersource"}

Descriptions for Value Properties of {{block(PowerSource)}}:

* {{property(type)}} 

    type of the power source.

    `<<extensible>>` `PowerSourceTypeEnum` Enumeration:

    * `PRIMARY` 

        main or principle.

    * `SECONDARY` 

        alternate or not primary.

    * `STANDBY` 

        held near at hand and ready for use and is uninterruptible.

* {{property(id)}} 

    unique identifier for the power source.

* {{property(componentIdRef)}} 

    reference to the {{block(Component)}} providing observations about the power source.

* {{property(order)}} 

    optional precedence for a given power source.




# Profile

MTConnect Profile is a {{term(profile)}} that extends the {{term(SysML)}} metamodel for the MTConnect domain using additional data types and {{termplural(stereotype)}}.

## DataTypes

![DataTypes](figures/DataTypes.png "DataTypes")

### boolean

primitive type.



### ID

string that represents an {{term(ID)}}.



### string

primitive type.



### float

primitive type.



### datetime

string that represents timestamp in ISO 8601 format.



### integer

primitive type.



### xlinktype

string that represents the type of an XLink element. See {{url(https://www.w3.org/TR/xlink11/)}}.



### xslang

string that represents a language tag. See {{url(http://www.ietf.org/rfc/rfc4646.txt)}}.



### SECOND

float that represents time in seconds.



### xlinkhref

string that represents the locator attribute of an XLink element. See {{url(https://www.w3.org/TR/xlink11/)}}.



### x509

string that represents an `x509` data block. {{cite(ISO/IEC 9594-8:2020)}}.



### int32

32-bit integer.



### int64

64-bit integer.



### version

series of three numeric values, separated by a decimal point, representing a {{term(major)}}, {{term(minor)}}, and {{term(patch)}} number of the MTConnect Standard.



### uint32

32-bit unsigned integer.



### uint64

64-bit unsigned integer.



### binary

base-2 numeral system or binary numeral system represented by two digits: "0" and "1".



### double

primitive type.



### Array

array.



### `<<hasFormatSpecificRepresentation>>`float3d

array of size 3 and datatype float.



### UUID

Universally Unique IDentifier. {{cite(IETF:RFC-4122)}}



### METER

float that represents measurement in meter.



## Stereotypes

![Stereotypes](figures/Stereotypes.png "Stereotypes")

### organizer

element that {{termplural(organize)}} other elements of a type.



### deprecated

element that has been deprecated.



### extensible

enumeration that can be extended.



### informative

element that is descriptive and non-normative.



### normative

element that has been added to the standard.



### observes

association in which a {{term(Component)}} makes {{termplural(Observation)}} about an observable {{term(DataItem)}}.



### satisfiedBy





### hasFormatSpecificRepresentation

element that has format specific representation that might be different from the element's SysML representation.



### valueType

extends `Class`to be used as a SysML `<<ValueType>>`.



### isArray

datatype that is an array.



### MTConnectRequirementSpecification

MTConnect Requirement.




{{appendix()}}
{{section*{Appendices}()}}
{{addcontentsline{toc}{section}{Appendices}()}}
{{renewcommand{\thesubsection}{\Alph{subsection}}()}}

## Bibliography

Engineering Industries Association. EIA Standard - EIA-274-D, Interchangeable Variable, Block Data Format for Positioning, Contouring, and Contouring/Positioning Numerically Controlled Machines. Washington, D.C. 1979.

ISO TC 184/SC4/WG3 N1089. ISO/DIS 10303-238: Industrial automation systems and integration  Product data representation and exchange  Part 238: Application Protocols: Application interpreted model for computerized numerical controllers. Geneva, Switzerland, 2004.

International Organization for Standardization. ISO 14649: Industrial automation systems and integration – Physical device control – Data model for computerized numerical controllers – Part 10: General process data. Geneva, Switzerland, 2004.

International Organization for Standardization. ISO 14649: Industrial automation systems and integration – Physical device control – Data model for computerized numerical controllers – Part 11: Process data for milling. Geneva, Switzerland, 2000.

International Organization for Standardization. ISO 6983/1 – Numerical Control of machines – Program format and definition of address words – Part 1: Data format for positioning, line and contouring control systems. Geneva, Switzerland, 1982.

Electronic Industries Association. ANSI/EIA-494-B-1992, 32 Bit Binary CL (BCL) and 7 Bit ASCII CL (ACL) Exchange Input Format for Numerically Controlled Machines. Washington, D.C. 1992.

National Aerospace Standard. Uniform Cutting Tests - NAS Series: Metal Cutting Equipment Specifications. Washington, D.C. 1969.

International Organization for Standardization. ISO 10303-11: 1994, Industrial automation systems and integration  Product data representation and exchange  Part 11: Description methods: The EXPRESS language reference manual. Geneva, Switzerland, 1994.

International Organization for Standardization. ISO 10303-21: 1996, Industrial automation systems and integration -- Product data representation and exchange -- Part 21: Implementation methods: Clear text encoding of the exchange structure. Geneva, Switzerland, 1996.

H.L. Horton, F.D. Jones, and E. Oberg. Machinery's Handbook. Industrial Press, Inc. New York, 1984.

International Organization for Standardization. ISO 841-2001: Industrial automation systems and integration - Numerical control of machines - Coordinate systems and motion nomenclature. Geneva, Switzerland, 2001.

ASME B5.57: Methods for Performance Evaluation of Computer Numerically Controlled Lathes and Turning Centers, 1998.

ASME/ANSI B5.54: Methods for Performance Evaluation of Computer Numerically Controlled Machining Centers. 2005.

OPC Foundation. OPC Unified Architecture Specification, Part 1: Concepts Version 1.00. July 28, 2006.

IEEE STD 1451.0-2007, Standard for a Smart Transducer Interface for Sensors and Actuators – Common Functions, Communication Protocols, and Transducer Electronic Data Sheet (TEDS) Formats, IEEE Instrumentation and Measurement Society, TC-9, The Institute of Electrical and Electronics Engineers, Inc., New York, N.Y. 10016, SH99684, October 5, 2007.

IEEE STD 1451.4-1994, Standard for a Smart Transducer Interface for Sensors and Actuators – Mixed-Mode Communication Protocols and Transducer Electronic Data Sheet (TEDS) Formats, IEEE Instrumentation and Measurement Society, TC-9, The Institute of Electrical and Electronics Engineers, Inc., New York, N.Y. 10016, SH95225, December 15, 2004. {{newpage()}} 

## XML Schema Diagrams

See XML schemas for the MTConnect standard here: {{url(https://schemas.mtconnect.org/)}}.

### Components Schema Diagrams

See `Components` element in `MTConnectDevices` schema.

See `Description` element in `MTConnectDevices` schema.

### DataItems Schema Diagrams

See `DataItems` element in `MTConnectDevices` schema.

See `Source` element in `MTConnectDevices` schema.

See `Constraints` element in `MTConnectDevices` schema.

See `Filter` element in `MTConnectDevices` schema.

See `Definition` element in `MTConnectDevices` schema.

### References Schema Diagrams

See `References` element in `MTConnectDevices` schema.

See `ComponentRef` element in `MTConnectDevices` schema.

See `DataItemRef` element in `MTConnectDevices` schema.

### Configuration Schema Diagrams

See `Configuration` element in `MTConnectDevices` schema.

See `CoordinateSystem` element in `MTConnectDevices` schema.

See `Motion` element in `MTConnectDevices` schema.

See `Relationships` element in `MTConnectDevices` schema.

See `ComponentRelationship` element in `MTConnectDevices` schema.

See `DeviceRelationship` element in `MTConnectDevices` schema.

See `SensorConfiguration` element in `MTConnectDevices` schema.

See `SolidModel` element in `MTConnectDevices` schema.

See `Specifications` element in `MTConnectDevices` schema.

See `ProcessSpecification` element in `MTConnectDevices` schema.

## XML Examples

### Device Entity Hierarchy Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Components>
    <Axes id="a" name="base">
    <Components>
      <Linear id="x" name="X"/>
      <Linear id="y" name="Y"/>
      <Linear id="z" name="Z"/>
      <Rotary id="ar" name="B"/>
      <Linear id="w" name="Z3" nativeName="W"/>
      <Rotary id="c" name="C"/>
    </Components>
    </Axes>
    <Controller id="cont" name="controller">
    <Components>
      <Path id="path1" name="path"/>
    </Components>
    </Controller>
    <Door id="door1" name="door"/>
    <Systems id="systems" name="systems">
    <Components>
      <WorkEnvelope id="we1" name="workenv">
      <Compositions>
        <Composition type="WORKPIECE" id="wp"/>
        <Composition type="TABLE" id="tbl"/>
      </Compositions>
      </WorkEnvelope>
      <Electric id="elec" name="electric"/>
      <Hydraulic id="hydraulic" name="hydraulic"/>
      <Coolant id="coolant" name="coolant"/>
      <Pneumatic id="pneumatic" name="pneumatic"/>
      <Lubrication id="lubrication" name="lubrication"/>
    </Components>
    </Systems>
    <Auxiliaries id="Aux" name="auxiliaries">
    <Components>
      <Environmental id="room" name="environmental"/>
    </Components>
    </Auxiliaries>
    <Resources id="resources" name="resources">
    <Components>
      <Personnel id="personnel" name="personnel"/>
      <Materials id="materials" name="materials">
      <Components>
        <Stock id="procstock" name="stock"/>
      </Components>
      <Materials/>
    </Components> 
    </Resources>
    </Components>
  </Device>
</Devices>
~~~~
{: caption="Device Entity Hierarchy Example"}

### Component Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
  <DataItems>
    <DataItem category="EVENT" id="avail" name="avail" type="AVAILABILITY"/>
    <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
    <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
  </DataItems>
    <Components>
    <Controller id="cont" name="controller">
      <DataItems>
      <DataItem category="EVENT" id="estop" name="estop" type="EMERGENCY_STOP"/>
      <DataItem category="CONDITION" id="logic_cond" type="LOGIC_PROGRAM"/>
      <DataItem category="CONDITION" id="cont_system" type="SYSTEM"/>
      <DataItem category="SAMPLE" id="cut_time" type="ACCUMULATED_TIME" units="SECOND"/>
    </DataItems>
    <Components>
      <Path id="path1" name="path">
        <DataItems>
        <DataItem category="EVENT" id="execution" name="execution" type="EXECUTION"/>
        <DataItem category="SAMPLE" id="cspeed" subType="ACTUAL" type="CUTTING_SPEED" units="MILLIMETER/SECOND"/>
        <DataItem category="CONDITION" id="path_system" type="SYSTEM"/>
        <DataItem category="EVENT" id="cvars" representation="DATA_SET" type="VARIABLE"/>
        <DataItem category="EVENT" id="woffset" representation="TABLE" type="WORK_OFFSET"/>
      </DataItems>
      </Path>
    </Components>
    </Controller>
  </Components>
  </Device>
</Devices>
~~~~
{: caption="Component Example"}

### Component with Compositions Example

In {{term(XML)}}, `Composition` types are represented differently than `Component` types. For `Component` types, the element name is Pascal Case of the `Component` type name. Whereas, the element name for all `Composition`types is `Composition` and the type is defined by the `type` attribute of the element (see example below).

~~~~xml
<WorkEnvelope id="we1" name="workenv">
  <DataItems>
    <DataItem category="CONDITION" id="hardware1" name="hardware1" type="HARDWARE"/>
  </DataItems>
  <Compositions>
  <Composition type="WORKPIECE" id="wp"/>
  <Composition type="TABLE" id="tbl"/>
  </Compositions>
</WorkEnvelope>
~~~~
{: caption="Component with Compositions Example"}

### CoordinateSystem Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
    <DataItems>
      <DataItem id="avail" type="AVAILABILITY" category="EVENT"/>
      <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
      <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
    </DataItems>
    <Configuration>
      <CoordinateSystems>
        <CoordinateSystem id="base" type="BASE">
          <Origin>0 0 0</Origin>
        </CoordinateSystem>
        <CoordinateSystem id="machcoord" type="MACHINE" parentIdRef="base">
          <Transformation>
            <Translation>210 275 1430</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
        <CoordinateSystem id="workcoord" type="OBJECT" parentIdRef="machcoord">
          <Transformation>
            <Translation>0 0 0</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
      </CoordinateSystems>
    </Configuration>
  </Device>
</Devices>
~~~~
{: caption="CoordinateSystem Example"}

### Motion Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
    <DataItems>
      <DataItem id="avail" type="AVAILABILITY" category="EVENT"/>
      <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
      <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
    </DataItems>
    <Configuration>
      <CoordinateSystems>
        <CoordinateSystem id="base" type="BASE">
          <Origin>0 0 0</Origin>
        </CoordinateSystem>
        <CoordinateSystem id="machcoord" type="MACHINE" parentIdRef="base">
          <Transformation>
            <Translation>210 275 1430</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
        <CoordinateSystem id="workcoord" type="OBJECT" parentIdRef="machcoord">
          <Transformation>
            <Translation>0 0 0</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
      </CoordinateSystems>
    </Configuration>
    <Components>
      <Axes id="a" name="base">
        <Components>
          <Linear id="x" name="X">
            <Configuration>
              <Motion id="xmotion" coordinateSystemIdRef="machcoord" type="PRISMATIC" actuation="DIRECT">
                <Transformation>
                  <Translaton>300 915 590</Translaton>
                  <Rotation>0 0 0</Rotation>
                </Transformation>
                <Axis>1.0 0 0</Axis>
              </Motion>
            </Configuration>
          </Linear>
          <DataItems>
            <DataItem id="xtravel" type="SYSTEM" category="CONDITION">
          </DataItems>
        </Components>
      </Axes>
    </Components>
  </Device>
</Devices>
~~~~
{: caption="Motion Example"}

### Relationship Example

~~~~xml
<Components>
  <Axes id="a" name="base">
    <Components>
      <Linear id="x" name="X">
        <Configuration>        
          <Relationships>
            <ComponentRelationship id="xpar" type="PARENT" idRef="we1"/>
          </Relationships>
        </Configuration>
      </Linear>
      <DataItems>
        <DataItem id="xtravel" type="SYSTEM" category="CONDITION">
      </DataItems>
    </Components>
  </Axes>
  <Systems id="systems" name="systems">
    <Components>
      <WorkEnvelope id="we1" name="workenv">
        <Compositions>
          <Composition type="WORKPIECE" id="wp"/>
          <Composition type="TABLE" id="tbl"/>
        </Compositions>
        <DataItems>
          <DataItem id="we1cond" type="SYSTEM" category="CONDITION">
        </DataItems>
      </WorkEnvelope>
    </Components>
  </Systems>
</Components>
~~~~
{: caption="Relationship Example"}
      
### SolidModel Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
    <DataItems>
      <DataItem id="avail" type="AVAILABILITY" category="EVENT"/>
      <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
      <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
    </DataItems>
    <Configuration>
      <CoordinateSystems>
        <CoordinateSystem id="base" type="BASE">
          <Origin>0 0 0</Origin>
        </CoordinateSystem>
        <CoordinateSystem id="machcoord" type="MACHINE" parentIdRef="base">
          <Transformation>
            <Translation>210 275 1430</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
        <CoordinateSystem id="workcoord" type="OBJECT" parentIdRef="machcoord">
          <Transformation>
            <Translation>0 0 0</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
      </CoordinateSystems>
    </Configuration>
    <Components>
      <Structures id="struct">
        <Configuration>
          <SolidModel id="model" mediaType="OBJ" href="/objs/mazak.obj" coordinateSystemIdRef="base">
            <Transformation>
              <Translation>0 860 0</Translation>
              <Rotation>-90 0 0</Rotation>
            </Transformation>
            <Scale>0.001 0.001 0.001</Scale>
          </SolidModel>
        </Configuration>
        <Components>
          <Structure id="xaxis" name="X_AXIS">
            <Configuration>
              <SolidModel id="x_model" mediaType="OBJ" itemRef="xaxis" solidModelIdRef="model" coordinateSystemIdRef="base"/>
            </Configuration>
            <DataItems>
              <DataItem type="SYSTEM" category="CONDITION" id="struct_cond"/>
            </DataItems>
          </Structure>
        </Components>
      </Structures>
    </Components>
  </Device>
</Devices>
~~~~
{: caption="SolidModel Example"}

### Specification Example

~~~~xml
<Components>
  <Axes id="a" name="base">
    <Components>
      <Linear id="x" name="X">
        <Configuration>
          <Specifications>
            <Specification id="spec001" type="LENGTH" units="MILLIMETER">
              <Nominal>650</Nominal>
            </Specification>
            <Specification id="spec002" type="LINEAR_FORCE" units="NEWTON">
              <Maximum>5200</Maximum>
              <Minimum>0</Minimum>
            </Specification>
          </Specifications>
        </Configuration>
        <DataItems>
          <DataItem id="xtravel" type="SYSTEM" category="CONDITION">
        </DataItems>
      </Linear>
    </Components>
  </Axes>
</Components>
~~~~
{: caption="Specification Example"}

### Example of sensing element provided as data item associated with a Component

~~~~xml
<Components>
  <Axes id="a" name="base"
    <Components>
      <Rotary id="c" name="C">
        <DataItems>
          <DataItem type="TEMPERATURE" id="servotemp4"
            category="SAMPLE" nativeUnits="CELSIUS"
            compositionId="Bmotor" units="CELSIUS"/>
          </DataItems>
      </Rotary>
    </Components>
  </Axes>
</Components>
~~~~
{: caption="Example of sensing element provided as data item associated with a Component"}

### Example of Sensor for rotary axis

~~~~xml
<Components>
  <Axes id="a" name="base"
    <Components>
      <Rotary id="ar" name="B">
        <Components>
          <Sensor id="spdlm" name="Spindlemonitor">
            <DataItems>
              <DataItem type="DISPLACEMENT" id="cvib"
                category="SAMPLE" name="Svib" 
                units="MILLIMETER"/>
            </DataItems>
          </Sensor >
        <Components>
      </Rotary>
    </Components>
  </Axes>
</Components>
~~~~
{: caption="Example of Sensor for rotary axis"}

### Example of sensor unit with sensing element

~~~~xml
<Axes id="a" name="base"
  <Components>
  <Sensor id="sens1" name="Sensorunit">
    <DataItems>
    <DataItem type="TEMPERATURE" id="sentemp"
      category="SAMPLE" name="Sensortemp" 
      units="CELSIUS"/> 
    </DataItems>
  </Sensor >
  <Linear id="x" name="X">
    <DataItems>
    <DataItem type="DISPLACEMENT" id="xvib"
      category="SAMPLE" name="xvib" 
      units="MILLIMETER">
      <Source componentId="sens1"/>
    </DataItem>
    </DataItems>
  </Rotary>
  <Linear id="y" name="Y">
    <DataItems>
    <DataItem type="DISPLACEMENT" id="yvib" 
      category="SAMPLE" name="yvib" 
      units="MILLIMETER">
      <Source componentId="sens1"/>
    </DataItem>
    </DataItems>
  </Linear>
  <Components>
</Axes>
~~~~
{: caption="Example of sensor unit with sensing element"}

### Example of configuration data for Sensor

~~~~xml
<Sensor id="sensor" name="sensor">
  <Configuration>
    <SensorConfiguration>
      <FirmwareVersion>2.02</FirmwareVersion>
      <CalibrationDate>2010-05-16</CalibrationDate>
      <NextCalibrationDate>2010-05-16</NextCalibrationDate>
      <CalibrationInitials>WS</CalibrationInitials>
      <Channels>
        <Channel number="1" name="A/D:1">
          <Description>A/D With Thermister</Description>
        </Channel>
      </Channels>
    </SensorConfiguration>
  </Configuration>
  <DataItems>
    <DataItem category="CONDITION" id="sensorc" 
      name="sensorc" type="SYSTEM" />
    <DataItem category="SAMPLE" id="senv" name="sensorc"
      type="VOLTAGE_DC" units="VOLT" subType="ACTUAL" />
  </DataItems>
</Sensor>
~~~~
{: caption="Example of configuration data for Sensor"}  