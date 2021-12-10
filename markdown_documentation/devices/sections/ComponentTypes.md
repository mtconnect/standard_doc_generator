
## Component Types

This section provides semantic information for the types of {{block(Component)}}. 

{{block(Component)}} entities are defined into two major categories:

* {{term(top level)}} {{block(Component)}} entities that {{termplural(organize)}} the most significant physical or logical functions of a piece of equipment.  They **MAY** also be used as {{term(lower level)}} {{block(Component)}} entities; as required. See {{sect(ComponentOrganizer Types)}}.

* {{term(lower level)}} {{block(Component)}} entities composed of the sub-parts of the parent {{block(Component)}} to provide more clarity and granularity to the physical or logical structure of the {{term(top level)}} {{block(Component)}} entities.

This section provides guidance for the most common relationships between {{block(Component)}} types.  However, all {{block(Component)}} types **MAY** be used in any configuration, as required, to fully describe a piece of equipment.

As described in {{sect(Components Model)}}, {{block(Component)}} is an abstract entity and will be always realized by a specific {{block(Component)}} type.

### Actuator


{{block(Component)}} composed of a physical apparatus that moves or controls a mechanism or system. 

It takes energy usually provided by air, electric current, or liquid and converts the energy into some kind of motion.

### Adapter


{{block(Component)}} that provides information about the data source for an {{term(MTConnect Agent)}}.

It **MAY** contain connectivity state of the data source and additional telemetry about the data source and source-specific information.

### Auxiliary


abstract {{block(Component)}} composed of removable part(s) of a piece of equipment that provides supplementary or extended functionality.


#### Deposition


{{block(Auxiliary)}} that manages the addition of material or state change of material being performed in an additive manufacturing process.

For example, this could describe the portion of a piece of equipment that manages a material extrusion process or a vat polymerization process.

#### Environmental


{{block(Auxiliary)}} that monitors, manages, or conditions the environment around or within a piece of equipment.


##### Heating


{{block(System)}} that delivers controlled amounts of heat to achieve a target temperature at a specified heating rate.

> Note: As an example, Energy Delivery Method can be either through Electric heaters or Gas burners.

##### Vacuum


{{block(System)}} that evacuates gases and liquids from an enclosed and sealed space to a controlled negative pressure or a molecular density below the prevailing atmospheric level.


##### Cooling


{{block(System)}} that extracts controlled amounts of heat to achieve a target temperature at a specified cooling rate.

> Note: As an example, Energy Extraction Method can be via cooling water pipes running through the chamber.

##### Pressure


{{block(System)}} that delivers compressed gas or fluid and controls the pressure and rate of pressure change to a desired target set-point.

> Note: For example, Delivery Method can be a Compressed Air or N2 tank that is piped via an inlet valve to the chamber.

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

{{block(Linear)}} and {{block(Rotary)}} components **MUST** have a {{property(name)}} attribute that **MUST** follow the conventions described below. Use the {{property(nativeName)}} attribute for the manufacturer's name of the axis if it differs from the assigned {{property(name)}}.

MTConnect has two high-level classes for automation equipment as follows: (1) Equipment that controls cartesian coordinate axes and (2) Equipment that controls articulated axes. There are ambiguous cases where some machines exhibit both characteristics; when this occurs, the primary control system's configuration determines the classification.

Examples of cartesian coordinate equipment are CNC Machine Tools, Coordinate measurement machines, as specified in ISO 841, and 3D Printers. Examples of articulated automation equipment are Robotic systems as specified in ISO 8373.

The following sections define the designation of names for the axes and additional guidance when selecting the correct scheme to use for a given piece of equipment.

#### Cartesian Coordinate Naming Conventions

A Three-Dimensional Cartesian Coordinate control system organizes its axes orthogonally relative to a machine coordinate system where the manufacturer of the equipment specifies the origin. 

{{block(Axes)}} {{property(name)}} **SHOULD** comply with ISO 841, if possible.

##### Linear Motion

A piece of equipment **MUST** represent prismatic motion using a {{block(Linear)}} axis {{block(Component)}} and assign its {{property(name)}} using the designations `X`, `Y`, and `Z`. A {{block(Linear)}} axis {{property(name)}} **MUST** append a monotonically increasing suffix when there are more than one parallel axes; for example, `X2`, `X3`, and `X4`. 

##### Rotary Motion

MTConnect **MUST** assign the {{property(name)}} to {{block(Rotary)}} axes exhibiting rotary motion using `A`, `B`, and `C`. A {{block(Rotary)}} axis {{property(name)}} **MUST** append a monotonically increasing suffix when more than one {{block(Rotary)}} axis rotates around the same {{block(Linear)}} axis; for example, `A2`, `A3`, and `A4`. 

#### Articulated Machine Control Systems

An articulated control system's axes represent the connecting linkages between two adjacent rigid members of an assembly. The {{block(Linear)}} axis represents prismatic motion, and the {{block(Rotary)}} axis represents the rotational motion of the two related members. The control organizes the axes in a kinematic chain from the mounting surface (base) to the end-effector or tooling.

#### Articulated Machine Axis Names

The axes of articulated machines represent forward kinematic relationships between mechanical linkages. Each axis is a connection between linkages, also referred to as joints, and **MUST** be named using a `J` followed by a monotonically increasing number; for example, `J1`, `J2`, `J3`.  The numbering starts at the base axis connected or closest to the mounting surface, `J1`, incrementing to the mechanical interface, `Jn`, where `n` is the number of the last axis. The chain forms a parent-child relationship with the parent being the axis closest to the base.

A machine having an axis with more than one child **MUST** number each branch using its numeric designation followed by a branch number and a monotonically increasing number. For example, if `J2` has two children, the first child branch **MUST** be named `J2.1.1` and the second child branch `J2.2.1`. A child of the first branch **MUST** be named `J2.1.2`, incrementing to `J2.1.n`, where `J2.1.n` is the number of the last axis in that branch.

#### Linear


{{block(Axis)}} that provides prismatic motion along a fixed axis.


#### Rotary


{{block(Axis)}} that provides rotation about a fixed axis.


### Door


{{block(Component)}} composed of a mechanical mechanism or closure that can cover a physical access portal into a piece of equipment allowing or restricting access to other parts of the equipment.

The closure can be opened or closed to allow or restrict access to other parts of the equipment.

{{block(Door)}} **MUST** have {{block(DoorState)}} data item to indicate if the door is `OPEN`, `CLOSED`, or `UNLATCHED`. A {{block(Component)}} **MAY** contain multiple {{block(Door)}} entities.

### Lock


{{block(Component)}} that physically prohibits a {{block(Device)}} or {{block(Component)}} from opening or operating.


### Part


abstract {{block(Component)}} composed of a {{term(part)}} being processed by a piece of equipment.


#### PartOccurrence


{{block(Part)}} that exists at a specific place and time, such as a specific instance of a bracket at a specific timestamp.

{{block(PartId)}} **MUST** be defined for {{block(PartOccurrence)}}.

Suggested data item types for {{block(PartOccurrence)}} are: {{block(PartUniqueId)}}, {{block(PartGroupId)}}, {{block(PartKindId)}}, {{block(PartCount)}}, {{block(PartStatus)}}, {{block(ProcessTime)}}, and {{block(ProcessOccurrenceId)}}, and {{block(User)}}.

### Path


{{block(Component)}} that organizes an independent operation or function within a {{block(Controller)}}.

For many types of equipment, {{block(Path)}} organizes a set of {{block(Axes)}}, one or more Program elements, and the data associated with the motion of a control point as it moves through space. However, it **MAY** also represent any independent function within a {{block(Controller)}} that has unique data associated with that function.
 
{{block(Path)}} **SHOULD** provide an {{block(Execution)}} data item to define the operational state of the {{block(Controller)}} of the piece of equipment.

If the {{block(Controller)}} is capable of performing more than one independent operation or function simultaneously, a separate {{block(Path)}} **MUST** be used to organize the data associated with each independent operation or function.

### Power


{{block(Power)}} was **DEPRECATED** in *MTConnect Version 1.1* and was replaced by {{block(Availability)}} data item type.


### Process


abstract {{block(Component)}} composed of a manufacturing process being executed on a piece of equipment.


#### ProcessOccurrence


{{block(Process)}} that takes place at a specific place and time, such as a specific instance of part-milling occurring at a specific timestamp.

{{block(ProcessOccurrenceId)}} **MUST** be defined for {{block(ProcessOccurrence)}}.

Suggested data item types for {{block(ProcessOccurrence)}} are: {{block(ProcessAggregateId)}}, {{block(ProcessKindId)}}, {{block(ProcessTime)}}, {{block(User)}}, {{block(Program)}}, and {{block(PartUniqueId)}}.

### Resource


abstract {{block(Component)}} composed of material or personnel involved in a manufacturing process.


#### Material


{{block(Resource)}} composed of material that is consumed or used by the piece of equipment for production of parts, materials, or other types of goods.


##### Stock


{{block(Material)}} that is used in a manufacturing process and to which work is applied in a machine or piece of equipment to produce parts.

{{block(Stock)}} may be either a continuous piece of material from which multiple parts may be produced or it may be a discrete piece of material that will be made into a part or a set of parts.

#### Personnel


{{block(Resource)}} composed of an individual or individuals who either control, support, or otherwise interface with a piece of equipment.



### Sensor


{{block(Component)}} that responds to a physical stimulus and transmits a resulting impulse or value from a sensing unit.

If modeling individual sensors, then sensor should be associated with the {{block(Component)}} that the measured value is most closely associated.

When modeled as an {{block(Auxiliary)}}, sensor **SHOULD** represent an integrated {{term(sensor unit)}} system that provides signal processing, conversion, and communications. A {{term(sensor unit)}} may have multiple {{termplural(sensing element)}}.

See {{block(SensorConfiguration)}} for more details on the use and configuration of a {{block(Sensor)}.

### Structure


{{block(Component)}} composed of part(s) comprising the rigid bodies of the piece of equipment.


#### Link


{{block(Structure)}} that provides a connection between {{block(Component)}} entities.


### System


abstract {{block(Component)}} that is permanently integrated into the piece of equipment.


#### Controller


{{block(System)}} that provides regulation or management of a system or component. {{cite(ISO 16484-5:2017)}}

Typical types of controllers for a piece of equipment include CNC (Computer Numerical Control), PAC (Programmable Automation Control), IPC (Industrialized Computer), or IC (Imbedded Computer).

#### Coolant


{{block(System)}} that provides distribution and management of fluids that remove heat from a piece of equipment.


#### Dielectric


{{block(System)}} that manages a chemical mixture used in a manufacturing process being performed at that piece of equipment.

For example, this could describe the dielectric system for an EDM process or the chemical bath used in a plating process.

#### Electric


{{block(System)}} composed of the main power supply for the piece of equipment that provides distribution of that power throughout the equipment.

The electric system will provide all the data with regard to electric current, voltage, frequency, etc. that applies to the piece of equipment as a functional unit. Data regarding electric power that is specific to a {{block(Component)}} will be reported for that specific {{block(Component)}.

#### Enclosure


{{block(System)}} composed of a structure that is used to contain or isolate a piece of equipment or area.

{{block(Enclosure)}} may provide information regarding access to the internal components of a piece of equipment or the conditions within the enclosure. For example, {{block(Door)}} may be defined as a {{term(lower level)}} {{block(Component)}} or {{block(Composition)}} entity of the {{block(Enclosure)}}.

#### EndEffector


{{block(System)}} composed of functions that form the last link segment of a piece of equipment.

It is the part of a piece of equipment that interacts with the manufacturing process.

#### Feeder


{{block(System)}} that manages the delivery of materials within a piece of equipment.

For example, this could describe the wire delivery system for an EDM or welding process; conveying system or pump and valve system distributing material to a blending station; or a fuel delivery system feeding a furnace.

#### Hydraulic


{{block(System)}} that provides movement and distribution of pressurized liquid throughout the piece of equipment.


#### Lubrication


{{block(System)}} that provides distribution and management of fluids used to lubricate portions of the piece of equipment.


#### Pneumatic


{{block(System)}} that uses compressed gasses to actuate components or do work within the piece of equipment.

> Note: Actuation is usually performed using a cylinder.

#### ProcessPower


{{block(System)}} composed of a power source associated with a piece of equipment that supplies energy to the manufacturing process separate from the {{block(Electric)}} system.

For example, this could be the power source for an EDM machining process, an electroplating line, or a welding system.

#### Protective


{{block(System)}} that provides functions used to detect or prevent harm or damage to equipment or personnel.

{{block(Protective)}} does not include the information relating to the {{block(Enclosure)}}.

#### WorkEnvelope


{{block(System)}} composed of the physical process execution space within a piece of equipment.

{{block(WorkEnvelope)}} **MAY** provide information regarding the physical workspace and the conditions within that workspace.
