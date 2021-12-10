
## Event Types

This section provides semantic information for {{block(Event)}} types.

### ActivationCount

accumulation of the number of times a function has attempted to, or is planned to attempt to, activate or be performed.




The value of {{property(ActivationCount)}} **MUST** be a `string`.


#### Subtypes of ActivationCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### ActiveAxes

set of axes currently associated with a {{block(Path)}} or {{block(Controller)}}.




The value of {{property(ActiveAxes)}} **MUST** be a `string`.

### ActuatorState

operational state of an apparatus for moving or controlling a mechanism or system.




The value of {{property(ActuatorState)}} **MUST** be one of the `ActuatorStateEnum` enumeration. 

`ActuatorStateEnum` Enumeration:


* `ACTIVE` 

    {{block(Actuator)}} is operating.

* `INACTIVE` 

    {{block(Actuator)}} is not operating.

### AdapterSoftwareVersion

originator’s software version of the {{term(adapter)}}.




The value of {{property(AdapterSoftwareVersion)}} **MUST** be a `string`.


### AdapterURI

{{term(URI)}} of the {{term(adapter)}}.




The value of {{property(AdapterURI)}} **MUST** be a `string`.


### Alarm

**DEPRECATED:** Replaced with `CONDITION` category data items in Version 1.1.0.




The value of {{property(Alarm)}} **MUST** be a `string`.


### AlarmLimit

set of limits used to trigger warning or alarm indicators.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `AlarmLimitResult` keys.

`AlarmLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `UPPER_LIMIT` **MUST** be a `float`.


* `UPPER_WARNING` 

    upper boundary indicating increased concern and supervision may be required.
    The value of `UPPER_WARNING` **MUST** be a `float`.


* `LOWER_WARNING` 

    lower boundary indicating increased concern and supervision may be required.
    The value of `LOWER_WARNING` **MUST** be a `float`.


* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `LOWER_LIMIT` **MUST** be a `float`.


### Application

application on a {{block(Component)}}.




The value of {{property(Application)}} **MUST** be a `string`.


#### Subtypes of Application

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Application)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Application)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### AssetChanged

{{block(assetId)}} of the {{term(Asset)}} that has been added or changed.




The value of {{property(AssetChanged)}} **MUST** be a `string`.


#### Value Properties of AssetChanged

{{tbl(value-properties-of-assetchanged)}} lists the Value Properties of {{block(AssetChanged)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(assetType)}} | `AssetTypeEnum` | 1 |
{: caption="Value Properties of AssetChanged"}

Descriptions for Value Properties of {{block(AssetChanged)}}:

* {{property(assetType)}} 

    type of {{block(Asset)}} changed. See {{citetitle(MTCPart4)}} for details on the {{block(Asset)}} model.

    The value of {{property(assetType)}} **MUST** be one of the `AssetTypeEnum` enumeration.

    `AssetTypeEnum` Enumeration:


    * `CuttingTool` 

        {{block(CuttingTool)}} {{block(Asset)}} type.

    * `File` 

        {{block(File)}} {{block(Asset)}} type. 

    * `QIFDocumentWrapper` 

        {{block(QIFDocumentWrapper)}} {{block(Asset)}} type. 

    * `RawMaterial` 

        {{block(RawMaterial)}} {{block(Asset)}} type. 

### AssetRemoved

{{block(assetId)}} of the {{term(Asset)}} that has been removed.




The value of {{property(AssetRemoved)}} **MUST** be a `string`.


#### Value Properties of AssetRemoved

{{tbl(value-properties-of-assetremoved)}} lists the Value Properties of {{block(AssetRemoved)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(assetType)}} | `AssetTypeEnum` | 1 |
{: caption="Value Properties of AssetRemoved"}

Descriptions for Value Properties of {{block(AssetRemoved)}}:

* {{property(assetType)}} 

    type of {{block(Asset)}} removed. See {{citetitle(MTCPart4)}} for details on the {{block(Asset)}} model.

    The value of {{property(assetType)}} **MUST** be one of the `AssetTypeEnum` enumeration.

### Availability

{{term(agent)}}'s ability to communicate with the data source.




The value of {{property(Availability)}} **MUST** be one of the `AvailabilityEnum` enumeration. 

`AvailabilityEnum` Enumeration:


* `AVAILABLE` 

    data source is active and capable of providing data.

* `UNAVAILABLE` 

    data source is either inactive or not capable of providing data.

### AxisCoupling

describes the way the axes will be associated to each other. 
  
This is used in conjunction with `COUPLED_AXES` to indicate the way they are interacting.




The value of {{property(AxisCoupling)}} **MUST** be one of the `AxisCouplingEnum` enumeration. 

`AxisCouplingEnum` Enumeration:


* `TANDEM` 

    axes are physically connected to each other and operate as a single unit.

* `SYNCHRONOUS` 

    axes are not physically connected to each other but are operating together in lockstep.

* `MASTER` 

    axis is the master of the {{block(CoupledAxes)}}.

* `SLAVE` 

    axis is a slave to the {{block(CoupledAxes)}}.

### AxisFeedrateOverride

value of a signal or calculation issued to adjust the feedrate of an individual linear type axis.




The value of {{property(AxisFeedrateOverride)}} **MUST** be a `float`.

#### Subtypes of AxisFeedrateOverride

* `JOG`

    feedrate of an individual linear type axis when that axis is being operated in a
    manual state or method (jogging).
    
    When the `JOG` subtype of `AxisFeedrateOverride` is applied, the resulting commanded feedrate for the axis is limited to the value of the original `JOG` subtype of the `AxisFeedrate` multiplied by the value of the `JOG` subtype of
    `AxisFeedrateOverride`.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### AxisInterlock

state of the axis lockout function when power has been removed and the axis is allowed to move freely.




The value of {{property(AxisInterlock)}} **MUST** be one of the `AxisInterlockEnum` enumeration. 

`AxisInterlockEnum` Enumeration:


* `ACTIVE` 

    axis lockout function is activated, power has been removed from the axis, and the axis is allowed to move freely.

* `INACTIVE` 

    axis lockout function has not been activated, the axis may be powered, and the axis is capable of being controlled by another component.

### AxisState

state of a {{block(Linear)}} or {{block(Rotary)}} component representing an axis.




The value of {{property(AxisState)}} **MUST** be one of the `AxisStateEnum` enumeration. 

`AxisStateEnum` Enumeration:


* `HOME` 

    axis is in its home position.

* `TRAVEL` 

    axis is in motion.

* `PARKED` 

    axis has been moved to a fixed position and is being maintained in that position either electrically or mechanically. 
    
    Action is required to release the axis from this position.

* `STOPPED` 

    axis is stopped.

### Block

line of code or command being executed by a {{block(Controller)}} entity.




The value of {{property(Block)}} **MUST** be a `string`.


### BlockCount

total count of the number of blocks of program code that have been executed since execution started.




The value of {{property(BlockCount)}} **MUST** be a `integer`.

### ChuckInterlock

state of an interlock function or control logic state intended to prevent the associated {{block(Chuck)}} component from being operated.




The value of {{property(ChuckInterlock)}} **MUST** be one of the `ChuckInterlockEnum` enumeration. 

`ChuckInterlockEnum` Enumeration:


* `ACTIVE` 

    chuck cannot be unclamped.

* `INACTIVE` 

    chuck can be unclamped.

#### Subtypes of ChuckInterlock

* `MANUAL_UNCLAMP`

    indication of the state of an operator controlled interlock that can inhibit the ability to initiate an unclamp action of an electronically controlled chuck.
    
    When {{block(ChuckInterlockManualUnclamp)}} is `ACTIVE`, it is expected that a chuck cannot be unclamped until {{block(ChuckInterlockManualUnclamp)}} is set to `INACTIVE`. 
    

### ChuckState

operating state of a mechanism that holds a part or stock material during a manufacturing process. 

It may also represent a mechanism that holds any other mechanism in place within a piece of equipment.




The value of {{property(ChuckState)}} **MUST** be one of the `ChuckStateEnum` enumeration. 

`ChuckStateEnum` Enumeration:


* `OPEN` 

    {{block(Chuck)}} is open to the point of a positive confirmation.

* `CLOSED` 

    {{block(Chuck)}} is closed to the point of a positive confirmation.

* `UNLATCHED` 

    {{block(Chuck)}} is not closed to the point of a positive confirmation and not open to the point of a positive confirmation. 
    
    It is in an intermediate position.

### Code

programmatic code being executed.

**DEPRECATED** in *Version 1.1*.




The value of {{property(Code)}} **MUST** be a `string`.


### CompositionState

operating state of a mechanism represented by a {{block(Composition)}} entity.




The value of {{property(CompositionState)}} **MUST** be a `string`.


#### Subtypes of CompositionState

* `ACTION`

    indication of the operating state of a mechanism.
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `ACTION` **MUST** be one of the `ActionCompositionStateEnum` enumeration.

    `ActionCompositionStateEnum` Enumeration:


    * `ACTIVE` 

        {{block(Composition)}} is operating.

    * `INACTIVE` 

        {{block(Composition)}} is not operating.
* `LATERAL`

    indication of the position of a mechanism that may move in a lateral direction.   
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `LATERAL` **MUST** be one of the `LateralCompositionStateEnum` enumeration.

    `LateralCompositionStateEnum` Enumeration:


    * `RIGHT` 

        position of the {{block(Composition)}} is oriented to the right to the point of a positive confirmation.

    * `LEFT` 

        position of the {{block(Composition)}} is oriented to the left to the point of a positive confirmation.

    * `TRANSITIONING` 

        position of the {{block(Composition)}} is not oriented to the right to the point of a positive confirmation and is not oriented to the left to the point of a positive confirmation. 
        
        It is in an intermediate position.
* `MOTION`

    indication of the open or closed state of a mechanism.
    
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `MOTION` **MUST** be one of the `MotionCompositionStateEnum` enumeration.

    `MotionCompositionStateEnum` Enumeration:


    * `OPEN` 

        position of the {{block(Composition)}} is open to the point of a positive confirmation.

    * `UNLATCHED` 

        position of the {{block(Composition)}} is not open to the
        point of a positive confirmation and is not closed to the point of a positive confirmation. 
        
        It is in an intermediate position.

    * `CLOSED` 

        position of the {{block(Composition)}} is closed to the point of a positive confirmation.
* `SWITCHED`

    indication of the activation state of a mechanism.
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `SWITCHED` **MUST** be one of the `SwitchedCompositionStateEnum` enumeration.

    `SwitchedCompositionStateEnum` Enumeration:


    * `ON` 

        activation state of the {{block(Composition)}} is in an `ON` condition, it is operating, or it is powered.

    * `OFF` 

        activation state of the {{block(Composition)}} is in an `OFF` condition, it is not operating, or it is not powered.
* `VERTICAL`

    indication of the position of a mechanism that may move in a vertical direction.
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `VERTICAL` **MUST** be one of the `VerticalCompositionStateEnum` enumeration.

    `VerticalCompositionStateEnum` Enumeration:


    * `UP` 

        position of the {{block(Composition)}} element is oriented in an upward direction to the point of a positive confirmation.

    * `DOWN` 

        position of the {{block(Composition)}} element is oriented in a downward direction to the point of a positive confirmation.

    * `TRANSITIONING` 

        position of the {{block(Composition)}} element is not oriented in an upward direction to the point of a positive confirmation and is not oriented in a downward direction to the point of a positive confirmation. 
        
        It is in an intermediate position.

### ConnectionStatus

status of the connection between an {{term(adapter)}} and an {{term(agent)}}.




The value of {{property(ConnectionStatus)}} **MUST** be one of the `ConnectionStatusEnum` enumeration. 

`ConnectionStatusEnum` Enumeration:


* `CLOSED` 

    no connection at all.

* `LISTEN` 

    {{term(agent)}} is waiting for a connection request from an {{term(adapter)}}.

* `ESTABLISHED` 

    open connection.
    
    The normal state for the data transfer phase of the connection.

### ControlLimit

set of limits used to indicate whether a process variable is stable and in control.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `ControlLimitResult` keys.

`ControlLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `UPPER_LIMIT` **MUST** be a `float`.


* `UPPER_WARNING` 

    upper boundary indicating increased concern and supervision may be required.
    The value of `UPPER_WARNING` **MUST** be a `float`.


* `NOMINAL` 

    ideal or desired value for a variable.
    The value of `NOMINAL` **MUST** be a `float`.


* `LOWER_WARNING` 

    lower boundary indicating increased concern and supervision may be required.
    The value of `LOWER_WARNING` **MUST** be a `float`.


* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `LOWER_LIMIT` **MUST** be a `float`.


### ControllerMode

current mode of the {{block(Controller)}} component.




The value of {{property(ControllerMode)}} **MUST** be one of the `ControllerModeEnum` enumeration. 

`ControllerModeEnum` Enumeration:


* `AUTOMATIC` 

    {{block(Controller)}} is configured to automatically execute a program.

* `MANUAL` 

    {{block(Controller)}} is not executing an active program. 
    
    It is capable of receiving instructions from an external source – typically an operator. The {{block(Controller)}} executes operations based on the instructions received from the external source.

* `MANUAL_DATA_INPUT` 

    operator can enter a series of operations for the {{block(Controller)}} to perform.
    
    The {{block(Controller)}} will execute this specific series of operations and then stop.

* `SEMI_AUTOMATIC` 

    {{block(Controller)}} is operating in a mode that restricts the active program from processing its next process step without operator intervention.

* `EDIT` 

    {{block(Controller)}} is currently functioning as a programming device and is not capable of executing an active program.

### ControllerModeOverride

setting or operator selection that changes the behavior of a piece of equipment.




The value of {{property(ControllerModeOverride)}} **MUST** be one of the `ControllerModeOverrideEnum` enumeration. 

`ControllerModeOverrideEnum` Enumeration:


* `ON` 

    {{block(ControllerModeOverride)}} is in the `ON` state and the mode override is active.

* `OFF` 

    {{block(ControllerModeOverride)}} is in the `OFF` state and the mode override is inactive.

#### Subtypes of ControllerModeOverride

* `DRY_RUN`

    setting or operator selection used to execute a test mode to confirm the execution of machine functions. 
    
    When `DRY_RUN` is `ON`, the equipment performs all of its normal functions, except no part or product is produced.  If the equipment has a spindle, spindle operation is suspended.
    
* `MACHINE_AXIS_LOCK`

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 
     
    When `MACHINE_AXIS_LOCK` is `ON`, program execution continues normally, but no equipment motion occurs.
    
* `OPTIONAL_STOP`

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 
    
    The program execution is stopped after a specific program block is executed when `OPTIONAL_STOP` is `ON`.    
    
    In the case of a G-Code program, a program block containing a M01 code designates the command for an `OPTIONAL_STOP`. 
    
    {{block(Execution)}} **MUST** change to `OPTIONAL_STOP` after a program block specifying an optional stop is executed and the {{block(ControllerModeOverride)}} `OPTIONAL_STOP` selection is `ON`.
    
* `SINGLE_BLOCK`

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 
    
    Program execution is paused after each block of code is executed when `SINGLE_BLOCK` is `ON`.   
    
    When `SINGLE_BLOCK` is `ON`, {{block(Execution)}} **MUST** change to `INTERRUPTED` after completion of each block of code. 
    
* `TOOL_CHANGE_STOP`

    setting or operator selection that changes the behavior of the controller on a piece of equipment.  
    
    Program execution is paused when a command is executed requesting a cutting tool to be changed. 
    
    {{block(Execution)}} **MUST** change to `INTERRUPTED` after completion of the command requesting a cutting tool to be changed and `TOOL_CHANGE_STOP` is `ON`.
    

### CoupledAxes

set of associated axes.




The value of {{property(CoupledAxes)}} **MUST** be a `string`.

### CycleCount

accumulation of the number of times a cyclic function has attempted to, or is planned to attempt to execute.




The value of {{property(CycleCount)}} **MUST** be a `string`.


#### Subtypes of CycleCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### DateCode

time and date code associated with a material or other physical item.




The value of {{property(DateCode)}} **MUST** be a string that represents timestamp in ISO 8601 format.

#### Subtypes of DateCode

* `EXPIRATION`

    time and date code relating to the expiration or end of useful life for a material or other physical item.
    
* `FIRST_USE`

    time and date code relating the first use of a material or other physical item.
    
* `MANUFACTURE`

    time and date code relating to the production of a material or other physical item.
    

### DeactivationCount

accumulation of the number of times a function has attempted to, or is planned to attempt to, deactivate or cease.




The value of {{property(DeactivationCount)}} **MUST** be a `string`.


#### Subtypes of DeactivationCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### DeviceAdded

{{term(UUID)}} of new device added to an {{term(MTConnect Agent)}}.




The value of {{property(DeviceAdded)}} **MUST** be a `string`.


### DeviceChanged

{{term(UUID)}} of the device whose {{term(metadata)}} has changed.




The value of {{property(DeviceChanged)}} **MUST** be a `string`.


### DeviceRemoved

{{term(UUID)}} of a device removed from an {{term(MTConnect Agent)}}.




The value of {{property(DeviceRemoved)}} **MUST** be a `string`.


### DeviceUuid

identifier of another piece of equipment that is temporarily associated with a component of this piece of equipment to perform a particular function.




The value of {{property(DeviceUuid)}} **MUST** be a `string`.


### Direction

direction of motion.




The value of {{property(Direction)}} **MUST** be a `string`.


#### Subtypes of Direction

* `LINEAR`

    direction of motion of a linear motion.
    

    The value for {{block(Direction)}} when {{property(subType)}} is `LINEAR` **MUST** be one of the `LinearDirectionEnum` enumeration.

    `LinearDirectionEnum` Enumeration:


    * `POSITIVE` 

        linear position is increasing.

    * `NEGATIVE` 

        linear position is decreasing.

    * `NONE` 

        no direction.
* `ROTARY`

    rotational direction of a rotary motion using the right hand rule convention.
    

    The value for {{block(Direction)}} when {{property(subType)}} is `ROTARY` **MUST** be one of the `RotaryDirectionEnum` enumeration.

    `RotaryDirectionEnum` Enumeration:


    * `CLOCKWISE` 

        clockwise rotation using the right-hand rule.

    * `COUNTER_CLOCKWISE` 

        counter-clockwise rotation using the right-hand rule.

    * `NONE` 

        no direction.

### DoorState

operational state of a {{block(Door)}} component or composition element.




The value of {{property(DoorState)}} **MUST** be one of the `DoorStateEnum` enumeration. 

`DoorStateEnum` Enumeration:


* `OPEN` 

    {{block(Door)}} is open to the point of a positive confirmation.

* `CLOSED` 

    {{block(Door)}} is closed to the point of a positive confirmation.

* `UNLATCHED` 

    {{block(Door)}} is not closed to the point of a positive confirmation and not open to the point of a positive confirmation. 
    
    It is in an intermediate position.

### EmergencyStop

state of the emergency stop signal for a piece of equipment, controller path, or any other component or subsystem of a piece of equipment.




The value of {{property(EmergencyStop)}} **MUST** be one of the `EmergencyStopEnum` enumeration. 

`EmergencyStopEnum` Enumeration:


* `ARMED` 

    emergency stop circuit is complete and the piece of equipment, component, or composition is allowed to operate. 

* `TRIGGERED` 

    operation of the piece of equipment, component, or composition is inhibited.

### EndOfBar

indication of whether the end of a piece of bar stock being feed by a bar feeder has been reached.




The value of {{property(EndOfBar)}} **MUST** be one of the `YesNoEnum` enumeration. 

`YesNoEnum` Enumeration:


* `YES` 

    {{block(EndOfBar)}} has been reached.

* `NO` 

    {{block(EndOfBar)}} has not been reached.

#### Subtypes of EndOfBar

* `AUXILIARY`

    when multiple locations on a piece of bar stock are referenced as the indication for the {{block(EndOfBar)}}, the additional location(s) **MUST** be designated as `AUXILIARY` indication(s) for the {{block(EndOfBar)}}.  
    
* `PRIMARY`

    specific applications **MAY** reference one or more locations on a piece of bar stock as the indication for the {{block(EndOfBar)}}. 
    
    The main or most important location **MUST** be designated as the {{block(PRIMARY)}} indication for the {{block(EndOfBar)}}.
    
    If no {{block(subType)}} is specified, {{block(PRIMARY)}} **MUST** be the default {{block(EndOfBar)}} indication.
    

### EquipmentMode

indication that a piece of equipment, or a sub-part of a piece of equipment, is performing specific types of activities.




The value of {{property(EquipmentMode)}} **MUST** be one of the `EquipmentModeEnum` enumeration. 

`EquipmentModeEnum` Enumeration:


* `ON` 

    equipment is functioning in the mode designated by the `subType`.

* `OFF` 

    equipment is not functioning in the mode designated by the `subType`.

#### Subtypes of EquipmentMode

* `DELAY`

    elapsed time of a temporary halt of action.
    
* `LOADED`

    indication that the sub-parts of a piece of equipment are under load.
    
    Example: For traditional machine tools, this is an indication that the cutting tool is assumed to be engaged with the part.
    
* `OPERATING`

    indication that the major sub-parts of a piece of equipment are powered or performing any activity whether producing a part or product or not.
    
    Example: For traditional machine tools, this includes when the piece of equipment is `WORKING` or it is idle.
    
* `POWERED`

    indication that primary power is applied to the piece of equipment and, as a minimum, the controller or logic portion of the piece of equipment is powered and functioning or components that are required to remain on are
    powered.
    
    Example: Heaters for an extrusion machine that required to be powered even when the equipment is turned off.
    
* `WORKING`

    indication that a piece of equipment is performing any activity the equipment is active and performing a function under load or not.
    
    Example: For traditional machine tools, this includes when the piece of equipment is `LOADED`, making rapid moves, executing a tool change, etc.
    

### Execution

execution status of the {{block(Component)}}.




The value of {{property(Execution)}} **MUST** be one of the `ExecutionEnum` enumeration. 

`ExecutionEnum` Enumeration:


* `READY` 

    {{block(Component)}} is ready to execute instructions.
    
    It is currently idle.

* `ACTIVE` 

    {{block(Component)}} is actively executing an instruction.

* `INTERRUPTED` 

    {{block(Component)}} suspends the execution of the program due to an external signal.
    
    Action is required to resume execution.

* `FEED_HOLD` 

    motion of the active axes are commanded to stop at their current position.

* `STOPPED` 

    {{block(Component)}} program is not `READY` to execute.

* `OPTIONAL_STOP` 

    command from the program has intentionally interrupted execution.
    
    The {{block(Component)}} **MAY** have another state that indicates if the execution is interrupted or the execution ignores the interrupt instruction.

* `PROGRAM_STOPPED` 

    command from the program has intentionally interrupted execution.
    
    Action is required to resume execution.

* `PROGRAM_COMPLETED` 

    program completed execution.

* `WAIT` 

    {{block(Component)}} suspends execution while a secondary operation executes.
    
    Execution resumes automatically once the secondary operation completes.

### Firmware

embedded software of a {{block(Component)}}.




The value of {{property(Firmware)}} **MUST** be a `string`.


#### Subtypes of Firmware

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Firmware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Firmware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    
    

### FunctionalMode

current intended production status of the {{block(Component)}}.




The value of {{property(FunctionalMode)}} **MUST** be one of the `FunctionalModeEnum` enumeration. 

`FunctionalModeEnum` Enumeration:


* `PRODUCTION` 

    {{block(Component)}} is currently producing product, ready to produce product, or its current intended use is to be producing product.

* `SETUP` 

    {{block(Component)}} is not currently producing product. 
    
    It is being prepared or modified to begin production of product.

* `TEARDOWN` 

    {{block(Component)}} is not currently producing product.
    
    Typically, it has completed the production of a product and is being modified or returned to a neutral state such that it may then be prepared to begin production of a different product.

* `MAINTENANCE` 

    {{block(Component)}} is not currently producing product.
    
    It is currently being repaired, waiting to be repaired, or has not yet been returned to a normal production status after maintenance has been performed.

* `PROCESS_DEVELOPMENT` 

    {{block(Component)}} is being used to prove-out a new process, testing of equipment or processes, or any other active use that does not result in the production of product.

### Hardness

hardness of a material.




The value of {{property(Hardness)}} **MUST** be a `float`.

#### Subtypes of Hardness

* `BRINELL`

    scale to measure the resistance to deformation of a surface.
    
* `LEEB`

    scale to measure the elasticity of a surface.
    
* `MOHS`

    scale to measure the resistance to scratching of a surface.
    
* `ROCKWELL`

    scale to measure the resistance to deformation of a surface.
    
* `SHORE`

    scale to measure the resistance to deformation of a surface.
    
* `VICKERS`

    scale to measure the resistance to deformation of a surface.
    

### Hardware

hardness of a material.




The value of {{property(Hardware)}} **MUST** be a `string`.


#### Subtypes of Hardware

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Hardware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Hardware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### Library

software library on a {{block(Component)}}




The value of {{property(Library)}} **MUST** be a `string`.


#### Subtypes of Library

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Library)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Library)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### Line

state of the power source.




The value of {{property(Line)}} **MUST** be a `string`.


#### Subtypes of Line

* `MAXIMUM`

    maximum line number of the code being executed.
    
* `MINIMUM`

    minimum line number of the code being executed.
    

### LineLabel

identifier for a {{block(Block)}} of code in a {{block(Program)}}.




The value of {{property(LineLabel)}} **MUST** be a `string`.


### LineNumber

position of a block of program code within a control program.




The value of {{property(LineNumber)}} **MUST** be a `integer`.

#### Subtypes of LineNumber

* `ABSOLUTE`

    position of a block of program code relative to the beginning of the control program.
    
* `INCREMENTAL`

    position of a block of program code relative to the occurrence of the last {{block(LineLabel)}} encountered in the control program.
    

### LoadCount

accumulation of the number of times an operation has attempted to, or is planned to attempt to, load materials, parts, or other items.




The value of {{property(LoadCount)}} **MUST** be a `string`.


#### Subtypes of LoadCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### LockState

state or operating mode of a {{block(Lock)}}.




The value of {{property(LockState)}} **MUST** be one of the `LockStateEnum` enumeration. 

`LockStateEnum` Enumeration:


* `LOCKED` 

    mechanism is engaged and preventing the associated {{block(Component)}} from being opened or operated.

* `UNLOCKED` 

    mechanism is disengaged and the associated {{block(Component)}} is able to be opened or operated.

### MTConnectVersion

reference version of the MTConnect Standard supported by the {{term(adapter)}}.




The value of {{property(MTConnectVersion)}} **MUST** be a `string`.


### Material

identifier of a material used or consumed in the manufacturing process.




The value of {{property(Material)}} **MUST** be a `string`.


### MaterialLayer

identifies the layers of material applied to a part or product as part of an additive manufacturing process.




The value of {{property(MaterialLayer)}} **MUST** be a `integer`.

#### Subtypes of MaterialLayer

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `TARGET`

    goal of the operation or process.
    

### Message

information to be transferred from a piece of equipment to a client software application.




The value of {{property(Message)}} **MUST** be a `string`.


### Network

network details of a {{block(Component)}}.




The value of {{property(Network)}} **MUST** be a `string`.


#### Subtypes of Network

* `GATEWAY`

    Gateway for the component network.
    
* `IPV4_ADDRESS`

    IPV4 network address of the component.
    
* `IPV6_ADDRESS`

    IPV6 network address of the component.
    
* `MAC_ADDRESS`

    Media Access Control Address. 
    
    The unique physical address of the network hardware.
    
* `SUBNET_MASK`

    SubNet mask for the component network.
    
* `VLAN_ID`

    layer2 Virtual Local Network (VLAN) ID for the component network.
    
* `WIRELESS`

    identifies whether the connection type is wireless.
    

    The value for {{block(Network)}} when {{property(subType)}} is `WIRELESS` **MUST** be one of the `YesNoEnum` enumeration.

    `YesNoEnum` Enumeration:


    * `YES` 

        {{block(EndOfBar)}} has been reached.

    * `NO` 

        {{block(EndOfBar)}} has not been reached.

### OperatingMode

state of {{block(Component)}} or {{block(Composition)}} that describes the automatic or manual operation of the entity.




The value of {{property(OperatingMode)}} **MUST** be one of the `OperatingModeEnum` enumeration. 

`OperatingModeEnum` Enumeration:


* `AUTOMATIC` 

    automatically execute instructions from a recipe or program.
    
    > Note: Setpoint comes from a recipe.

* `MANUAL` 

    execute instructions from an external agent or person.
    
    > Note 1 to entry: Valve or switch is manipulated by an agent/person.
    
    > Note 2 to entry: Direct control of the PID output. % of the range: A user manually sets the % output, not the setpoint.

* `SEMI_AUTOMATIC` 

    executes a single instruction from a recipe or program.
    
    > Note 1 to entry: Setpoint is entered and fixed, but the PID is controlling.
    
    > Note 2 to entry: Still goes through the PID control system.
    
    > Note 3 to entry: Manual fixed entry from a recipe.

### OperatingSystem

Operating System (OS) of a {{block(Component)}}.




The value of {{property(OperatingSystem)}} **MUST** be a `string`.


#### Subtypes of OperatingSystem

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(OperatingSystem)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(OperatingSystem)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### OperatorId

identifier of the person currently responsible for operating the piece of equipment.




The value of {{property(OperatorId)}} **MUST** be a `string`.


### PalletId

identifier for a pallet.




The value of {{property(PalletId)}} **MUST** be a `string`.


### PartCount

aggregate count of parts.




The value of {{property(PartCount)}} **MUST** be a `float`.

#### Subtypes of PartCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### PartDetect

indication designating whether a part or work piece has been detected or is present.




The value of {{property(PartDetect)}} **MUST** be one of the `PartDetectEnum` enumeration. 

`PartDetectEnum` Enumeration:


* `PRESENT` 

    part or work piece is detected or is present.

* `NOT_PRESENT` 

    part or work piece is not detected or is not present.

### PartGroupId

identifier given to a collection of individual parts. 

If no {{property(subType)}} is specified, `UUID` is default.


The value of {{property(PartGroupId)}} **MUST** be a `string`.


#### Subtypes of PartGroupId

* `BATCH`

    identifier that references a group of parts produced in a batch.
    
* `HEAT_TREAT`

    identifier used to reference a material heat number.
    
* `LOT`

    identifier that references a group of parts tracked as a lot.
    
* `RAW_MATERIAL`

    material that is used to produce parts.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### PartId

identifier of a part in a manufacturing operation.




The value of {{property(PartId)}} **MUST** be a `string`.


### PartKindId

identifier given to link the individual occurrence to a class of parts, typically distinguished by a particular part design.

If no {{property(subType)}} is specified, `UUID` is default.


The value of {{property(PartKindId)}} **MUST** be a `string`.


#### Subtypes of PartKindId

* `PART_FAMILY`

    identifier given to a group of parts having similarities in geometry, manufacturing process, and/or functions.
    
* `PART_NAME`

    word or set of words by which a part is known, addressed, or referred to.
    
* `PART_NUMBER`

    identifier of a particular part design or model.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### PartNumber

particular part design or model.




The value of {{property(PartNumber)}} **MUST** be a `string`.


### PartProcessingState

particular condition of the part occurrence at a specific time.




The value of {{property(PartProcessingState)}} **MUST** be one of the `PartProcessingStateEnum` enumeration. 

`PartProcessingStateEnum` Enumeration:


* `NEEDS_PROCESSING` 

    part occurrence is not actively being processed, but the processing has not ended. 
    
    Processing requirements exist that have not yet been fulfilled. This is the default entry state when the part occurrence is originally received. In some cases, the part occurrence may return to this state while it waits for additional processing to be performed.

* `IN_PROCESS` 

    part occurrence is actively being processed.

* `PROCESSING_ENDED` 

    part occurrence is no longer being processed. 
    
    A general state when the reason for termination is unknown.

* `PROCESSING_ENDED_COMPLETE` 

    part occurrence has completed processing successfully.

* `PROCESSING_ENDED_STOPPED` 

    process has been stopped during the processing. 
    
    The part occurrence will require special treatment.

* `PROCESSING_ENDED_ABORTED` 

    processing of the part occurrence has come to a premature end.

* `PROCESSING_ENDED_LOST` 

    terminal state when the part occurrence has been removed from the equipment by an external entity and it no longer exists at the equipment.

* `PROCESSING_ENDED_SKIPPED` 

    part occurrence has been skipped for processing on the piece of equipment.

* `PROCESSING_ENDED_REJECTED` 

    part occurrence has been processed completely. However, the processing may have a problem.

* `WAITING_FOR_TRANSIT` 

    part occurrence is waiting for transit.

* `IN_TRANSIT` 

    part occurrence is being transported to its destination.

* `TRANSIT_COMPLETE` 

    part occurrence has been placed at its designated destination.

### PartStatus

state or condition of a part.

If unique identifier is given, part status is for that individual. If group identifier is given without a unique identifier, then the status is assumed to be for the whole group.


The value of {{property(PartStatus)}} **MUST** be one of the `PartStatusEnum` enumeration. 

`PartStatusEnum` Enumeration:


* `PASS` 

    part conforms to given requirements.

* `FAIL` 

    part does not conform to some given requirements.

### PartUniqueId

identifier given to a distinguishable, individual part. 

If no {{property(subType)}} is specified, `UUID` is default.


The value of {{property(PartUniqueId)}} **MUST** be a `string`.


#### Subtypes of PartUniqueId

* `RAW_MATERIAL`

    material that is used to produce parts.
    
* `SERIAL_NUMBER`

    serial number that uniquely identifies a specific part.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### PathFeedrateOverride

value of a signal or calculation issued to adjust the feedrate for the axes associated with a {{block(Path)}} component that may represent a single axis or the coordinated movement of multiple axes.




The value of {{property(PathFeedrateOverride)}} **MUST** be a `float`.

#### Subtypes of PathFeedrateOverride

* `JOG`

    feedrate of the axes associated with a `Path` component when the axes, or a single axis, are being operated in a manual mode or method (jogging).
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### PathMode

describes the operational relationship between a {{block(Path)}} entity and another {{block(Path)}} entity for pieces of equipment comprised of multiple logical groupings of controlled axes or other logical operations.




The value of {{property(PathMode)}} **MUST** be one of the `PathModeEnum` enumeration. 

`PathModeEnum` Enumeration:


* `INDEPENDENT` 

    path is operating independently and without the influence of another path.

* `MASTER` 

    path provides information or state values that influences the operation of other {{block(DataItem)}} of similar type.

* `SYNCHRONOUS` 

    physical or logical parts which are not physically connected to each other but are operating together.

* `MIRROR` 

    axes associated with the path are mirroring the motion of the `MASTER` path.

### PowerState

indication of the status of the source of energy for an entity to allow it to perform its intended function or the state of an enabling signal providing permission for the entity to perform its functions.




The value of {{property(PowerState)}} **MUST** be one of the `PowerStateEnum` enumeration. 

`PowerStateEnum` Enumeration:


* `ON` 

    source of energy for an entity or the enabling signal providing permission for the entity to perform its function(s) is present and active.

* `OFF` 

    source of energy for an entity or the enabling signal providing permission for the entity to perform its function(s) is not present or is disconnected.

#### Subtypes of PowerState

* `CONTROL`

    state of the enabling signal or control logic that enables or disables the function or operation of the entity.
    
* `LINE`

    state of the power source for the entity.
    

### PowerStatus

status of the {{block(Component)}}.

**DEPRECATED** in *Version 1.1.0*.




The value of {{property(PowerStatus)}} **MUST** be a `string`.


### ProcessAggregateId

identifier given to link the individual occurrence to a group of related occurrences, such as a process step in a process plan.




The value of {{property(ProcessAggregateId)}} **MUST** be a `string`.


#### Subtypes of ProcessAggregateId

* `ORDER_NUMBER`

    identifier of the authorization of the process occurrence. Synonyms include "job id", "work order".
    
* `PROCESS_PLAN`

    identifier of the process plan that this occurrence belongs to. Synonyms include "routing id", "job id".
    
* `PROCESS_STEP`

    identifier of the step in the process plan that this occurrence corresponds to. Synonyms include "operation id".
    

### ProcessKindId

identifier given to link the individual occurrence to a class of processes or process definition.




The value of {{property(ProcessKindId)}} **MUST** be a `string`.


#### Subtypes of ProcessKindId

* `ISO_STEP_EXECUTABLE`

    reference to a ISO 10303 Executable.
    
* `PROCESS_NAME`

    word or set of words by which a process being executed (process occurrence) by the device is known, addressed, or referred to.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### ProcessOccurrenceId

identifier of a process being executed by the device.




The value of {{property(ProcessOccurrenceId)}} **MUST** be a `string`.


### ProcessState

particular condition of the process occurrence at a specific time.




The value of {{property(ProcessState)}} **MUST** be one of the `ProcessStateEnum` enumeration. 

`ProcessStateEnum` Enumeration:


* `INITIALIZING` 

    device is preparing to execute the process occurrence.

* `READY` 

    process occurrence is ready to be executed.

* `ACTIVE` 

    process occurrence is actively executing.

* `COMPLETE` 

    process occurrence is now finished.

* `INTERRUPTED` 

    process occurrence has been stopped and may be resumed.

* `ABORTED` 

    process occurrence has come to a premature end and cannot be resumed.

### ProcessTime

time and date associated with an activity or event.




The value of {{property(ProcessTime)}} **MUST** be a `string`.


#### Subtypes of ProcessTime

* `COMPLETE`

    time and date associated with the completion of an activity or event.
    
* `START`

    boundary when an activity or an event commences.
    
* `TARGET_COMPLETION`

    projected time and date associated with the end or completion of an activity or event.
    

### Program

name of the logic or motion program being executed by the {{block(Controller)}} component.




The value of {{property(Program)}} **MUST** be a `string`.


### ProgramComment

comment or non-executable statement in the control program.




The value of {{property(ProgramComment)}} **MUST** be a `string`.


### ProgramEdit

indication of the status of the {{block(Controller)}} components program editing mode.

A program may be edited while another is executed.




The value of {{property(ProgramEdit)}} **MUST** be one of the `ProgramEditEnum` enumeration. 

`ProgramEditEnum` Enumeration:


* `ACTIVE` 

    {{block(Controller)}} is in the program edit mode.

* `READY` 

    {{block(Controller)}} is capable of entering the program edit mode and no function is inhibiting a change to that mode.

* `NOT_READY` 

    {{block(Controller)}} is being inhibited by a function from entering the program edit mode.

### ProgramEditName

name of the program being edited. 

This is used in conjunction with {{block(ProgramEdit)}} when in `ACTIVE` state. 




The value of {{property(ProgramEditName)}} **MUST** be a `string`.


### ProgramHeader

non-executable header section of the control program.




The value of {{property(ProgramHeader)}} **MUST** be a `string`.


#### Subtypes of ProgramHeader

* `ACTIVE`

    identity of the logic or motion program currently executing.
    
* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.
    
* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.
    

### ProgramLocation

{{term(URI)}} for the source file associated with {{block(Program)}}.




The value of {{property(ProgramLocation)}} **MUST** be a `string`.


#### Subtypes of ProgramLocation

* `ACTIVE`

    identity of the logic or motion program currently executing.
    
* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.
    
* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.
    

### ProgramLocationType

defines whether the logic or motion program defined by {{block(Program)}} is being executed from the local memory of the controller or from an outside source.




The value of {{property(ProgramLocationType)}} **MUST** be a `string`.


#### Subtypes of ProgramLocationType

* `ACTIVE`

    identity of the logic or motion program currently executing.
    
* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.
    
* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.
    

### ProgramNestLevel

indication of the nesting level within a control program that is associated with the code or instructions that is currently being executed.

If an initial value is not defined, the nesting level associated with the highest or initial nesting level of the program **MUST** default to zero (0).



The value of {{property(ProgramNestLevel)}} **MUST** be a `integer`.

### RotaryMode

current operating mode for a {{block(Rotary)}} type axis.




The value of {{property(RotaryMode)}} **MUST** be one of the `RotaryModeEnum` enumeration. 

`RotaryModeEnum` Enumeration:


* `SPINDLE` 

    axis is functioning as a spindle.

* `INDEX` 

    axis is configured to index.

* `CONTOUR` 

    position of the axis is being interpolated.

### RotaryVelocityOverride

percentage change to the velocity of the programmed velocity for a {{block(Rotary)}} axis.

This command represents a percentage change to the velocity calculated by a logic or motion program or set by a switch for a {{block(Rotary)}} type axis.


The value of {{property(RotaryVelocityOverride)}} **MUST** be a `float`.

### Rotation

three space angular rotation relative to a coordinate system.




The {{property(units)}} of {{property(Rotation)}} **MUST** be `DEGREE_3D`.

### SensorAttachment

{{term(attachment)}} between a sensor and an entity.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `SensorAttachmentResult` keys.

`SensorAttachmentResult` keys:

* `SENSOR_ID` 

    The identity of a sensor used to observe some measurement of an item.
    The value of `SENSOR_ID` **MUST** be a `string`.


* `result` 

    
    The value of `result` **MUST** be a `string`.


### SerialNumber

serial number that uniquely identifies a specific part.




The value of {{property(SerialNumber)}} **MUST** be a `string`.


### SpecificationLimit

set of limits defining a range of values designating acceptable performance for a variable.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `SpecificationLimitResult` keys.

`SpecificationLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `UPPER_LIMIT` **MUST** be a `float`.


* `NOMINAL` 

    ideal or desired value for a variable.
    The value of `NOMINAL` **MUST** be a `float`.


* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `LOWER_LIMIT` **MUST** be a `float`.


### SpindleInterlock

indication of the status of the spindle for a piece of equipment when power has been removed and it is free to rotate.




The value of {{property(SpindleInterlock)}} **MUST** be one of the `SpindleInterlockEnum` enumeration. 

`SpindleInterlockEnum` Enumeration:


* `ACTIVE` 

    power has been removed and the spindle cannot be operated.

* `INACTIVE` 

    spindle has not been deactivated.

### ToolAssetId

identifier of an individual tool asset.




The value of {{property(ToolAssetId)}} **MUST** be a `string`.


### ToolGroup

identifier for the tool group associated with a specific tool. Commonly used to designate spare tools.




The value of {{property(ToolGroup)}} **MUST** be a `string`.


### ToolId

identifier of the tool currently in use for a given `Path`.

**DEPRECATED** in *Version 1.2.0*.   See `TOOL_ASSET_ID`.




The value of {{property(ToolId)}} **MUST** be a `string`.


### ToolNumber

identifier assigned by the {{block(Controller)}} component to a cutting tool when in use by a piece of equipment.




The value of {{property(ToolNumber)}} **MUST** be a `string`.


### ToolOffset

reference to the tool offset variables applied to the active cutting tool associated with a {{block(Path)}} in a {{block(Controller)}} type component.




The value of {{property(ToolOffset)}} **MUST** be a `float`.

#### Subtypes of ToolOffset

* `LENGTH`

    reference to a length type tool offset variable.
    
* `RADIAL`

    reference to a radial type tool offset variable.
    

### TransferCount

accumulation of the number of times an operation has attempted to, or is planned to attempt to, transfer materials, parts, or other items from one location to another.




The value of {{property(TransferCount)}} **MUST** be a `string`.


#### Subtypes of TransferCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### Translation

three space linear translation relative to a coordinate system.




The {{property(units)}} of {{property(Translation)}} **MUST** be `MILLIMETER_3D`.

### UnloadCount

accumulation of the number of times an operation has attempted to, or is planned to attempt to, unload materials, parts, or other items.




The value of {{property(UnloadCount)}} **MUST** be a `string`.


#### Subtypes of UnloadCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### User

identifier of the person currently responsible for operating the piece of equipment.




The value of {{property(User)}} **MUST** be a `string`.


#### Subtypes of User

* `MAINTENANCE`

    identifier of the person currently responsible for performing maintenance on the piece of equipment.
    
* `OPERATOR`

    identifier of the person currently responsible for operating the piece of equipment.
    
* `SET_UP`

    identifier of the person currently responsible for preparing a piece of equipment for production or restoring the piece of equipment to a neutral state after production.
    

### ValveState

state of a valve is one of open, closed, or transitioning between the states.




The value of {{property(ValveState)}} **MUST** be one of the `ValveStateEnum` enumeration. 

`ValveStateEnum` Enumeration:


* `OPEN` 

    {{block(ValveState)}} where flow is allowed and the aperture is static.
    
    > Note: For a binary value, `OPEN` indicates the valve has the maximum possible aperture.

* `OPENING` 

    valve is transitioning from a `CLOSED` state to an `OPEN` state.

* `CLOSED` 

    {{block(ValveState)}} where flow is not possible, the aperture is static, and the valve is completely shut.

* `CLOSING` 

    valve is transitioning from an `OPEN` state to a `CLOSED` state.

#### Subtypes of ValveState

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
    
    

### Variable

data whose meaning may change over time due to changes in the operation of a piece of equipment or the process being executed on that piece of equipment.




The value of {{property(Variable)}} **MUST** be a `string`.


### WaitState

indication of the reason that {{block(Execution)}} is reporting a value of `WAIT`.




The value of {{property(WaitState)}} **MUST** be one of the `WaitStateEnum` enumeration. 

`WaitStateEnum` Enumeration:


* `POWERING_UP` 

    execution is waiting while the equipment is powering up and is not currently available to begin producing parts or products.

* `POWERING_DOWN` 

    execution is waiting while the equipment is powering down but has not fully reached a stopped state.

* `PART_LOAD` 

    execution is waiting while one or more discrete workpieces are being loaded.

* `PART_UNLOAD` 

    execution is waiting while one or more discrete workpieces are being unloaded.

* `TOOL_LOAD` 

    execution is waiting while a tool or tooling is being loaded.

* `TOOL_UNLOAD` 

    execution is waiting while a tool or tooling is being unloaded.

* `MATERIAL_LOAD` 

    execution is waiting while material is being loaded.

* `MATERIAL_UNLOAD` 

    execution is waiting while material is being unloaded.

* `SECONDARY_PROCESS` 

    execution is waiting while another process is completed before the execution can resume.

* `PAUSING` 

    execution is waiting while the equipment is pausing but the piece of equipment has not yet reached a fully paused state.

* `RESUMING` 

    execution is waiting while the equipment is resuming the production cycle but has not yet resumed execution.

### Wire

identifier for the type of wire used as the cutting mechanism in Electrical Discharge Machining or similar processes.




The value of {{property(Wire)}} **MUST** be a `string`.


### WorkOffset

offset variables for a work piece or part associated with a {{block(Path)}} in a {{block(Controller)}} type component.




The value of {{property(WorkOffset)}} **MUST** be a `float`.

### WorkholdingId

identifier for the current workholding or part clamp in use by a piece of equipment.




The value of {{property(WorkholdingId)}} **MUST** be a `string`.

