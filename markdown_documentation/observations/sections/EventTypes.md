
## Event Types

This section provides semantic information for {{block(Event)}} types.

### ActivationCount

{{def(EventEnum:ACTIVATION_COUNT)}}



The default {{property(subType)}} of {{property(ActivationCount)}} is `ALL`.

The value of {{property(ActivationCount)}} **MUST** be `integer`.

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

{{def(EventEnum:ACTIVE_AXES)}}



The value of {{property(ActiveAxes)}} **MUST** be a list of `string` of size `0..*`.

### ActuatorState

{{def(EventEnum:ACTUATOR_STATE)}}



`ActuatorStateEnum` Enumeration:

* `ACTIVE` 

    {{block(Actuator)}} is operating.

* `INACTIVE` 

    {{block(Actuator)}} is not operating.

### AdapterSoftwareVersion

{{def(EventEnum:ADAPTER_SOFTWARE_VERSION)}}



### AdapterURI

{{def(EventEnum:ADAPTER_URI)}}



### `<<deprecated>>`Alarm

{{def(EventEnum:ALARM)}}



#### Value Properties of Alarm

{{tbl(value-properties-of-alarm)}} lists the Value Properties of {{block(Alarm)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|`<<deprecated>>` {{property(code)}}|`AlarmCodeEnum`|1|
|`<<deprecated>>` {{property(severity)}}|`AlarmSeverityEnum`|1|
|`<<deprecated>>` {{property(nativeCode)}}|`string`|1|
|`<<deprecated>>` {{property(state)}}|`AlarmStateEnum`|1|
|`<<deprecated>>` {{property(lang)}}|`xslang`|0..1|
{: caption="Value Properties of Alarm" label="table:value-properties-of-alarm"}

Descriptions for Value Properties of {{block(Alarm)}}:

* `<<deprecated>>` {{property(code)}} 

    type of alarm.

* `<<deprecated>>` {{property(severity)}} 

    severity of the alarm.

* `<<deprecated>>` {{property(nativeCode)}} 

    native code for the piece of equipment.

* `<<deprecated>>` {{property(state)}} 

    state of the alarm.

* `<<deprecated>>` {{property(lang)}} 

    specifies the language of the alarm text.
    
    See {{cite(IETF RFC 4646)}} (http://www.ietf.org/rfc/rfc4646.txt).

### AlarmLimit

{{def(EventEnum:ALARM_LIMIT)}}



The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `AlarmLimitResult` keys.

`AlarmLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    

    The value of {{property(UPPER_LIMIT)}} **MUST** be `float`.

* `UPPER_WARNING` 

    upper boundary indicating increased concern and supervision may be required.

    The value of {{property(UPPER_WARNING)}} **MUST** be `float`.

* `LOWER_WARNING` 

    lower boundary indicating increased concern and supervision may be required.

    The value of {{property(LOWER_WARNING)}} **MUST** be `float`.

* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    

    The value of {{property(LOWER_LIMIT)}} **MUST** be `float`.

### Application

{{def(EventEnum:APPLICATION)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of Application

* `INSTALL_DATE`

    date the hardware or software was installed.

    

    The value of {{property(Application)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `LICENSE`

    license code to validate or activate the hardware or software.

    

* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 

    

* `RELEASE_DATE`

    date the hardware or software was released for general use. 

    

    The value of {{property(Application)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `VERSION`

    version of the hardware or software.

    

### AssetChanged

{{def(EventEnum:ASSET_CHANGED)}}



#### Value Properties of AssetChanged

{{tbl(value-properties-of-assetchanged)}} lists the Value Properties of {{block(AssetChanged)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(assetType)}}|`string`|1|
{: caption="Value Properties of AssetChanged" label="table:value-properties-of-assetchanged"}

Descriptions for Value Properties of {{block(AssetChanged)}}:

* {{property(assetType)}} 

    type of {{block(Asset)}} changed. See {{package(Asset Information Model)}} for details on the {{block(Asset)}} model.

### AssetCount

{{def(EventEnum:ASSET_COUNT)}}



The value of {{property(AssetCount)}} **MUST** be `integer`.

### AssetRemoved

{{def(EventEnum:ASSET_REMOVED)}}



#### Value Properties of AssetRemoved

{{tbl(value-properties-of-assetremoved)}} lists the Value Properties of {{block(AssetRemoved)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(assetType)}}|`string`|1|
{: caption="Value Properties of AssetRemoved" label="table:value-properties-of-assetremoved"}

Descriptions for Value Properties of {{block(AssetRemoved)}}:

* {{property(assetType)}} 

    type of {{block(Asset)}} removed. See {{package(Asset Information Model)}} for details on the {{block(Asset)}} model.

### Availability

{{def(EventEnum:AVAILABILITY)}}



`AvailabilityEnum` Enumeration:

* `AVAILABLE` 

    data source is active and capable of providing data.

* `UNAVAILABLE` 

    data source is either inactive or not capable of providing data.

### AxisCoupling

{{def(EventEnum:AXIS_COUPLING)}}



`AxisCouplingEnum` Enumeration:

* `MASTER` 

    axis is the master of the {{block(CoupledAxes)}}.

* `SLAVE` 

    axis is a slave to the {{block(CoupledAxes)}}.

* `SYNCHRONOUS` 

    axes are not physically connected to each other but are operating together in lockstep.

* `TANDEM` 

    axes are physically connected to each other and operate as a single unit.

### AxisFeedrateOverride

{{def(EventEnum:AXIS_FEEDRATE_OVERRIDE)}}



The value of {{property(AxisFeedrateOverride)}} **MUST** be `float`.

#### Subtypes of AxisFeedrateOverride

* `JOG`

    relating to momentary activation of a function or a movement.
    
    **DEPRECATION WARNING**: May be deprecated in the future.

    
    When the `JOG` subtype of `AxisFeedrateOverride` is applied, the resulting commanded feedrate for the axis is limited to the value of the original `JOG` subtype of the `AxisFeedrate` multiplied by the value of the `JOG` subtype of
    `AxisFeedrateOverride`.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

* `RAPID`

    performing an operation faster or in less time than nominal rate.

    

### AxisInterlock

{{def(EventEnum:AXIS_INTERLOCK)}}



`AxisInterlockEnum` Enumeration:

* `ACTIVE` 

    axis lockout function is activated, power has been removed from the axis, and the axis is allowed to move freely.

* `INACTIVE` 

    axis lockout function has not been activated, the axis may be powered, and the axis is capable of being controlled by another component.

### AxisState

{{def(EventEnum:AXIS_STATE)}}



`AxisStateEnum` Enumeration:

* `HOME` 

    axis is in its home position.

* `PARKED` 

    axis has been moved to a fixed position and is being maintained in that position either electrically or mechanically. 
    
    Action is required to release the axis from this position.

* `STOPPED` 

    axis is stopped.

* `TRAVEL` 

    axis is in motion.

### Block

{{def(EventEnum:BLOCK)}}



### BlockCount

{{def(EventEnum:BLOCK_COUNT)}}



The value of {{property(BlockCount)}} **MUST** be `integer`.

### ChuckInterlock

{{def(EventEnum:CHUCK_INTERLOCK)}}



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

{{def(EventEnum:CHUCK_STATE)}}



`ChuckStateEnum` Enumeration:

* `CLOSED` 

    {{block(Chuck)}} is closed to the point of a positive confirmation.

* `OPEN` 

    {{block(Chuck)}} is open to the point of a positive confirmation.

* `UNLATCHED` 

    {{block(Chuck)}} is not closed to the point of a positive confirmation and not open to the point of a positive confirmation. 
    
    It is in an intermediate position.

### ClockTime

{{def(EventEnum:CLOCK_TIME)}}



The value of {{property(ClockTime)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

### `<<deprecated>>`Code

{{def(EventEnum:CODE)}}



### CompositionState

{{def(EventEnum:COMPOSITION_STATE)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of CompositionState

* `ACTION`

    indication of the operating state of a mechanism.

    

    `CompositionStateActionEnum` Enumeration:

    * `ACTIVE` 

        {{block(Composition)}} is operating.

    * `INACTIVE` 

        {{block(Composition)}} is not operating.

* `LATERAL`

    indication of the position of a mechanism that may move in a lateral direction.   

    

    `CompositionStateLateralEnum` Enumeration:

    * `LEFT` 

        position of the {{block(Composition)}} is oriented to the left to the point of a positive confirmation.

    * `RIGHT` 

        position of the {{block(Composition)}} is oriented to the right to the point of a positive confirmation.

    * `TRANSITIONING` 

        position of the {{block(Composition)}} is not oriented to the right to the point of a positive confirmation and is not oriented to the left to the point of a positive confirmation. 
        
        It is in an intermediate position.

* `MOTION`

    indication of the open or closed state of a mechanism.
    

    

    `CompositionStateMotionEnum` Enumeration:

    * `CLOSED` 

        position of the {{block(Composition)}} is closed to the point of a positive confirmation.

    * `OPEN` 

        position of the {{block(Composition)}} is open to the point of a positive confirmation.

    * `UNLATCHED` 

        position of the {{block(Composition)}} is not open to the
        point of a positive confirmation and is not closed to the point of a positive confirmation. 
        
        It is in an intermediate position.

* `SWITCHED`

    indication of the activation state of a mechanism.

    

    `CompositionStateSwitchedEnum` Enumeration:

    * `OFF` 

        activation state of the {{block(Composition)}} is in an `OFF` condition, it is not operating, or it is not powered.

    * `ON` 

        activation state of the {{block(Composition)}} is in an `ON` condition, it is operating, or it is powered.

* `VERTICAL`

    indication of the position of a mechanism that may move in a vertical direction.

    

    `CompositionStateVerticalEnum` Enumeration:

    * `DOWN` 

        position of the {{block(Composition)}} element is oriented in a downward direction to the point of a positive confirmation.

    * `TRANSITIONING` 

        position of the {{block(Composition)}} element is not oriented in an upward direction to the point of a positive confirmation and is not oriented in a downward direction to the point of a positive confirmation. 
        
        It is in an intermediate position.

    * `UP` 

        position of the {{block(Composition)}} element is oriented in an upward direction to the point of a positive confirmation.

### ConnectionStatus

{{def(EventEnum:CONNECTION_STATUS)}}



`ConnectionStatusEnum` Enumeration:

* `CLOSED` 

    no connection at all.

* `ESTABLISHED` 

    open connection.
    
    The normal state for the data transfer phase of the connection.

* `LISTEN` 

    {{term(agent)}} is waiting for a connection request from an {{term(adapter)}}.

### ControlLimit

{{def(EventEnum:CONTROL_LIMIT)}}



The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `ControlLimitResult` keys.

`ControlLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    

    The value of {{property(UPPER_LIMIT)}} **MUST** be `float`.

* `UPPER_WARNING` 

    upper boundary indicating increased concern and supervision may be required.

    The value of {{property(UPPER_WARNING)}} **MUST** be `float`.

* `NOMINAL` 

    ideal or desired value for a variable.

    The value of {{property(NOMINAL)}} **MUST** be `float`.

* `LOWER_WARNING` 

    lower boundary indicating increased concern and supervision may be required.

    The value of {{property(LOWER_WARNING)}} **MUST** be `float`.

* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    

    The value of {{property(LOWER_LIMIT)}} **MUST** be `float`.

### ControllerMode

{{def(EventEnum:CONTROLLER_MODE)}}



`ControllerModeEnum` Enumeration:

* `AUTOMATIC` 

    {{block(Controller)}} is configured to automatically execute a program.

* `EDIT` 

    {{block(Controller)}} is currently functioning as a programming device and is not capable of executing an active program.

* `<<deprecated>>` `FEED_HOLD` 

    axes of the device are commanded to stop, but the spindle continues to function.

* `MANUAL` 

    {{block(Controller)}} is not executing an active program. 
    
    It is capable of receiving instructions from an external source – typically an operator. The {{block(Controller)}} executes operations based on the instructions received from the external source.

* `MANUAL_DATA_INPUT` 

    operator can enter a series of operations for the {{block(Controller)}} to perform.
    
    The {{block(Controller)}} will execute this specific series of operations and then stop.

* `SEMI_AUTOMATIC` 

    {{block(Controller)}} is operating in a mode that restricts the active program from processing its next process step without operator intervention.

### ControllerModeOverride

{{def(EventEnum:CONTROLLER_MODE_OVERRIDE)}}



`ControllerModeOverrideEnum` Enumeration:

* `OFF` 

    {{block(ControllerModeOverride)}} is in the `OFF` state and the mode override is inactive.

* `ON` 

    {{block(ControllerModeOverride)}} is in the `ON` state and the mode override is active.

A {{property(subType)}} **MUST** always be specified.

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

{{def(EventEnum:COUPLED_AXES)}}



The value of {{property(CoupledAxes)}} **MUST** be a list of `string` of size `0..*`.

### CycleCount

{{def(EventEnum:CYCLE_COUNT)}}



The default {{property(subType)}} of {{property(CycleCount)}} is `ALL`.

The value of {{property(CycleCount)}} **MUST** be `integer`.

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

{{def(EventEnum:DATE_CODE)}}



The value of {{property(DateCode)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

#### Subtypes of DateCode

* `EXPIRATION`

    time and date code relating to the expiration or end of useful life for a material or other physical item.

    

* `FIRST_USE`

    time and date code relating the first use of a material or other physical item.

    

* `MANUFACTURE`

    time and date code relating to the production of a material or other physical item.

    

### DeactivationCount

{{def(EventEnum:DEACTIVATION_COUNT)}}



The default {{property(subType)}} of {{property(DeactivationCount)}} is `ALL`.

The value of {{property(DeactivationCount)}} **MUST** be `integer`.

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

{{def(EventEnum:DEVICE_ADDED)}}



### DeviceChanged

{{def(EventEnum:DEVICE_CHANGED)}}



### DeviceRemoved

{{def(EventEnum:DEVICE_REMOVED)}}



### DeviceUuid

{{def(EventEnum:DEVICE_UUID)}}



### Direction

{{def(EventEnum:DIRECTION)}}



`<<deprecated>>` `DirectionEnum` Enumeration:

* `<<deprecated>>` `CLOCKWISE` 

    clockwise rotation using the right-hand rule.

* `<<deprecated>>` `COUNTER_CLOCKWISE` 

    counter-clockwise rotation using the right-hand rule.

* `<<deprecated>>` `NEGATIVE` 

    

* `<<deprecated>>` `POSITIVE` 

    

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of Direction

* `LINEAR`

    direction of motion of a linear motion.

    

    `DirectionLinearEnum` Enumeration:

    * `NEGATIVE` 

        linear position is decreasing.

    * `NONE` 

        no direction.

    * `POSITIVE` 

        linear position is increasing.

* `ROTARY`

    rotational direction of a rotary motion using the right hand rule convention.

    

    `DirectionRotaryEnum` Enumeration:

    * `CLOCKWISE` 

        clockwise rotation using the right-hand rule.

    * `COUNTER_CLOCKWISE` 

        counter-clockwise rotation using the right-hand rule.

    * `NONE` 

        no direction.

### DoorState

{{def(EventEnum:DOOR_STATE)}}



`DoorStateEnum` Enumeration:

* `CLOSED` 

    {{block(Door)}} is closed to the point of a positive confirmation.

* `OPEN` 

    {{block(Door)}} is open to the point of a positive confirmation.

* `UNLATCHED` 

    {{block(Door)}} is not closed to the point of a positive confirmation and not open to the point of a positive confirmation. 
    
    It is in an intermediate position.

### EmergencyStop

{{def(EventEnum:EMERGENCY_STOP)}}



`EmergencyStopEnum` Enumeration:

* `ARMED` 

    emergency stop circuit is complete and the piece of equipment, component, or composition is allowed to operate. 

* `TRIGGERED` 

    operation of the piece of equipment, component, or composition is inhibited.

### EndOfBar

{{def(EventEnum:END_OF_BAR)}}



`EndOfBarEnum` Enumeration:

* `NO` 

    {{block(EndOfBar)}} has not been reached.

* `YES` 

    {{block(EndOfBar)}} has been reached.

The default {{property(subType)}} of {{property(EndOfBar)}} is `PRIMARY`.

#### Subtypes of EndOfBar

* `AUXILIARY`

    when multiple locations on a piece of bar stock are referenced as the indication for the {{block(EndOfBar)}}, the additional location(s) **MUST** be designated as `AUXILIARY` indication(s) for the {{block(EndOfBar)}}.  

    

* `PRIMARY`

    specific applications **MAY** reference one or more locations on a piece of bar stock as the indication for the {{block(EndOfBar)}}. 
    
    The main or most important location **MUST** be designated as the {{block(PRIMARY)}} indication for the {{block(EndOfBar)}}.
    
    If no {{block(subType)}} is specified, {{block(PRIMARY)}} **MUST** be the default {{block(EndOfBar)}} indication.

    

### EquipmentMode

{{def(EventEnum:EQUIPMENT_MODE)}}



`EquipmentModeEnum` Enumeration:

* `OFF` 

    equipment is not functioning in the mode designated by the `subType`.

* `ON` 

    equipment is functioning in the mode designated by the `subType`.

A {{property(subType)}} **MUST** always be specified.

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

    indication that a piece of equipment is performing any activity, the equipment is active and performing a function under load or not.
    
    Example: For traditional machine tools, this includes when the piece of equipment is `LOADED`, making rapid moves, executing a tool change, etc.

    

### Execution

{{def(EventEnum:EXECUTION)}}



`ExecutionEnum` Enumeration:

* `ACTIVE` 

    {{block(Component)}} is actively executing an instruction.

* `FEED_HOLD` 

    motion of the active axes are commanded to stop at their current position.

* `INTERRUPTED` 

    {{block(Component)}} suspends the execution of the program due to an external signal.
    
    Action is required to resume execution.

* `OPTIONAL_STOP` 

    command from the program has intentionally interrupted execution.
    
    The {{block(Component)}} **MAY** have another state that indicates if the execution is interrupted or the execution ignores the interrupt instruction.

* `PROGRAM_COMPLETED` 

    program completed execution.

* `PROGRAM_STOPPED` 

    command from the program has intentionally interrupted execution.
    
    Action is required to resume execution.

* `READY` 

    {{block(Component)}} is ready to execute instructions.
    
    It is currently idle.

* `STOPPED` 

    {{block(Component)}} program is not `READY` to execute.

* `WAIT` 

    {{block(Component)}} suspends execution while a secondary operation executes.
    
    Execution resumes automatically once the secondary operation completes.

### Firmware

{{def(EventEnum:FIRMWARE)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of Firmware

* `INSTALL_DATE`

    date the hardware or software was installed.

    

    The value of {{property(Firmware)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `LICENSE`

    license code to validate or activate the hardware or software.

    

* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 

    

* `RELEASE_DATE`

    date the hardware or software was released for general use. 

    

    The value of {{property(Firmware)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `VERSION`

    version of the hardware or software.

    

### FixtureId

{{def(EventEnum:FIXTURE_ID)}}



### FunctionalMode

{{def(EventEnum:FUNCTIONAL_MODE)}}



`FunctionalModeEnum` Enumeration:

* `MAINTENANCE` 

    {{block(Component)}} is not currently producing product.
    
    It is currently being repaired, waiting to be repaired, or has not yet been returned to a normal production status after maintenance has been performed.

* `PROCESS_DEVELOPMENT` 

    {{block(Component)}} is being used to prove-out a new process, testing of equipment or processes, or any other active use that does not result in the production of product.

* `PRODUCTION` 

    {{block(Component)}} is currently producing product, ready to produce product, or its current intended use is to be producing product.

* `SETUP` 

    {{block(Component)}} is not currently producing product. 
    
    It is being prepared or modified to begin production of product.

* `TEARDOWN` 

    {{block(Component)}} is not currently producing product.
    
    Typically, it has completed the production of a product and is being modified or returned to a neutral state such that it may then be prepared to begin production of a different product.

### Hardness

{{def(EventEnum:HARDNESS)}}



The value of {{property(Hardness)}} **MUST** be `float`.

A {{property(subType)}} **MUST** always be specified.

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

{{def(EventEnum:HARDWARE)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of Hardware

* `INSTALL_DATE`

    date the hardware or software was installed.

    

    The value of {{property(Hardware)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `LICENSE`

    license code to validate or activate the hardware or software.

    

* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 

    

* `RELEASE_DATE`

    date the hardware or software was released for general use. 

    

    The value of {{property(Hardware)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `VERSION`

    version of the hardware or software.

    

### Library

{{def(EventEnum:LIBRARY)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of Library

* `INSTALL_DATE`

    date the hardware or software was installed.

    

    The value of {{property(Library)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `LICENSE`

    license code to validate or activate the hardware or software.

    

* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 

    

* `RELEASE_DATE`

    date the hardware or software was released for general use. 

    

    The value of {{property(Library)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `VERSION`

    version of the hardware or software.

    

### `<<deprecated>>`Line

{{def(EventEnum:LINE)}}



#### Subtypes of Line

* `MAXIMUM`

    maximum line number of the code being executed.

    

* `MINIMUM`

    minimum line number of the code being executed.

    

### LineLabel

{{def(EventEnum:LINE_LABEL)}}



### LineNumber

{{def(EventEnum:LINE_NUMBER)}}



The value of {{property(LineNumber)}} **MUST** be `integer`.

#### Subtypes of LineNumber

* `ABSOLUTE`

    position of a block of program code relative to the beginning of the control program.

    

* `INCREMENTAL`

    position of a block of program code relative to the occurrence of the last {{block(LineLabel)}} encountered in the control program.

    

### LoadCount

{{def(EventEnum:LOAD_COUNT)}}



The default {{property(subType)}} of {{property(LoadCount)}} is `ALL`.

The value of {{property(LoadCount)}} **MUST** be `integer`.

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

{{def(EventEnum:LOCK_STATE)}}



`LockStateEnum` Enumeration:

* `LOCKED` 

    mechanism is engaged and preventing the associated {{block(Component)}} from being opened or operated.

* `UNLOCKED` 

    mechanism is disengaged and the associated {{block(Component)}} is able to be opened or operated.

### MTConnectVersion

{{def(EventEnum:MTCONNECT_VERSION)}}



### MaintenanceList

{{def(EventEnum:MAINTENANCE_LIST)}}

If the {{property(INTERVAL)}} {{property(key)}} is not provided, it is assumed `ABSOLUTE`.

If the {{property(DIRECTION)}} {{property(key)}} is not provided, it is assumed `UP`.

If the {{property(UNITS)}} {{property(key)}} is not provided, it is assumed to be `COUNT`.



The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `MaintenanceListResult` keys.

`MaintenanceListResult` keys:

* `VALUE` 

    current interval value of the activity.

    The value of {{property(VALUE)}} **MUST** be `float`.

* `INTERVAL` 

    interval of the value observed.

    `MaintenanceListIntervalEnum` Enumeration:

    * `ABSOLUTE` 

        

    * `INCREMENTAL` 

        

* `NEXT_SERVICE_DATE` 

    next date/time stamp that maintenance should be performed.

    The value of {{property(NEXT_SERVICE_DATE)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

* `RESET` 

    last date/time stamp of the {{term(observation)}} was reset.

    The value of {{property(RESET)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

* `SEVERITY` 

    level of severity on a scale of 1-10.

    The value of {{property(SEVERITY)}} **MUST** be `integer`.

* `DIRECTION` 

    direction of the value observed.

    `MaintenanceListDirectionEnum` Enumeration:

    * `DOWN` 

        

    * `UP` 

        

* `NAME` 

    identifier of the maintenance activity.

    The value of {{property(NAME)}} **MUST** be `string`.

* `LAST_SERVICE_DATE` 

    last date/time stamp that maintenance was performed.

    The value of {{property(LAST_SERVICE_DATE)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

* `UNITS` 

    same as {{block(DataItem)}} {{property(units)}}. See {{package(Device Information Model)}}.

    The value of {{property(UNITS)}} **MUST** be one of the `UnitEnum` enumeration. 

* `TARGET` 

    target value of the next maintenance.

    The value of {{property(TARGET)}} **MUST** be `float`.

### Material

{{def(EventEnum:MATERIAL)}}



### MaterialLayer

{{def(EventEnum:MATERIAL_LAYER)}}



The value of {{property(MaterialLayer)}} **MUST** be `integer`.

#### Subtypes of MaterialLayer

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `TARGET`

    goal of the operation or process.

    

### Message

{{def(EventEnum:MESSAGE)}}



### Network

{{def(EventEnum:NETWORK)}}



A {{property(subType)}} **MUST** always be specified.

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

    

    `NetworkWirelessEnum` Enumeration:

    * `NO` 

        

    * `YES` 

        

### OperatingMode

{{def(EventEnum:OPERATING_MODE)}}



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

{{def(EventEnum:OPERATING_SYSTEM)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of OperatingSystem

* `INSTALL_DATE`

    date the hardware or software was installed.

    

    The value of {{property(OperatingSystem)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `LICENSE`

    license code to validate or activate the hardware or software.

    

* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 

    

* `RELEASE_DATE`

    date the hardware or software was released for general use. 

    

    The value of {{property(OperatingSystem)}} **MUST** be `dateTime`. See {{sect(datetime)}}.

    `dateTime` Enumeration:

* `VERSION`

    version of the hardware or software.

    

### OperatorId

{{def(EventEnum:OPERATOR_ID)}}



### PalletId

{{def(EventEnum:PALLET_ID)}}



### PartCount

{{def(EventEnum:PART_COUNT)}}



The value of {{property(PartCount)}} **MUST** be `integer`.

The default {{property(subType)}} of {{property(PartCount)}} is `ALL`.

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

    

### PartCountType

{{def(EventEnum:PART_COUNT_TYPE)}}



`PartCountTypeEnum` Enumeration:

* `BATCH` 

    pre-specified group of items.

* `EACH` 

    count is of individual items.

### PartDetect

{{def(EventEnum:PART_DETECT)}}



`PartDetectEnum` Enumeration:

* `NOT_PRESENT` 

    part or work piece is not detected or is not present.

* `PRESENT` 

    part or work piece is detected or is present.

### PartGroupId

{{def(EventEnum:PART_GROUP_ID)}}

If no {{property(subType)}} is specified, `UUID` is default.



The default {{property(subType)}} of {{property(PartGroupId)}} is `UUID`.

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

{{def(EventEnum:PART_ID)}}



### PartKindId

{{def(EventEnum:PART_KIND_ID)}}

If no {{property(subType)}} is specified, `UUID` is default.



The default {{property(subType)}} of {{property(PartKindId)}} is `UUID`.

#### Subtypes of PartKindId

* `PART_FAMILY`

    identifier given to a group of parts having similarities in geometry, manufacturing process, and/or functions.

    

* `PART_NAME`

    word or set of words by which a part is known, addressed, or referred to.

    

* `PART_NUMBER`

    identifier of a particular part design or model.

    

* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.

    

### `<<deprecated>>`PartNumber

{{def(EventEnum:PART_NUMBER)}}



### PartProcessingState

{{def(EventEnum:PART_PROCESSING_STATE)}}



`PartProcessingStateEnum` Enumeration:

* `IN_PROCESS` 

    part occurrence is actively being processed.

* `IN_TRANSIT` 

    part occurrence is being transported to its destination.

* `NEEDS_PROCESSING` 

    part occurrence is not actively being processed, but the processing has not ended. 
    
    Processing requirements exist that have not yet been fulfilled. This is the default entry state when the part occurrence is originally received. In some cases, the part occurrence may return to this state while it waits for additional processing to be performed.

* `PROCESSING_ENDED` 

    part occurrence is no longer being processed. 
    
    A general state when the reason for termination is unknown.

* `PROCESSING_ENDED_ABORTED` 

    processing of the part occurrence has come to a premature end.

* `PROCESSING_ENDED_COMPLETE` 

    part occurrence has completed processing successfully.

* `PROCESSING_ENDED_LOST` 

    terminal state when the part occurrence has been removed from the equipment by an external entity and it no longer exists at the equipment.

* `PROCESSING_ENDED_REJECTED` 

    part occurrence has been processed completely. However, the processing may have a problem.

* `PROCESSING_ENDED_SKIPPED` 

    part occurrence has been skipped for processing on the piece of equipment.

* `PROCESSING_ENDED_STOPPED` 

    process has been stopped during the processing. 
    
    The part occurrence will require special treatment.

* `TRANSIT_COMPLETE` 

    part occurrence has been placed at its designated destination.

* `WAITING_FOR_TRANSIT` 

    part occurrence is waiting for transit.

### PartStatus

{{def(EventEnum:PART_STATUS)}}

If unique identifier is given, part status is for that individual. If group identifier is given without a unique identifier, then the status is assumed to be for the whole group.



`PartStatusEnum` Enumeration:

* `FAIL` 

    part does not conform to some given requirements.

* `PASS` 

    part conforms to given requirements.

### PartUniqueId

{{def(EventEnum:PART_UNIQUE_ID)}}

If no {{property(subType)}} is specified, `UUID` is default.



The default {{property(subType)}} of {{property(PartUniqueId)}} is `UUID`.

#### Subtypes of PartUniqueId

* `RAW_MATERIAL`

    material that is used to produce parts.

    

* `SERIAL_NUMBER`

    serial number that uniquely identifies a specific part.

    

* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.

    

### PathFeedrateOverride

{{def(EventEnum:PATH_FEEDRATE_OVERRIDE)}}



The value of {{property(PathFeedrateOverride)}} **MUST** be `float`.

#### Subtypes of PathFeedrateOverride

* `JOG`

    relating to momentary activation of a function or a movement.
    
    **DEPRECATION WARNING**: May be deprecated in the future.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

* `RAPID`

    performing an operation faster or in less time than nominal rate.

    

### PathMode

{{def(EventEnum:PATH_MODE)}}



`PathModeEnum` Enumeration:

* `INDEPENDENT` 

    path is operating independently and without the influence of another path.

* `MASTER` 

    path provides information or state values that influences the operation of other {{block(DataItem)}} of similar type.

* `MIRROR` 

    axes associated with the path are mirroring the motion of the `MASTER` path.

* `SYNCHRONOUS` 

    physical or logical parts which are not physically connected to each other but are operating together.

### PowerState

{{def(EventEnum:POWER_STATE)}}



`PowerStateEnum` Enumeration:

* `OFF` 

    source of energy for an entity or the enabling signal providing permission for the entity to perform its function(s) is not present or is disconnected.

* `ON` 

    source of energy for an entity or the enabling signal providing permission for the entity to perform its function(s) is present and active.

#### Subtypes of PowerState

* `CONTROL`

    state of the enabling signal or control logic that enables or disables the function or operation of the entity.

    

* `LINE`

    state of the power source for the entity.

    

### `<<deprecated>>`PowerStatus

{{def(EventEnum:POWER_STATUS)}}



`<<deprecated>>` `PowerStatusEnum` Enumeration:

* `<<deprecated>>` `OFF` 

    

* `<<deprecated>>` `ON` 

    

### ProcessAggregateId

{{def(EventEnum:PROCESS_AGGREGATE_ID)}}



#### Subtypes of ProcessAggregateId

* `ORDER_NUMBER`

    identifier of the authorization of the process occurrence. Synonyms include "job id", "work order".

    

* `PROCESS_PLAN`

    identifier of the process plan that this occurrence belongs to. Synonyms include "routing id", "job id".

    

* `PROCESS_STEP`

    identifier of the step in the process plan that this occurrence corresponds to. Synonyms include "operation id".

    

### ProcessKindId

{{def(EventEnum:PROCESS_KIND_ID)}}



#### Subtypes of ProcessKindId

* `ISO_STEP_EXECUTABLE`

    reference to a ISO 10303 Executable.

    

* `PROCESS_NAME`

    word or set of words by which a process being executed (process occurrence) by the device is known, addressed, or referred to.

    

* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.

    

### ProcessOccurrenceId

{{def(EventEnum:PROCESS_OCCURRENCE_ID)}}



#### Subtypes of ProcessOccurrenceId

* `ACTIVITY`

    phase or segment of a recipe or program.

    

* `OPERATION`

    step of a discrete manufacturing process.

    

* `RECIPE`

    process as part of product production; can be a subprocess of a larger process.

    

* `SEGMENT`

    phase of a recipe process.

    

### ProcessState

{{def(EventEnum:PROCESS_STATE)}}



`ProcessStateEnum` Enumeration:

* `ABORTED` 

    process occurrence has come to a premature end and cannot be resumed.

* `ACTIVE` 

    process occurrence is actively executing.

* `COMPLETE` 

    process occurrence is now finished.

* `INITIALIZING` 

    device is preparing to execute the process occurrence.

* `INTERRUPTED` 

    process occurrence has been stopped and may be resumed.

* `READY` 

    process occurrence is ready to be executed.

### ProcessTime

{{def(EventEnum:PROCESS_TIME)}}



#### Subtypes of ProcessTime

* `COMPLETE`

    time and date associated with the completion of an activity or event.

    

* `START`

    boundary when an activity or an event commences.

    

* `TARGET_COMPLETION`

    projected time and date associated with the end or completion of an activity or event.

    

### Program

{{def(EventEnum:PROGRAM)}}



#### Subtypes of Program

* `ACTIVE`

    identity of the logic or motion program currently executing.

    

* `ACTIVITY`

    phase or segment of a recipe or program.

    

* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.

    

* `OPERATION`

    step of a discrete manufacturing process.

    

* `RECIPE`

    process as part of product production; can be a subprocess of a larger process.

    

* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.

    

* `SEGMENT`

    phase of a recipe process.

    

### ProgramComment

{{def(EventEnum:PROGRAM_COMMENT)}}



### ProgramEdit

{{def(EventEnum:PROGRAM_EDIT)}}



`ProgramEditEnum` Enumeration:

* `ACTIVE` 

    {{block(Controller)}} is in the program edit mode.

* `NOT_READY` 

    {{block(Controller)}} is being inhibited by a function from entering the program edit mode.

* `READY` 

    {{block(Controller)}} is capable of entering the program edit mode and no function is inhibiting a change to that mode.

### ProgramEditName

{{def(EventEnum:PROGRAM_EDIT_NAME)}}



### ProgramHeader

{{def(EventEnum:PROGRAM_HEADER)}}



The default {{property(subType)}} of {{property(ProgramHeader)}} is `MAIN`.

#### Subtypes of ProgramHeader

* `ACTIVE`

    identity of the logic or motion program currently executing.

    

* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.

    

* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.

    

### ProgramLocation

{{def(EventEnum:PROGRAM_LOCATION)}}



#### Subtypes of ProgramLocation

* `ACTIVE`

    identity of the logic or motion program currently executing.

    

* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.

    

* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.

    

### ProgramLocationType

{{def(EventEnum:PROGRAM_LOCATION_TYPE)}}



`ProgramLocationTypeEnum` Enumeration:

* `EXTERNAL` 

    not managed by the controller.

* `LOCAL` 

    managed by the controller.

#### Subtypes of ProgramLocationType

* `ACTIVE`

    identity of the logic or motion program currently executing.

    

* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.

    

* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.

    

### ProgramNestLevel

{{def(EventEnum:PROGRAM_NEST_LEVEL)}}

If an initial value is not defined, the nesting level associated with the highest or initial nesting level of the program **MUST** default to zero (0).




The value of {{property(ProgramNestLevel)}} **MUST** be `integer`.

### RotaryMode

{{def(EventEnum:ROTARY_MODE)}}



`RotaryModeEnum` Enumeration:

* `CONTOUR` 

    position of the axis is being interpolated.

* `INDEX` 

    axis is configured to index.

* `SPINDLE` 

    axis is functioning as a spindle.

### RotaryVelocityOverride

{{def(EventEnum:ROTARY_VELOCITY_OVERRIDE)}}

This command represents a percentage change to the velocity calculated by a logic or motion program or set by a switch for a {{block(Rotary)}} type axis.



The value of {{property(RotaryVelocityOverride)}} **MUST** be `float`.

### Rotation

{{def(EventEnum:ROTATION)}}



The {{property(units)}} of {{property(Rotation)}} **MUST** be `DEGREE_3D`.

### SensorAttachment

{{def(EventEnum:SENSOR_ATTACHMENT)}}



The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `SensorAttachmentResult` keys.

`SensorAttachmentResult` keys:

* `SENSOR_ID` 

    The identity of a sensor used to observe some measurement of an item.

    The value of {{property(SENSOR_ID)}} **MUST** be `string`.

### SerialNumber

{{def(EventEnum:SERIAL_NUMBER)}}



### SpecificationLimit

{{def(EventEnum:SPECIFICATION_LIMIT)}}



The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `SpecificationLimitResult` keys.

`SpecificationLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    

    The value of {{property(UPPER_LIMIT)}} **MUST** be `float`.

* `NOMINAL` 

    ideal or desired value for a variable.

    The value of {{property(NOMINAL)}} **MUST** be `float`.

* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    

    The value of {{property(LOWER_LIMIT)}} **MUST** be `float`.

### SpindleInterlock

{{def(EventEnum:SPINDLE_INTERLOCK)}}



`SpindleInterlockEnum` Enumeration:

* `ACTIVE` 

    power has been removed and the spindle cannot be operated.

* `INACTIVE` 

    spindle has not been deactivated.

### ToolAssetId

{{def(EventEnum:TOOL_ASSET_ID)}}



### ToolGroup

{{def(EventEnum:TOOL_GROUP)}}



### `<<deprecated>>`ToolId

{{def(EventEnum:TOOL_ID)}}



### ToolNumber

{{def(EventEnum:TOOL_NUMBER)}}



### ToolOffset

{{def(EventEnum:TOOL_OFFSET)}}



The value of {{property(ToolOffset)}} **MUST** be `float`.

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of ToolOffset

* `LENGTH`

    reference to a length type tool offset variable.

    

* `RADIAL`

    reference to a radial type tool offset variable.

    

### TransferCount

{{def(EventEnum:TRANSFER_COUNT)}}



The default {{property(subType)}} of {{property(TransferCount)}} is `ALL`.

The value of {{property(TransferCount)}} **MUST** be `integer`.

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

{{def(EventEnum:TRANSLATION)}}



The {{property(units)}} of {{property(Translation)}} **MUST** be `MILLIMETER_3D`.

### UnloadCount

{{def(EventEnum:UNLOAD_COUNT)}}



The default {{property(subType)}} of {{property(UnloadCount)}} is `ALL`.

The value of {{property(UnloadCount)}} **MUST** be `integer`.

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

{{def(EventEnum:USER)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of User

* `MAINTENANCE`

    identifier of the person currently responsible for performing maintenance on the piece of equipment.

    

* `OPERATOR`

    identifier of the person currently responsible for operating the piece of equipment.

    

* `SET_UP`

    identifier of the person currently responsible for preparing a piece of equipment for production or restoring the piece of equipment to a neutral state after production.

    

### ValveState

{{def(EventEnum:VALVE_STATE)}}



`ValveStateEnum` Enumeration:

* `CLOSED` 

    {{block(ValveState)}} where flow is not possible, the aperture is static, and the valve is completely shut.

* `CLOSING` 

    valve is transitioning from an `OPEN` state to a `CLOSED` state.

* `OPEN` 

    {{block(ValveState)}} where flow is allowed and the aperture is static.
    
    > Note: For a binary value, `OPEN` indicates the valve has the maximum possible aperture.

* `OPENING` 

    valve is transitioning from a `CLOSED` state to an `OPEN` state.

#### Subtypes of ValveState

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    
    

    

### Variable

{{def(EventEnum:VARIABLE)}}



### WaitState

{{def(EventEnum:WAIT_STATE)}}



`WaitStateEnum` Enumeration:

* `MATERIAL_LOAD` 

    execution is waiting while material is being loaded.

* `MATERIAL_UNLOAD` 

    execution is waiting while material is being unloaded.

* `PART_LOAD` 

    execution is waiting while one or more discrete workpieces are being loaded.

* `PART_UNLOAD` 

    execution is waiting while one or more discrete workpieces are being unloaded.

* `PAUSING` 

    execution is waiting while the equipment is pausing but the piece of equipment has not yet reached a fully paused state.

* `POWERING_DOWN` 

    execution is waiting while the equipment is powering down but has not fully reached a stopped state.

* `POWERING_UP` 

    execution is waiting while the equipment is powering up and is not currently available to begin producing parts or products.

* `RESUMING` 

    execution is waiting while the equipment is resuming the production cycle but has not yet resumed execution.

* `SECONDARY_PROCESS` 

    execution is waiting while another process is completed before the execution can resume.

* `TOOL_LOAD` 

    execution is waiting while a tool or tooling is being loaded.

* `TOOL_UNLOAD` 

    execution is waiting while a tool or tooling is being unloaded.

### Wire

{{def(EventEnum:WIRE)}}



### WorkOffset

{{def(EventEnum:WORK_OFFSET)}}



### WorkholdingId

{{def(EventEnum:WORKHOLDING_ID)}}


