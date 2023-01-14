
## DataItem Types

This section provides semantic information for the types of a {{block(DataItem)}}.

In the MTConnect Standard, {{block(DataItem)}} elements are defined and organized based upon the {{property(category)}} and {{property(type)}} attributes.  The {{property(category)}} attribute provides a high level grouping for {{block(DataItem)}} elements based on the kind of information that is reported by the data item.

These categories are:

* `SAMPLE`: A `SAMPLE` reports a continuously variable or analog data value. 

* `EVENT`: An `EVENT` reports information representing a functional state, with two or more discrete values, associated with a component or it contains a message.  The data provided may be a numeric value or text.

* `CONDITION`: A `CONDITION` reports information about the health of a piece of equipment and its ability to function.

The {{property(type)}} attribute specifies the specific kind of data that is reported.   For some types of data items, a {{property(subType)}} attribute may also be used to differentiate between multiple data items of the same {{property(type)}} where the information reported by the data item has a different, but related, meaning.

Many types of data items provide two forms of data: a value (reported as either a `SAMPLE` or `EVENT`) and a health status (reported as a `CONDITION`).  These {{block(DataItem)}} types **MAY** be defined in more than one {{property(category)}} based on the data that they report.


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

    * `ACTUATOR_STATE` 

        operational state of an apparatus for moving or controlling a mechanism or system.

    * `ADAPTER_SOFTWARE_VERSION` 

        originator’s software version of the {{term(adapter)}}.

    * `ADAPTER_URI` 

        {{term(URI)}} of the {{term(adapter)}}.

    * `<<deprecated>>` `ALARM` 

        **DEPRECATED:** Replaced with `CONDITION` category data items in Version 1.1.0.

    * `ALARM_LIMIT` 

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

    * `COMPOSITION_STATE` 

        operating state of a mechanism represented by a {{block(Composition)}} entity.

    * `CONNECTION_STATUS` 

        status of the connection between an {{term(adapter)}} and an {{term(agent)}}.

    * `CONTROLLER_MODE` 

        current mode of the {{block(Controller)}} component.

    * `CONTROLLER_MODE_OVERRIDE` 

        setting or operator selection that changes the behavior of a piece of equipment.

    * `CONTROL_LIMIT` 

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

        execution status of the {{block(Component)}}.

    * `FIRMWARE` 

        embedded software of a {{block(Component)}}.

    * `FIXTURE_ID` 

        identifier for a fixture.

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

    * `LOCK_STATE` 

        state or operating mode of a {{block(Lock)}}.

    * `MAINTENANCE_LIST` 

        actions or activities to be performed in support of a piece of equipment.

    * `MATERIAL` 

        identifier of a material used or consumed in the manufacturing process.

    * `MATERIAL_LAYER` 

        identifies the layers of material applied to a part or product as part of an additive manufacturing process.

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

    * `SERIAL_NUMBER` 

        serial number associated with a {{block(Component)}}, {{block(Asset)}}, or {{block(Device)}}.

    * `SPECIFICATION_LIMIT` 

        set of limits defining a range of values designating acceptable performance for a variable.

    * `SPINDLE_INTERLOCK` 

        indication of the status of the spindle for a piece of equipment when power has been removed and it is free to rotate.

    * `TOOL_ASSET_ID` 

        identifier of an individual tool asset.

    * `TOOL_GROUP` 

        identifier for the tool group associated with a specific tool. Commonly used to designate spare tools.

    * `<<deprecated>>` `TOOL_ID` 

        identifier of the tool currently in use for a given `Path`.
        
        **DEPRECATED** in *Version 1.2.0*.   See `TOOL_ASSET_ID`.

    * `TOOL_NUMBER` 

        identifier assigned by the {{block(Controller)}} component to a cutting tool when in use by a piece of equipment.

    * `TOOL_OFFSET` 

        reference to the tool offset variables applied to the active cutting tool associated with a {{block(Path)}} in a {{block(Controller)}} type component.

    * `TRANSFER_COUNT` 

        accumulation of the number of times an operation has attempted to, or is planned to attempt to, transfer materials, parts, or other items from one location to another.

    * `TRANSLATION` 

        three space linear displacement of an object or coordinate system relative to a {{term(cartesian coordinate system)}}.

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

    * `WORK_OFFSET` 

        offset variables for a work piece or part associated with a {{block(Path)}} in a {{block(Controller)}} type component.

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

        fluid capacity of an object or container.

    * `CAPACITY_SPATIAL` 

        geometric capacity of an object or container.

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
