
## Observations

This section provides semantic information for the {{block(Observation)}} model.

> Note: See {{sect(Observations Schema Diagrams)}} for XML schema of {{block(Observation)}} types.

### Observations made for DataItem

{{block(Component)}} {{termplural(observe)}} {{block(DataItem)}} entities and creates {{block(Observation)}} entities for the {{block(DataItem)}} entities. See {{fig(Observations)}}.

{{block(Observation)}} entities made by a {{block(Component)}} are organized by a {{block(ComponentStream)}} which is specifically created for that {{block(Component)}}.

![Observations made for DataItem Example](figures/Observations%20made%20for%20DataItem%20Example.png "Observations made for DataItem Example"){: width="0.8"}

> Note: See {{sect(Observations made for DataItem Example)}} for how XML representation of the same example is separated into {{term(MTConnectDevices Response Document)}} and {{term(MTConnectStreams Response Document)}}.

{{fig(Observations made for DataItem Example)}} is a subset of {{fig(DeviceStream Example)}}. It shows an example of the association between a {{block(DataItem)}} {{block(Event)}} type (`EMERGENCY_STOP`) and an {{block(Observation)}} {{block(Event)}} type (`EmergencyStop`). See {{sect(Naming Convention for Observation types)}}.

{{fig(Observations made for DataItem Example)}} also shows example of the association between a {{block(Component)}} type (`Controller`) and related {{block(ComponentStream)}}.

#### Naming Convention for Observation types

The name of an {{block(Observation)}} type **MUST** derive from the {{block(DataItem)}} property {{property(type)}} converted to Pascal-Case by removing underscores (_ ) and capitalizing each word. The conversion **MUST NOT** apply to the following abbreviated words: `PH`, `AC`, `DC` and `URI`. `MTCONNECT` **MUST** be converted to `MTConnect`. See {{fig(Observations made for DataItem Example)}} for an example.

The name of an {{block(Observation)}} type reported in the {{term(MTConnectStreams Response Document)}} is extended when the {{property(representation)}} property is used to further describe that {{block(DataItem)}} in the {{term(MTConnectDevices Response Document)}}. See {{sect(Representations)}} for more details.

### Observation


abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.


#### Value Properties of Observation

{{tbl(value-properties-of-observation)}} lists the Value Properties of {{block(Observation)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(compositionId)}} | `ID` | 0..1 |
| {{property(dataItemId)}} | `ID` | 1 |
| {{property(name)}} | `string` | 0..1 |
| {{property(sequence)}} | `integer` | 1 |
| {{property(subType)}} | `DataItemSubTypeEnum` | 0..1 |
| {{property(timestamp)}} | `dateTime` | 1 |
| {{property(type)}} | `DataItemTypeEnum` | 1 |
| {{property(units)}} | `UnitEnum` | 0..1 |
| {{property(result)}} | `string` | 0..1 |
{: caption="Value Properties of Observation"}

Descriptions for Value Properties of {{block(Observation)}}:

* {{property(compositionId)}} 

    identifier of the {{block(Composition)}} entity defined in the {{block(MTConnectDevices)}} {{term(response document)}} associated with the data reported for the {{block(Observation)}}.

* {{property(dataItemId)}} 

    unique identifier of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(dataItemId)}} **MUST** match the {{property(id)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(name)}} 

    name of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(name)}} **MUST** match the {{property(name)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(sequence)}} 

    number representing the sequential position of an occurrence of an {{term(observation)}} in the data buffer of an {{term(agent)}}.
    
    {{property(sequence)}} **MUST** have a value represented as an unsigned 64-bit value from 1 to $2^{64}-1$.

* {{property(subType)}} 

    subtype of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(subType)}} **MUST** match the {{property(subType)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration.

* {{property(timestamp)}} 

    most accurate time available to a piece of equipment that represents the point in time that the data reported was measured.

* {{property(type)}} 

    type of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(type)}} **MUST** match the {{property(type)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration.

* {{property(units)}} 

    units of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(units)}} **MUST** match the {{property(units)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration.

* {{property(result)}} 

    {{term(observation)}} of the {{block(Observation)}} entity.
    
    The default value type for {{property(result)}} is `string`.

### Condition


{{block(Observation)}} that provides information about an entity's status regarding its ability to operate or it provides an indication whether the data reported for the entity is within an expected range.



It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with a {{property(category,DataItem)}} property of `CONDITION` in the {{block(MTConnectDevices Response Document)}}.

{{fig(Condition Example)}} shows {{block(Condition)}} type examples for various {{property(state)}}: `Normal` (`dataItemId` = `path_system`) and `Warning` (`dataItemId` = `logic_cond`). It also shows an example for when the {{property(state)}} is not available (`dataItemId` = `cont_system`).

![Condition Example](figures/Condition%20Example.png "Condition Example"){: width="0.8"}

> Note: See {{lst(condition-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Condition)}} lists the additional and/or updated attributes for {{block(Condition)}}.

#### Value Properties of Condition

{{tbl(value-properties-of-condition)}} lists the Value Properties of {{block(Condition)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(nativeCode)}} | `string` | 0..1 |
| {{property(nativeSeverity)}} | `string` | 0..1 |
| {{property(qualifier)}} | `QualifierEnum` | 0..1 |
| {{property(statistic)}} | `StatisticEnum` | 0..1 |
| {{property(xs:lang)}} | `xslang` | 0..1 |
| {{property(type)}} | `ConditionEnum` | 1 |
{: caption="Value Properties of Condition"}

Descriptions for Value Properties of {{block(Condition)}}:

* {{property(nativeCode)}} 

    native code (usually an alpha-numeric value) generated by the controller of a piece of equipment providing a reference identifier for a {{block(Condition)}}.
    
    This is the same information an operator or maintenance personnel may see as a reference code designating a specific fault code provided by the piece of equipment.

* {{property(nativeSeverity)}} 

    severity information to a client software application if the piece of equipment designates a severity level to a fault.

* {{property(qualifier)}} 

    additional information regarding a {{term(condition state)}} associated with the measured value of a process variable.
    
    {{property(qualifier)}} defines whether the {{term(condition state)}} represented indicates a measured value that is above or below an expected value of a process variable.

    The value of {{property(qualifier)}} **MUST** be one of the `QualifierEnum` enumeration.

    `QualifierEnum` Enumeration:


    * `HIGH` 

        measured value is greater than the expected value for a process variable.

    * `LOW` 

        measured value is less than the expected value for a process variable.

* {{property(statistic)}} 

    {{property(statistic)}} provides additional information describing the meaning of the {{block(Condition)}} element.
    
    {{property(statistic)}} **MUST** match the {{property(statistic)}} attribute of the {{block(DataItem)}} entity defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration.

* {{property(xs:lang)}} 

    specifies the language of the {{property(result)}} returned for the {{block(Condition)}}. 
    
    See {{cite(IETF RFC 4646)}} (http://www.ietf.org/rfc/rfc4646.txt).

### Event


{{block(Observation)}} that is a discrete piece of information from a piece of equipment.



It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with a {{property(category,DataItem)}} property of `EVENT` in the {{block(MTConnectDevices Response Document)}}.

{{fig(Event Example)}} shows {{block(Event)}} type examples. It also shows an example for when the {{property(result)}} is not available (`dataItemId`=`d1_asset_rem`).

![Event Example](figures/Event%20Example.png "Event Example"){: width="0.8"}

> Note: See {{lst(event-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Event)}} lists the additional and/or updated attributes for {{block(Event)}}.

#### Value Properties of Event

{{tbl(value-properties-of-event)}} lists the Value Properties of {{block(Event)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(resetTriggered)}} | `ResetTriggeredEnum` | 0..1 |
| {{property(type)}} | `EventEnum` | 1 |
{: caption="Value Properties of Event"}

Descriptions for Value Properties of {{block(Event)}}:

* {{property(resetTriggered)}} 

    identifies when a reported value has been reset and what has caused that reset to occur for those {{block(DataItem)}} entities that may be periodically reset to an initial value.
    
    {{property(resetTriggered)}} **MUST** only be provided for the specific occurrence of a {{block(DataItem)}} reported in the {{block(MTConnectStreams)}} {{term(response document)}} when the reset occurred.

    The value of {{property(resetTriggered)}} **MUST** be one of the `ResetTriggeredEnum` enumeration.

    `ResetTriggeredEnum` Enumeration:


    * `ACTION_COMPLETE` 

        {{property(result)}} of the {{block(Observation)}} that is measuring an action or operation was reset upon completion of that action or operation.

    * `ANNUAL` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a 12-month period.

    * `DAY` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a 24-hour period.

    * `MAINTENANCE` 

        {{property(result)}} of the {{block(Observation)}} was reset upon completion of a maintenance event.

    * `MANUAL` 

        {{property(result)}} of the {{block(Observation)}} was reset based on a physical reset action.

    * `MONTH` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a monthly period.

    * `POWER_ON` 

        {{property(result)}} of the {{block(Observation)}} was reset when power was applied to the piece of equipment after a planned or unplanned interruption of power has occurred.

    * `SHIFT` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a work shift.

    * `WEEK` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a 7-day period.

### Sample


{{block(Observation)}} that is continuously changing or analog data value.



It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with a {{property(category,DataItem)}} property of `SAMPLE` in the {{block(MTConnectDevices Response Document)}}.

{{block(Sample)}} **MUST** always be reported in `float`.

{{fig(Sample Example)}} shows {{block(Sample)}} type examples. It also shows an example for when the {{property(result)}} is not available (`dataItemId`=`cspeed`).

![Sample Example](figures/Sample%20Example.png "Sample Example"){: width="0.8"}

> Note: See {{lst(sample-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Sample)}} lists the additional and/or updated attributes for {{block(Sample)}}.

#### Value Properties of Sample

{{tbl(value-properties-of-sample)}} lists the Value Properties of {{block(Sample)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(duration)}} | `SECOND` | 0..1 |
| {{property(resetTriggered)}} | `ResetTriggeredEnum` | 0..1 |
| {{property(sampleRate)}} | `float` | 0..1 |
| {{property(statistic)}} | `StatisticEnum` | 0..1 |
| {{property(result)}} | `float` | 0..1 |
| {{property(units)}} | `UnitEnum` | 1 |
| {{property(type)}} | `SampleEnum` | 1 |
{: caption="Value Properties of Sample"}

Descriptions for Value Properties of {{block(Sample)}}:

* {{property(duration)}} 

    time-period over which the data was collected.
    
    {{property(duration)}} **MUST** be provided when the {{property(statistic)}} attribute of the {{block(DataItem)}} is defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(resetTriggered)}} 

    identifies when a reported value has been reset and what has caused that reset to occur for those {{block(DataItem)}} entities that may be periodically reset to an initial value.
    
    {{property(resetTriggered)}} **MUST** only be provided for the specific occurrence of a {{block(DataItem)}} reported in the {{block(MTConnectStreams)}} {{term(response document)}} when the reset occurred.

    The value of {{property(resetTriggered)}} **MUST** be one of the `ResetTriggeredEnum` enumeration.

* {{property(sampleRate)}} 

    rate at which successive samples of the value are recorded.
    

* {{property(statistic)}} 

    type of statistical calculation defined by the {{property(statistic)}} attribute of the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration.
