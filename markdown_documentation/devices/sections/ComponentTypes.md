
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
