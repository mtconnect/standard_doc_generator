
## Cutting Tool Life Cycle

This section provides semantic information for the {{block(CuttingToolLifeCycle)}} model.

![CuttingToolLifeCycle](figures/CuttingToolLifeCycle.png "CuttingToolLifeCycle"){: width="0.8"}

> Note: See {{sect(CuttingToolLifeCycle Schema Diagrams)}} for XML schema.


### CuttingToolLifeCycle


data regarding the application or use of the tool.

This data is provided by various pieces of equipment (i.e. machine tool, presetter) and statistical process control applications. Life cycle data will not remain static, but will change periodically when a tool is used or measured.


#### Value Properties of CuttingToolLifeCycle

{{tbl(value-properties-of-cuttingtoollifecycle)}} lists the Value Properties of {{block(CuttingToolLifeCycle)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(ConnectionCodeMachineSide)}} | `string` | 0..1 |
| {{property(ProgramToolGroup)}} | `string` | 0..1 |
| {{property(ProgramToolNumber)}} | `string` | 0..1 |
{: caption="Value Properties of CuttingToolLifeCycle"}

Descriptions for Value Properties of {{block(CuttingToolLifeCycle)}}:

* {{property(ConnectionCodeMachineSide)}} 

    identifier for the capability to connect any component of the cutting tool together, except Assembly Items, on the machine side. Code: `CCMS`

* {{property(ProgramToolGroup)}} 

    tool group this tool is assigned in the part program.

* {{property(ProgramToolNumber)}} 

    number of the tool as referenced in the part program.

#### Reference Properties of CuttingToolLifeCycle

{{tbl(reference-properties-of-cuttingtoollifecycle)}} lists the Reference Properties of {{block(CuttingToolLifeCycle)}}.

| Reference Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(ProcessFeedRate)}} | 0..1 |
| {{block(ToolLife)}} | 0..3 |
| {{block(ProcessSpindleSpeed)}} | 0..1 |
| {{block(Status)}} (organized by {{block(CutterStatus)}}) | 1..* |
| {{block(Measurement)}} (organized by {{block(Measurements)}}) | 0..* |
| {{block(ReconditionCount)}} | 0..1 |
| {{block(Location)}} | 0..1 |
{: caption="Reference Properties of CuttingToolLifeCycle"}

Descriptions for Reference Properties of {{block(CuttingToolLifeCycle)}}:

* {{block(ProcessFeedRate)}} 

    constrained process feed rate for the tool in mm/s.
    
    The {{property(value)}} **MAY** contain the nominal process target feed rate if available. If {{block(ProcessFeedRate)}} is provided, at least one value of {{property(maximum)}}, {{property(nominal)}}, or {{property(minimum)}} **MUST** be specified.
    See {{sect(ProcessFeedRate)}}.

* {{block(ToolLife)}} 

    cutting tool life as related to the assembly.
    See {{sect(ToolLife)}}.

* {{block(ProcessSpindleSpeed)}} 

    constrained process spindle speed for the tool in revolutions/minute.
    
    The {{property(value)}} **MAY** contain the nominal process target spindle speed if available. If {{block(ProcessSpindleSpeed)}} is provided, at least one value of {{property(maximum)}}, {{property(nominal)}}, or {{property(minimum)}} **MUST** be specified.
    See {{sect(ProcessSpindleSpeed)}}.

* {{block(Status)}} 

    status of the cutting tool.
    {{block(CutterStatus)}} provides the status of the assembly and {{term(organize)}} one or more {{block(Status)}} entities. See {{sect(Status)}}.
    
    The following combinations of {{block(Status)}} entities **MUST NOT** occur for a {{block(CutterStatus)}}:
    
    * `NEW` **MUST NOT** be used with `USED`, `RECONDITIONED`, or `EXPIRED`.
    
    * `UNKNOWN` **MUST NOT** be used with any other status.
    
    * `ALLOCATED` and `UNALLOCATED` **MUST NOT** be used together.
    
    * `AVAILABLE` and `UNAVAILABLE` **MUST NOT** be used together.
    
    * If the tool is `EXPIRED`, `BROKEN`, or `NOT_REGISTERED` it **MUST NOT** be `AVAILABLE`.

* {{block(Measurement)}} 

    constrained scalar value associated with a cutting tool.
    {{block(Measurements)}} groups one or more {{block(Measurement)}} subtypes. See {{sect(Measurement)}}.

* {{block(ReconditionCount)}} 

    number of times the cutter has been reconditioned.
    See {{sect(ReconditionCount)}}.

* {{block(Location)}} 

    location of the pot or spindle the cutting tool currently resides in.
    
    If {{property(negativeOverlap)}} or {{property(positiveOverlap)}} is provided, the tool reserves additional locations on either side, otherwise if they are not given, no additional locations are required for this tool.
    
    If the pot occupies the first or last location, a rollover to the beginning or the end of the indexable values may occur. For example, if there are 64 pots and the tool is in pot 64 with a {{property(positiveOverlap)}} of 1, the first pot **MAY** be occupied as well.
    See {{sect(Location)}} for more detail.

### ToolLife


cutting tool life as related to the assembly.

{{block(ToolLife)}} **MUST** be defined only for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingTool)}} and **MUST NOT** be defined for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingToolArchetype)}}.

    The value of {{property(ToolLife)}} **MUST** be `float`.


#### Value Properties of ToolLife

{{tbl(value-properties-of-toollife)}} lists the Value Properties of {{block(ToolLife)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(countDirection)}} | `CountDirectionTypeEnum` | 1 |
| {{property(initial)}} | `float` | 0..1 |
| {{property(limit)}} | `float` | 0..1 |
| {{property(type)}} | `ToolLifeEnum` | 1 |
| {{property(warning)}} | `float` | 0..1 |
{: caption="Value Properties of ToolLife"}

Descriptions for Value Properties of {{block(ToolLife)}}:

* {{property(countDirection)}} 

    indicates if the tool life counts from zero to maximum or maximum to zero.

    The value of {{property(countDirection)}} **MUST** be one of the `CountDirectionTypeEnum` enumeration.

    `CountDirectionTypeEnum` Enumeration:


    * `UP` 

        tool life counts up from zero to the maximum.

    * `DOWN` 

        tool life counts down from the maximum to zero.

* {{property(initial)}} 

    initial life of the tool when it is new.

* {{property(limit)}} 

    end of life limit for the tool.

* {{property(type)}} 

    type of tool life being accumulated.

    The value of {{property(type)}} **MUST** be one of the `ToolLifeEnum` enumeration.

    `ToolLifeEnum` Enumeration:


    * `MINUTES` 

        tool life measured in minutes. 
        
        All units for minimum, maximum, and nominal **MUST** be provided in minutes.

    * `PART_COUNT` 

        tool life measured in parts. 
        
        All units for minimum, maximum, and nominal **MUST** be provided as the number of parts.

    * `WEAR` 

        tool life measured in tool wear. 
        
        Wear **MUST** be provided in millimeters as an offset to nominal. All units for minimum, maximum, and nominal **MUST** be given as millimeter offsets as
        well. The standard will only consider dimensional wear at this time.

* {{property(warning)}} 

    point at which a tool life warning will be raised.

### Location


location of the pot or spindle the cutting tool currently resides in.

If {{property(negativeOverlap)}} or {{property(positiveOverlap)}} is provided, the tool reserves additional locations on either side, otherwise if they are not given, no additional locations are required for this tool.

If the pot occupies the first or last location, a rollover to the beginning or the end of the indexable values may occur. For example, if there are 64 pots and the tool is in pot 64 with a {{property(positiveOverlap)}} of 1, the first pot **MAY** be occupied as well.

{{block(Location)}} **MUST** be defined only for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingTool)}} and **MUST NOT** be defined for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingToolArchetype)}}.

    The value of {{property(Location)}} **MUST** be `string`.


#### Value Properties of Location

{{tbl(value-properties-of-location)}} lists the Value Properties of {{block(Location)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(negativeOverlap)}} | `integer` | 0..1 |
| {{property(positiveOverlap)}} | `integer` | 0..1 |
| {{property(type)}} | `LocationTypeEnum` | 1 |
| {{property(turret)}} | `string` | 0..1 |
| {{property(toolMagazine)}} | `string` | 0..1 |
| {{property(toolBar)}} | `string` | 0..1 |
| {{property(toolRack)}} | `string` | 0..1 |
| {{property(automaticToolChanger)}} | `string` | 0..1 |
{: caption="Value Properties of Location"}

Descriptions for Value Properties of {{block(Location)}}:

* {{property(negativeOverlap)}} 

    number of locations at lower index values from this location.

* {{property(positiveOverlap)}} 

    number of locations at higher index value from this location.

* {{property(type)}} 

    type of location being identified. 
    
    When a `POT` or `STATION` type is used, {{property(value)}} of {{block(Location)}} **MUST** be a numeric value.

    The value of {{property(type)}} **MUST** be one of the `LocationTypeEnum` enumeration.

    `LocationTypeEnum` Enumeration:


    * `POT` 

        number of the pot in the tool handling system.

    * `STATION` 

        tool location in a horizontal turning machine.

    * `CRIB` 

        location with regard to a tool crib.

    * `SPINDLE` 

        location associated with a {{term(spindle)}}.

    * `TRANSFER_POT` 

        location for a tool awaiting transfer from a tool magazine to spindle or a turret.

    * `RETURN_POT` 

        location for a tool removed from a {{term(spindle)}} or turret and awaiting return to a tool magazine.

    * `STAGING_POT` 

        location for a tool awaiting transfer to a tool magazine or turret from outside of the piece of equipment.

    * `REMOVAL_POT` 

        location for a tool removed from a tool magazine or turret awaiting transfer to a location outside of the piece of equipment.

    * `EXPIRED_POT` 

        location for a tool that is no longer usable and is awaiting removal from a tool magazine or turret.

    * `END_EFFECTOR` 

        location associated with an end effector.

* {{property(turret)}} 

    turret associated with a tool.

* {{property(toolMagazine)}} 

    tool magazine associated with a tool.

* {{property(toolBar)}} 

    tool bar associated with a tool.

* {{property(toolRack)}} 

    tool rack associated with a tool.

* {{property(automaticToolChanger)}} 

    automatic tool changer associated with a tool.

### ReconditionCount


number of times the cutter has been reconditioned.

{{block(ReconditionCount)}} **MUST** be defined only for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingTool)}} and **MUST NOT** be defined for the {{block(CuttingToolLifeCycle)}} of {{block(CuttingToolArchetype)}}.

    The value of {{property(ReconditionCount)}} **MUST** be `integer`.


#### Value Properties of ReconditionCount

{{tbl(value-properties-of-reconditioncount)}} lists the Value Properties of {{block(ReconditionCount)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(maximumCount)}} | `integer` | 0..1 |
{: caption="Value Properties of ReconditionCount"}

Descriptions for Value Properties of {{block(ReconditionCount)}}:

* {{property(maximumCount)}} 

    maximum number of times the tool may be reconditioned.

### ProcessSpindleSpeed


constrained process spindle speed for the tool in revolutions/minute.

The {{property(value)}} **MAY** contain the nominal process target spindle speed if available. If {{block(ProcessSpindleSpeed)}} is provided, at least one value of {{property(maximum)}}, {{property(nominal)}}, or {{property(minimum)}} **MUST** be specified.


    The value of {{property(ProcessSpindleSpeed)}} **MUST** be `float`.


#### Value Properties of ProcessSpindleSpeed

{{tbl(value-properties-of-processspindlespeed)}} lists the Value Properties of {{block(ProcessSpindleSpeed)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(maximum)}} | `float` | 0..1 |
| {{property(minimum)}} | `float` | 0..1 |
| {{property(nominal)}} | `float` | 0..1 |
{: caption="Value Properties of ProcessSpindleSpeed"}

Descriptions for Value Properties of {{block(ProcessSpindleSpeed)}}:

* {{property(maximum)}} 

    upper bound for the tool’s target spindle speed.

* {{property(minimum)}} 

    lower bound for the tools spindle speed.

* {{property(nominal)}} 

    nominal speed the tool is designed to operate at.

### ProcessFeedRate


constrained process feed rate for the tool in mm/s.

The {{property(value)}} **MAY** contain the nominal process target feed rate if available. If {{block(ProcessFeedRate)}} is provided, at least one value of {{property(maximum)}}, {{property(nominal)}}, or {{property(minimum)}} **MUST** be specified.


    The value of {{property(ProcessFeedRate)}} **MUST** be `string`.


#### Value Properties of ProcessFeedRate

{{tbl(value-properties-of-processfeedrate)}} lists the Value Properties of {{block(ProcessFeedRate)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(maximum)}} | `float` | 0..1 |
| {{property(minimum)}} | `float` | 0..1 |
| {{property(nominal)}} | `float` | 0..1 |
{: caption="Value Properties of ProcessFeedRate"}

Descriptions for Value Properties of {{block(ProcessFeedRate)}}:

* {{property(maximum)}} 

    upper bound for the tool’s process target feedrate.

* {{property(minimum)}} 

    lower bound for the tool's feedrate.

* {{property(nominal)}} 

    nominal feedrate the tool is designed to operate at.

### Status


status of the cutting tool.


    The value of {{property(Status)}} **MUST** be one of the `CutterStatusTypeEnum` enumeration. 


    `CutterStatusTypeEnum` Enumeration:


    * `NEW` 

        new tool that has not been used or first use. 
        
        Marks the start of the tool history.

    * `AVAILABLE` 

        tool is available for use. 
        
        If this is not present, the tool is currently not ready to be used.

    * `UNAVAILABLE` 

        tool is unavailable for use in metal removal. 

    * `ALLOCATED` 

        tool is has been committed to a piece of equipment for use and is not available for use in any other piece of equipment.

    * `UNALLOCATED` 

        tool has not been committed to a process and can be allocated.

    * `MEASURED` 

        tool has been measured.

    * `RECONDITIONED` 

        tool has been reconditioned.

    * `USED` 

        tool is in process and has remaining tool life.

    * `EXPIRED` 

        tool has reached the end of its useful life.

    * `BROKEN` 

        premature tool failure.

    * `NOT_REGISTERED` 

        tool cannot be used until it is entered into the system.

    * `UNKNOWN` 

        tool is an indeterminate state. This is the default value.

### Measurement


constrained scalar value associated with a cutting tool.

A {{block(Measurement)}} is specific to the tool management policy at a particular shop. The tool zero reference point or gauge line will be different depending on the particular implementation and will be assumed to be consistent within the shop. MTConnect Standard does not standardize the manufacturing process or the definition of the zero point.

    The value of {{property(Measurement)}} **MUST** be `float`.


#### Value Properties of Measurement

{{tbl(value-properties-of-measurement)}} lists the Value Properties of {{block(Measurement)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(code)}} | `CodeEnum` | 0..1 |
| {{property(maximum)}} | `float` | 0..1 |
| {{property(minimum)}} | `float` | 0..1 |
| {{property(nativeUnits)}} | `NativeUnitEnum` | 0..1 |
| {{property(nominal)}} | `float` | 0..1 |
| {{property(significantDigits)}} | `integer` | 0..1 |
| {{property(units)}} | `UnitEnum` | 0..1 |
{: caption="Value Properties of Measurement"}

Descriptions for Value Properties of {{block(Measurement)}}:

* {{property(code)}} 

    shop specific code for the measurement. 
    
    ISO 13399 codes **MAY** be used for these codes as well. 
    
    See {{sect(Cutting Tool Measurement Subtypes)}} and {{sect(Cutting Item Measurement Subtypes)}} for details on {{block(Measurement)}} types and their respective {{property(code)}} values.

    The value of {{property(code)}} **MUST** be one of the `CodeEnum` enumeration.

* {{property(maximum)}} 

    maximum value for the measurement. 

* {{property(minimum)}} 

    minimum value for the measurement. 

* {{property(nativeUnits)}} 

    units the measurement was originally recorded in. See {{citetitle(MTCPart2)}} for the complete list of {{property(nativeUnits)}}.

    The value of {{property(nativeUnits)}} **MUST** be one of the `NativeUnitEnum` enumeration.

* {{property(nominal)}} 

    as advertised value for the measurement.

* {{property(significantDigits)}} 

    number of significant digits in the reported value. 

* {{property(units)}} 

    units for the measurements. See {{citetitle(MTCPart2)}} for the complete list of {{property(units)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration.
