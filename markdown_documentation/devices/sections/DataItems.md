
## DataItems

This section provides semantic information for the {{block(DataItem)}} entity. {{fig(DataItems)}} shows the {{block(DataItem)}} model. 

![DataItems](figures/DataItems.png "DataItems"){: width="0.8"}

> Note: See {{fig(DataItems Schema)}} for XML schema.

### DataItem


information reported about a piece of equipment.


#### Value Properties of DataItem

{{tbl(value-properties-of-dataitem)}} lists the Value Properties of {{block(DataItem)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(category)}} | `CategoryEnum` | 1 |
| {{property(compositionId)}} | `ID` | 0..1 |
| {{property(coordinateSystem)}} | `CoordinateSystemEnum` | 0..1 |
| {{property(discrete)}} | `boolean` | 0..1 |
| {{property(id)}} | `ID` | 1 |
| {{property(name)}} | `string` | 0..1 |
| {{property(nativeScale)}} | `integer` | 0..1 |
| {{property(nativeUnits)}} | `NativeUnitEnum` | 0..1 |
| {{property(sampleRate)}} | `float` | 0..1 |
| {{property(significantDigits)}} | `integer` | 0..1 |
| {{property(statistic)}} | `StatisticEnum` | 0..1 |
| {{property(subType)}} | `DataItemSubTypeEnum` | 0..1 |
| {{property(type)}} | `DataItemTypeEnum` | 1 |
| {{property(units)}} | `UnitEnum` | 0..1 |
| {{property(representation)}} | `RepresentationEnum` | 0..1 |
| {{property(coordinateSystemIdRef)}} | `ID` | 0..1 |
{: caption="Value Properties of DataItem"}

Descriptions for Value Properties of {{block(DataItem)}}:

* {{property(category)}} 

    specifies the kind of information provided by a data item.

    The value of {{property(category)}} **MUST** be one of the `CategoryEnum` enumeration.

    `CategoryEnum` Enumeration:


    * `SAMPLE` 

        continuously variable or analog data value. 
        
        A continuous value can be measured at any point-in-time and will always produce a result.

    * `EVENT` 

        discrete piece of information from the piece of equipment.

    * `CONDITION` 

        information about the health of a piece of equipment and its ability to function.

* {{property(compositionId)}} 

    identifier attribute of the {{block(Composition)}} element that the reported data is most closely associated.

* {{property(coordinateSystem)}} 

    for measured values relative to a coordinate system like {{block(POSITION)}}, the coordinate system used may be reported.

    The value of {{property(coordinateSystem)}} **MUST** be one of the `CoordinateSystemEnum` enumeration.

    `CoordinateSystemEnum` Enumeration:


    * `MACHINE` 

        unchangeable coordinate system that has machine zero as its origin.

    * `WORK` 

        coordinate system that represents the working area for a particular workpiece whose origin is shifted within the `MACHINE` coordinate system.
        
        If the `WORK` coordinates are not currently defined in the piece of equipment, the `MACHINE` coordinates will be used.

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

    The value of {{property(nativeUnits)}} **MUST** be one of the `NativeUnitEnum` enumeration.

    `<<extensible>>``NativeUnitEnum` Enumeration:


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

    * `FOOT/SECOND\^2` 

        acceleration in feet per second squared.

    * `FOOT_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in feet.

    * `GALLON/MINUTE` 

        gallons per minute.

    * `HOUR` 

        measurement of time in hours.

    * `INCH` 

        inches.

    * `INCH/MINUTE` 

        inches per minute.

    * `INCH/SECOND` 

        inches per second.

    * `INCH/SECOND\^2` 

        acceleration in inches per second squared.

    * `INCH_POUND` 

        measure of torque in inch pounds.

    * `INCH_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in inches.

    * `KELVIN` 

        measurement of temperature.

    * `KILOWATT` 

        measurement in kilowatt.

    * `KILOWATT_HOUR` 

        kilowatt hours which is 3.6 mega joules.

    * `LITER` 

        measurement of volume of a fluid.

    * `LITER/MINUTE` 

        measurement of rate of flow of a fluid.

    * `MILLIMETER/MINUTE` 

        velocity in millimeters per minute.

    * `MINUTE` 

        measurement of time in minutes.

    * `OTHER` 

        unsupported unit.

    * `POUND` 

        US pounds.

    * `POUND/INCH\^2` 

        pressure in pounds per square inch (PSI).

    * `RADIAN` 

        angle in radians.

    * `RADIAN/MINUTE` 

        velocity in radians per minute.

    * `RADIAN/SECOND` 

        rotational acceleration in radian per second squared.

    * `RADIAN/SECOND\^2` 

        rotational acceleration in radian per second squared.

    * `REVOLUTION/SECOND` 

        rotational velocity in revolution per second.

    * `BAR` 

        pressure in Bar.

    * `TORR` 

        pressure in Torr.

    * `MILLIMETER_MERCURY` 

        pressure in Millimeter of Mercury (mmHg).

    * `PASCAL/MINUTE` 

        pascal per minute.

* {{property(sampleRate)}} 

    rate at which successive samples of a data item are recorded by a piece of equipment.

* {{property(significantDigits)}} 

    number of significant digits in the reported value.

* {{property(statistic)}} 

    type of statistical calculation performed on a series of data samples to provide the reported data value.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration.

    `StatisticEnum` Enumeration:


    * `AVERAGE` 

        mathematical average value calculated for the data item during the calculation period.

    * `KURTOSIS` 

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

    sub-categorization of the data item {{property(type)}}. See {{DataItem SubTypes}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration.

* {{property(type)}} 

    type of data being measured. See {{sect(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration.

* {{property(units)}} 

    unit of measurement for the reported value of the data item.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration.

    `<<extensible>>``UnitEnum` Enumeration:


    * `AMPERE` 

        amps.

    * `CELSIUS` 

        degrees Celsius.

    * `COUNT` 

        count of something.

    * `DECIBEL` 

        sound level.

    * `DEGREE` 

        angle in degrees.

    * `DEGREE_3D` 

        space-delimited, floating-point representation of the angular rotation in degrees around the X, Y, and Z axes relative to a cartesian coordinate system respectively in order as A, B, and C. 
        
        If any of the rotations is not known, it **MUST** be zero (0).

    * `DEGREE/SECOND` 

        angular degrees per second.

    * `DEGREE/SECOND\^2` 

        angular acceleration in degrees per second squared.

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

    * `MICRO_RADIAN` 

        measurement of tilt.

    * `MILLIMETER` 

        millimeters.

    * `MILLIMETER_3D` 

        point in space identified by X, Y, and Z positions and represented by a space-delimited set of numbers each expressed in millimeters.

    * `MILLIMETER/REVOLUTION` 

        millimeters per revolution.

    * `MILLIMETER/SECOND` 

        millimeters per second.

    * `MILLIMETER/SECOND\^2` 

        acceleration in millimeters per second squared.

    * `NEWTON` 

        force in Newtons.

    * `NEWTON_METER` 

        torque, a unit for force times distance.

    * `OHM` 

        measure of electrical resistance.

    * `PASCAL` 

        pressure in Newtons per square meter.

    * `PASCAL_SECOND` 

        measurement of viscosity.

    * `PERCENT` 

        percentage.

    * `PH` 

        measure of the acidity or alkalinity of a solution.

    * `REVOLUTION/MINUTE` 

        revolutions per minute.

    * `SECOND` 

        measurement of time.

    * `SIEMENS/METER` 

        measurement of electrical conductivity.

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

    * `REVOLUTION/SECOND` 

        revolutions per second.

    * `REVOLUTION/SECOND\^2` 

        revolutions per second squared.

    * `GRAM/CUBIC_METER` 

        gram per cubic meter.

    * `CUBIC_MILLIMETER` 

        geometric volume in millimeters.

    * `CUBIC_MILLIMETER/SECOND` 

        change of geometric volume per second.

    * `CUBIC_MILLIMETER/SECOND\^2` 

        change in geometric volume per second squared.

    * `MILLIGRAM` 

        milligram.

    * `MILLIGRAM/CUBIC_MILLIMETER` 

        milligram per cubic millimeter.

    * `MILLILITER` 

        milliliter.

    * `COUNT/SECOND` 

        counts per second.

    * `PASCAL/SECOND` 

        pascal per second.

    * `UNIT_VECTOR_3D` 

        3D Unit Vector.
        
        Space delimited list of three floating point numbers.

* {{property(representation)}} 

    description of a means to interpret data consisting of multiple data points or samples reported as a single value.  
    
    If {{property(representation)}} is not specified, it **MUST** be determined to be `VALUE`.
    

    The value of {{property(representation)}} **MUST** be one of the `RepresentationEnum` enumeration.

    `RepresentationEnum` Enumeration:


    * `TIME_SERIES` 

        series of sampled data.
        
        The data is reported for a specified number of samples and each sample is reported with a fixed period.

    * `VALUE` 

        measured value of the sample data.
        
        If no {{property(representation,DataItem)}} is specified for a data item, the {{property(representation,DataItem)}} **MUST** be determined to be `VALUE`.

    * `DATA_SET` 

        reported value(s) are represented as a set of {{termplural(key-value pair)}}.
        
        Each reported value in the {{term(data set)}} **MUST** have a unique key.

    * `DISCRETE` 

        **DEPRECATED** as a {{property(representation)}} in *MTConnect Version 1.5*. Replaced by the {{property(discrete,DataItem)}} attribute of a {{block(DataItem)}}.

    * `TABLE` 

        two dimensional set of {{termplural(key-value pair)}} where the {{block(Entry)}} represents a row, and the value is a set of {{term(key-value pair)}} {{block(Cell)}} elements. 
        
        A {{term(table)}} follows the same behavior as the {{term(data set)}} for change tracking, clearing, and history. When an {{block(Entry)}} changes, all {{block(Cell)}} elements update as a single unit following the behavior of a {{term(data set)}}.
        
        > Note: It is best to use the {{block(Variable)}} {{block(DataItem)}} {{property(type)}} if the {{block(Cell)}} elements represent multiple semantic types.
        
        Each {{block(Entry)}} in the {{term(table)}} **MUST** have a unique key. Each {{block(Cell)}} of each {{block(Entry)}} in the {{term(table)}} **MUST** have a unique key.
        
        See {{cite(Section 5.6.5)}} of {{citetitle(MTCPart3)}}, for a description of
        {{block(Entry)}} and {{block(Cell)}} elements.

* {{property(coordinateSystemIdRef)}} 

    associated {{block(CoordinateSystem)}} context for the {{block(DataItem)}}.

#### Reference Properties of DataItem

{{tbl(reference-properties-of-dataitem)}} lists the Reference Properties of {{block(DataItem)}}.

| Reference Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Observation)}} (organized by {{block(Observations)}}) | 0..* |
{: caption="Reference Properties of DataItem"}

Descriptions for Reference Properties of {{block(DataItem)}}:

* {{block(Observation)}} 

    abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.
    {{block(Observations)}} groups one or more {{block(Observation)}} entities made for the {{block(DataItem)}} entity. 
    
    {{block(Component)}} {{termplural(observe)}} {{block(DataItem)}} entities to create {{block(Observation)}} entities for the {{block(DataItem)}} entities.
    
    See {{citetitle(MTCPart3)}} for the {{block(Observation)}} model.
    
    > Note 1 to entry: In the {{term(XML)}} representation, {{block(Observation)}} entities **MUST NOT** appear in the {{term(MTConnectDevices Response Document)}}.
    
    > Note 2 to entry: In the {{term(XML)}} representation, {{block(Observation)}} entities **MUST** appear only in the {{term(MTConnectStreams Response Document)}}.

#### Part Properties of DataItem

{{tbl(part-properties-of-dataitem)}} lists the Part Properties of {{block(DataItem)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Source)}} | 0..1 |
| {{block(Constraints)}} | 0..1 |
| {{block(Filter)}} (organized by {{block(Filters)}}) | 0..* |
| {{block(InitialValue)}} | 0..1 |
| {{block(ResetTrigger)}} | 0..1 |
| {{block(Definition)}} | 0..1 |
| {{block(Relationship)}} (organized by {{block(Relationships)}}) | 0..* |
{: caption="Part Properties of DataItem"}

Descriptions for Part Properties of {{block(DataItem)}}:

* {{block(Source)}} 

    identifies the {{block(Component)}}, {{block(DataItem)}}, or {{block(Composition)}} from which a measured value originates.
    
    One of {{property(componentId)}}, {{property(compositionId)}}, or {{property(dataItemId)}} **MUST** be defined for {{block(Source)}}.
    See {{sect(Source)}}.

* {{block(Constraints)}} 

    {{termplural(organize)}} a set of expected values that can be reported for a {{block(DataItem)}}.
    {{block(Constraints)}} organizes a set of expected values that can be reported for the {{block(DataItem)}}. See {{sect(Constraints)}}.

* {{block(Filter)}} 

    provides a means to control when an {{term(agent)}} records updated information for a {{block(DataItem)}}. 
    {{block(Filters)}} groups one or more {{block(Filter)}} entities associated with the {{block(DataItem)}}. 

* {{block(InitialValue)}} 

    starting value for a {{block(DataItem)}} as well as the value to be set for the {{block(DataItem)}} after a reset event.
    starting value for a {{block(DataItem)}} as well as the value to be set for the {{block(DataItem)}} after a reset event.

* {{block(ResetTrigger)}} 

    type of event that may cause a reset to occur.
    type of event that may cause a reset to occur.

* {{block(Definition)}} 

    defines the meaning of {{block(Entry)}} and {{block(Cell)}} elements associated with the {{block(DataItem)}} when the {{property(representation)}} is either `DATA` or `TABLE`.
    See {{sect(Definition)}}.

* {{block(Relationship)}} 

    association between two pieces of equipment that function independently but together perform a manufacturing operation.
    {{block(Relationships)}} groups one or more {{block(DataItemRelationship)}} and {{block(SpecificationRelationship)}}. See {{sect(Relationships)}}.
