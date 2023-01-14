
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
    
    **DEPRECATED** in *Version 2.0*. Replaced by {{property(coordinateSystemIdRef)}}. 

* {{property(discrete)}} 

    indication signifying whether each value reported for the {{term(Observation)}} is significant and whether duplicate values are to be suppressed.
    
    If a value is not defined for {{property(discrete)}}, the default value **MUST** be `false`.

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

        pressure in Bar.

    * `CENTIPOISE` 

        measure of viscosity.

    * `DEGREE/MINUTE` 

        rotational velocity in degrees per minute.

    * `FAHRENHEIT` 

        temperature in Fahrenheit.

    * `FOOT` 

        feet.

    * `FOOT/MINUTE` 

        feet per minute.

    * `FOOT/SECOND` 

        feet per second.

    * `FOOT/SECOND^2` 

        acceleration in feet per second squared.

    * `FOOT_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in feet.

    * `GALLON/MINUTE` 

        gallons per minute.

    * `GRAVITATIONAL_ACCELERATION` 

        acceleration relative to earth's gravity given in `METER/SECOND^2`.
        
        > Note 1 to entry: At different points on Earth's surface, the free-fall acceleration ranges from 9.764 to 9.834 m/s2 (Wikipedia: Gravitational Acceleration). The constant can be customized depending on the location in the universe.
        
        > Note 2 to entry: In the standard, it is assumed that Earth's average value of gravitational acceleration is 9.90665 m/s2.

    * `GRAVITATIONAL_FORCE` 

        $$MASS\times GRAVITATIONAL_ACCELERATION$$ (g) given in `METER/SECOND^2`.

    * `HOUR` 

        measurement of time in hours.

    * `INCH` 

        inches.

    * `INCH/MINUTE` 

        inches per minute.

    * `INCH/SECOND` 

        inches per second.

    * `INCH/SECOND^2` 

        acceleration in inches per second squared.

    * `INCH_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in inches.

    * `INCH_POUND` 

        measure of torque in inch pounds.

    * `KELVIN` 

        measurement of temperature.

    * `KILOWATT` 

        measurement in kilowatt.

    * `KILOWATT_HOUR` 

        kilowatt hours which is 3.6 mega joules.

    * `LITER/MINUTE` 

        measurement of rate of flow of a fluid.

    * `MILLIMETER/MINUTE` 

        velocity in millimeters per minute.

    * `MILLIMETER_MERCURY` 

        pressure in Millimeter of Mercury (mmHg).

    * `MINUTE` 

        measurement of time in minutes.

    * `OTHER` 

        unsupported unit.

    * `PASCAL/MINUTE` 

        pascal per minute.

    * `POUND` 

        US pounds.

    * `POUND/INCH^2` 

        pressure in pounds per square inch (PSI).

    * `RADIAN` 

        angle in radians.

    * `RADIAN/MINUTE` 

        velocity in radians per minute.

    * `RADIAN/SECOND` 

        rotational acceleration in radian per second squared.

    * `RADIAN/SECOND^2` 

        rotational acceleration in radian per second squared.

    * `TORR` 

        pressure in Torr.

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

    sub-categorization of the data item {{property(type)}}.

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

        measured or reported value of an {{term(observation)}}.

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

    * `<<deprecated>>` `DIRECT` 

        DC current or voltage.
        
        **DEPRECATED** in *Version 1.6*.

    * `DRY_RUN` 

        setting or operator selection used to execute a test mode to confirm the execution of machine functions.

    * `D_SCALE` 

        D-Scale weighting factor on the frequency scale.

    * `ENDED` 

        boundary when an activity or an event terminates.

    * `EXPIRATION` 

        relating to the expiration or end of useful life for a material or other physical item.

    * `FAILED` 

        actions or activities that were attempted , but failed to complete or resulted in an unexpected or unacceptable outcome.

    * `FIRST_USE` 

        relating to the first use of a material or other physical item.

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

    * `MINIMUM` 

        minimum value.

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

        main or most important location of a piece of bar stock.

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

        amps.

    * `CELSIUS` 

        degrees Celsius.

    * `COULOMB` 

        electric charge in coulombs (C).

    * `COUNT` 

        count of something.

    * `COUNT/SECOND` 

        counts per second.

    * `CUBIC_MILLIMETER` 

        geometric volume in millimeters.

    * `CUBIC_MILLIMETER/SECOND` 

        change of geometric volume per second.

    * `CUBIC_MILLIMETER/SECOND^2` 

        change in geometric volume per second squared.

    * `DECIBEL` 

        sound level.

    * `DEGREE` 

        angle in degrees.

    * `DEGREE/SECOND` 

        angular degrees per second.

    * `DEGREE/SECOND^2` 

        angular acceleration in degrees per second squared.

    * `DEGREE_3D` 

        space-delimited, floating-point representation of the angular rotation in degrees around the X, Y, and Z axes relative to a cartesian coordinate system respectively in order as A, B, and C. 
        
        If any of the rotations is not known, it **MUST** be zero (0).

    * `GRAM` 

        gram.

    * `GRAM/CUBIC_METER` 

        gram per cubic meter.

    * `HERTZ` 

        frequency measured in cycles per second.

    * `JOULE` 

        measurement of energy.

    * `KILOGRAM` 

        kilograms.

    * `LITER` 

        measurement of volume of a fluid.

    * `LITER/SECOND` 

        liters per second.

    * `METER/SECOND^2` 

        acceleration in meters per second squared.

    * `MICRO_RADIAN` 

        measurement of tilt.

    * `MILLIGRAM` 

        milligram.

    * `MILLIGRAM/CUBIC_MILLIMETER` 

        milligram per cubic millimeter.

    * `MILLILITER` 

        milliliter.

    * `MILLIMETER` 

        millimeters.

    * `MILLIMETER/REVOLUTION` 

        millimeters per revolution.

    * `MILLIMETER/SECOND` 

        millimeters per second.

    * `MILLIMETER/SECOND^2` 

        acceleration in millimeters per second squared.

    * `MILLIMETER_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in millimeters.

    * `NEWTON` 

        force in Newtons.

    * `NEWTON_METER` 

        torque, a unit for force times distance.

    * `OHM` 

        measure of electrical resistance.

    * `PASCAL` 

        pressure in Newtons per square meter.

    * `PASCAL/SECOND` 

        pascal per second.

    * `PASCAL_SECOND` 

        measurement of viscosity.

    * `PERCENT` 

        percentage.

    * `PH` 

        measure of the acidity or alkalinity of a solution.

    * `REVOLUTION/MINUTE` 

        revolutions per minute.

    * `REVOLUTION/SECOND` 

        rotational velocity in revolution per second.

    * `REVOLUTION/SECOND^2` 

        revolutions per second squared.

    * `SECOND` 

        measurement of time.

    * `SIEMENS/METER` 

        measurement of electrical conductivity.

    * `UNIT_VECTOR_3D` 

        3D Unit Vector.
        
        Space delimited list of three floating point numbers.

    * `VOLT` 

        volts.

    * `VOLT_AMPERE` 

        measurement of the apparent power in an electrical circuit, equal to the product of root-mean-square (RMS) voltage and RMS current (commonly referred to as VA).

    * `VOLT_AMPERE_REACTIVE` 

        measurement of reactive power in an AC electrical circuit (commonly referred to as VAR).

    * `WATT` 

        watts.

    * `WATT_SECOND` 

        measurement of electrical energy, equal to one Joule.

* {{property(representation)}} 

    description of a means to interpret data consisting of multiple data points or samples reported as a single value.  
    
    If {{property(representation)}} is not specified, it **MUST** be determined to be `VALUE`.
    

    `RepresentationEnum` Enumeration:

    * `DATA_SET` 

        reported value(s) are represented as a set of {{termplural(key-value pair)}}.
        
        Each reported value in the {{term(data set)}} **MUST** have a unique key.

    * `<<deprecated>>` `DISCRETE` 

        **DEPRECATED** as a {{property(representation)}} in *MTConnect Version 1.5*. Replaced by the {{property(discrete,DataItem)}} attribute of a {{block(DataItem)}}.

    * `TABLE` 

        two dimensional set of {{termplural(key-value pair)}} where the {{block(Entry)}} represents a row, and the value is a set of {{term(key-value pair)}} {{block(Cell)}} elements. 
        
        A {{term(table)}} follows the same behavior as the {{term(data set)}} for change tracking, clearing, and history. When an {{block(Entry)}} changes, all {{block(Cell)}} elements update as a single unit following the behavior of a {{term(data set)}}.
        
        > Note: It is best to use the {{block(Variable)}} {{block(DataItem)}} {{property(type)}} if the {{block(Cell)}} elements represent multiple semantic types.
        
        Each {{block(Entry)}} in the {{term(table)}} **MUST** have a unique key. Each {{block(Cell)}} of each {{block(Entry)}} in the {{term(table)}} **MUST** have a unique key.
        
        See {{block(Representation)}} in {{package(Observation Information Model)}}, for a description of {{block(Entry)}} and {{block(Cell)}} elements.

    * `TIME_SERIES` 

        series of sampled data.
        
        The data is reported for a specified number of samples and each sample is reported with a fixed period.

    * `VALUE` 

        measured value of the sample data.
        
        If no {{property(representation,DataItem)}} is specified for a data item, the {{property(representation,DataItem)}} **MUST** be determined to be `VALUE`.

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

    defines the meaning of {{block(Entry)}} and {{block(Cell)}} elements associated with the {{block(DataItem)}} when the {{property(representation)}} is either `DATA` or `TABLE`.

    See {{sect(Definition)}}.

* {{block(AbstractDataItemRelationship)}} 

    association between a {{block(DataItem)}} and another entity.

    {{block(Relationships)}} groups one or more {{block(DataItemRelationship)}} and {{block(SpecificationRelationship)}}. See {{package(Relationships)}}.
