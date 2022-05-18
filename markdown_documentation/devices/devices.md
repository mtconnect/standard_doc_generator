
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

{{input(sections/DeviceInformationModel.md)}}

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

{{input(sections/Components.md)}}

{{input(sections/Devices.md)}}

{{input(sections/ComponentTypes.md)}}

{{input(sections/ComponentOrganizerTypes.md)}}

# Compositions Model

{{block(Composition)}} entities are used to describe the lowest level physical building blocks of a piece of equipment contained within a {{block(Component)}}. By referencing a specific {{block(Composition)}} entity, further clarification and meaning to data associated with a specific {{block(Component)}} can be achieved.

Both {{block(Component)}} and {{block(Composition)}} entities are {{term(lower level)}} entities representing the sub-parts of the parent {{block(Component)}}.  However, there are distinct differences between {{block(Component)}} and {{block(Composition)}} type entities.

{{block(Component)}} entities may be further defined with {{term(lower level)}} {{block(Component)}} entities and may have associated {{termplural(DataItem)}}.

{{block(Composition)}} entities represent the lowest level physical part of a piece of equipment.  They **MUST NOT** be further defined with {{term(lower level)}} {{block(Component)}} entities and they **MUST NOT** have {{termplural(DataItem)}} directly associated with them.   They do provide additional information that can be used to enhance the specificity of {{termplural(DataItem)}} associated with the parent {{block(Component)}}.

{{input(sections/Compositions.md)}}

{{input(sections/CompositionTypes.md)}}

# DataItems Model

For an {{block(MTConnectDevices)}} entity, {{termplural(DataItem)}} describe data that can be reported by a piece of equipment and are associated with {{block(Device)}} and {{block(Component)}} entities. While the {{termplural(DataItem)}} describe the data that can be reported by a piece of equipment as an {{block(MTConnectDevices)}} entity, the actual data values are provided by the {{block(MTConnectStreams)}} entity in the {{term(MTConnectStreams Response Document)}}. See {{package(Observation Information Model)}} for detail on the reported values.

Each {{term(DataItem)}} **SHOULD** be modeled for the {{block(MTConnectDevices)}} entity such that it is associated with the entity that the reported data directly applies.

{{block(DataItem)}} describes specific types of {{termplural(DataItem)}} that represent a numeric value, a functioning state, or a health status reported by a piece of equipment. {{block(DataItem)}} provides a detailed description for each {{term(DataItem)}} that is reported; it defines the type of data being reported and an array of optional attributes that further describe that data. The different types of {{block(DataItem)}} elements are defined in {{package(DataItem Types)}}.

{{input(sections/DataItems.md)}}

{{input(sections/PropertiesofDataItem.md)}}

{{input(sections/PropertiesofDefinition.md)}}

{{input(sections/RelationshipTypesforDataItem.md)}}

{{input(sections/DataItemTypes.md)}}

# References Model

{{block(References)}} {{termplural(organize)}} pointers to information defined elsewhere within the {{block(MTConnectDevices)}} entity for a piece of equipment. It is an efficient method to associate information with an element without duplicating any of the data or structure.

{{input(sections/References.md)}}

# Configurations Model

This section provides semantic information for the {{block(Configuration)}} entity that is used to model technical information about a {{block(Component)}}. 

{{input(sections/Configurations.md)}}

{{input(sections/CoordinateSystems.md)}}

{{input(sections/Motion.md)}}

{{input(sections/Relationships.md)}}

{{input(sections/Sensor.md)}}

{{input(sections/SolidModel.md)}}

{{input(sections/Specifications.md)}}
