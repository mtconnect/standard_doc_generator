
## DeviceStream

{{termplural(organize)}} data reported from a {{block(Device)}}.


{{block(DeviceStream)}} **MUST** be provided for each {{block(Device)}} reporting data in an {{term(MTConnectStreams Response Document)}}.

If the response to the request for data from an {{term(agent)}} does not contain any data for a specific {{block(Device)}}, an empty {{block(DeviceStream)}} entity **MAY** be created to indicate that the {{block(Device)}} exists, but there was no data available.


### Value Properties of DeviceStream

{{tbl(value-properties-of-devicestream)}} lists the Value Properties of {{block(DeviceStream)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(name)}}|`string`|1|
|{{property(uuid)}}|`UUID`|1|
{: caption="Value Properties of DeviceStream" label="table:value-properties-of-devicestream"}

Descriptions for Value Properties of {{block(DeviceStream)}}:

* {{property(name)}} 

    name of the {{block(Device)}}.
    
    The value reported for {{property(DeviceStream::name)}} **MUST** be the same as the value defined for the {{property(Device::name)}} in the {{term(MTConnectDevices Response Document)}}.

* {{property(uuid)}} 

    uuid of the {{block(Device)}}.  The value reported for {{property(DeviceStream::uuid)}} **MUST** be the same as the value defined for the {{property(Device::uuid)}} of the same {{block(Device)}} in the {{term(MTConnectDevices Response Document)}}.

### Part Properties of DeviceStream

{{tbl(part-properties-of-devicestream)}} lists the Part Properties of {{block(DeviceStream)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(ComponentStream)}}|1..*|
{: caption="Part Properties of DeviceStream" label="table:part-properties-of-devicestream"}

Descriptions for Part Properties of {{block(DeviceStream)}}:

* {{block(ComponentStream)}} 

    organizes the data associated with each {{block(Component)}} entity defined for a {{block(Device)}} in the associated {{term(MTConnectDevices Response Document)}}.

    See {{sect(ComponentStream)}}.

## ComponentStream

organizes the data associated with each {{block(Component)}} entity defined for a {{block(Device)}} in the associated {{term(MTConnectDevices Response Document)}}.


At least one of {{block(Sample)}}, {{block(Event)}}, or {{block(Condition)}} **MUST** be organized by a {{block(ComponentStream)}} entity.


### Value Properties of ComponentStream

{{tbl(value-properties-of-componentstream)}} lists the Value Properties of {{block(ComponentStream)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(component)}}|`string`|1|
|{{property(componentId)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
|{{property(nativeName)}}|`string`|0..1|
|{{property(uuid)}}|`UUID`|0..1|
{: caption="Value Properties of ComponentStream" label="table:value-properties-of-componentstream"}

Descriptions for Value Properties of {{block(ComponentStream)}}:

* {{property(component)}} 

    identifies the {{block(Component)}} type associated with the {{block(ComponentStream)}}.
    
    Examples of {{property(ComponentStream::component)}} are {{block(Device)}}, {{block(Controller)}}, {{block(Linear)}} and {{block(Loader)}}.

* {{property(componentId)}} 

    identifier of the {{block(Component)}} as defined by the {{property(Component::id)}} in the {{term(MTConnectDevices Response Document)}}.

* {{property(name)}} 

    name of the {{block(Component)}} associated with the {{block(ComponentStream)}}.

* {{property(nativeName)}} 

    common name of the {{block(Component)}} associated with the {{block(ComponentStream)}}.

* {{property(uuid)}} 

    uuid of the {{block(Component)}} associated with the {{block(ComponentStream)}}.

### Reference Properties of ComponentStream

{{tbl(reference-properties-of-componentstream)}} lists the Reference Properties of {{block(ComponentStream)}}.

|Reference Property name|Multiplicity|
|:-|:-:|
|{{block(Event)}} (organized by `Events`)|0..*|
|{{block(Sample)}} (organized by `Samples`)|0..*|
|{{block(Condition)}} (organized by `Conditions`)|0..*|
{: caption="Reference Properties of ComponentStream" label="table:reference-properties-of-componentstream"}

Descriptions for Reference Properties of {{block(ComponentStream)}}:

* {{block(Event)}} 

    {{block(Observation)}} that is a discrete piece of information from a piece of equipment.
    

    {{block(Events)}} groups one or more {{block(Event)}} entities. See {{sect(Event)}}.

* {{block(Sample)}} 

    {{block(Observation)}} that is continuously changing or analog data value.
    

    {{block(Samples)}} groups one or more {{block(Sample)}} entities. See {{sect(Sample)}}.

* {{block(Condition)}} 

    {{block(Observation)}} that provides the {{term(condition)}} of a piece of equipment or a {{term(Component)}}.
    
    

    {{block(Conditions)}} groups one or more {{block(Condition)}} entities. See {{sect(Condition)}}.
    
    > Note: In the {{term(XML)}} representation, {{block(Conditions)}} **MUST** appear as `Condition` element in the {{term(MTConnectStreams Response Document)}}.

## Observation

abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.


![Observations](figures/Observations.png "Observations"){: width="0.8"}

> Note: See {{sect(Observations Schema Diagrams)}} for XML schema. The XML schema also shows differences in XML representation of certain MTConnect entities.

{{figure(DeviceStream Example)}} shows a complete example of {{block(DeviceStream)}} for the {{block(Device)}} shown in {{package(Device Information Model)}}.

![DeviceStream Example](figures/DeviceStream%20Example.png "DeviceStream Example"){: width="0.8"}

> Note: See {{lst(devicestream-example)}} for the {{term(XML)}} representation of the same example.


This section provides semantic information for the {{block(Observation)}} model.

> Note: See {{sect(Observations Schema Diagrams)}} for XML schema of {{block(Observation)}} types.

#### Observations made for DataItem

{{block(Component)}} {{termplural(observe)}} {{block(DataItem)}} entities and creates {{block(Observation)}} entities for the {{block(DataItem)}} entities. See {{figure(Observations)}}.

{{block(Observation)}} entities made by a {{block(Component)}} are organized by a {{block(ComponentStream)}} which is specifically created for that {{block(Component)}}.

![Observations made for DataItem Example](figures/Observations%20made%20for%20DataItem%20Example.png "Observations made for DataItem Example"){: width="0.8"}

> Note: See {{sect(Observations made for DataItem Example)}} for how XML representation of the same example is separated into {{term(MTConnectDevices Response Document)}} and {{term(MTConnectStreams Response Document)}}.

{{figure(Observations made for DataItem Example)}} is a subset of {{figure(DeviceStream Example)}}. It shows an example of the association between a {{block(DataItem)}} {{block(Event)}} type (`EMERGENCY_STOP`) and an {{block(Observation)}} {{block(Event)}} type (`EmergencyStop`). See {{sect(Naming Convention for Observation types)}}.

{{figure(Observations made for DataItem Example)}} also shows example of the association between a {{block(Component)}} type (`Controller`) and related {{block(ComponentStream)}}.

#### Naming Convention for Observation types

The name of an {{block(Observation)}} type **MUST** derive from the associated {{property(DataItem::type)}} converted to Pascal-Case by removing underscores (_ ) and capitalizing each word. The conversion **MUST NOT** apply to the following abbreviated words: `PH`, `AC`, `DC` and `URI`. `MTCONNECT` **MUST** be converted to `MTConnect`. See {{figure(Observations made for DataItem Example)}} for an example.

The name of an {{block(Observation)}} type reported in the {{term(MTConnectStreams Response Document)}} is extended when the {{property(DataItem::representation)}} is used to further describe that {{block(DataItem)}} in the {{term(MTConnectDevices Response Document)}}. See {{package(Representations)}} for more details.


### Value Properties of Observation

{{tbl(value-properties-of-observation)}} lists the Value Properties of {{block(Observation)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(compositionId)}}|`ID`|0..1|
|{{property(dataItemId)}}|`ID`|1|
|{{property(name)}}|`string`|0..1|
|{{property(sequence)}}|`integer`|1|
|{{property(subType)}}|`DataItemSubTypeEnum`|0..1|
|{{property(timestamp)}}|`datetime`|1|
|{{property(type)}}|`DataItemTypeEnum`|1|
|{{property(units)}}|`UnitEnum`|0..1|
|{{property(isUnavailable)}}|`boolean`|1|
{: caption="Value Properties of Observation" label="table:value-properties-of-observation"}

Descriptions for Value Properties of {{block(Observation)}}:

* {{property(compositionId)}} 

    identifier of the {{block(Composition)}} entity defined in the {{term(MTConnectDevices Response Document)}} associated with the data reported for the {{block(Observation)}}.

* {{property(dataItemId)}} 

    unique identifier of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(Observation::dataItemId)}} **MUST** match the associated {{property(DataItem::id)}} defined in the {{term(MTConnectDevices Response Document)}}.

* {{property(name)}} 

    name of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(Observation::name)}} **MUST** match the associated {{property(DataItem::name)}} defined in the {{term(MTConnectDevices Response Document)}}.

* {{property(sequence)}} 

    number representing the sequential position of an occurrence of an {{term(observation)}} in the data buffer of an {{term(agent)}}.
    
    {{property(Observation::sequence)}} **MUST** have a value represented as an unsigned 64-bit value from 1 to $$ 2^{64}-1 $$.

* {{property(subType)}} 

    subtype of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(Observation::subType)}} **MUST** match the associated {{property(DataItem::subType)}} defined in the {{term(MTConnectDevices Response Document)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(timestamp)}} 

    most accurate time available to a piece of equipment that represents the point in time that the data reported was measured.

* {{property(type)}} 

    type of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(Observation::type)}} **MUST** match the associated {{property(DataItem::type)}} defined in the {{term(MTConnectDevices Response Document)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(units)}} 

    units of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(Observation::units)}} **MUST** match the associated {{property(DataItem::units)}} defined in the {{term(MTConnectDevices Response Document)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(isUnavailable)}} 

    when `true`, {{property(Observation::result)}} is indeterminate.
    
    > Note 1 to entry: In {{term(XML)}}, when `isUnavailable` is `true`, the {{term(XML)}} `CDATA` of the `Observation` **MUST** be `UNAVAILABLE`.
     ```xml
    <Execution dataItemId="..." ...>UNAVAILABLE</Execution>
    ```
    
    > Note 2 to entry: In {{term(JSON)}}, when `isUnavailable` is `true`, the {{term(JSON)}} `value` of the `Observation` **MUST** be `UNAVAILABLE`.
    ```json
      "Execution" : [ { "dataItemId": "..." ..., "value": "UNAVAILABLE" } ]
    ```

* {{property(result)}} 

    {{term(observation)}} of the {{block(Observation)}} entity.
    
    The default value type for {{property(Observation::result)}} is `string`.
    
    > Note 1 to entry: in {{term(XML)}} the {{property(Observation::result)}} is the `CDATA` of the Observation {{term(element)}}.
    
    ~~~~xml
    <Execution dataItemId="..." ...>READY</Execution>
    ~~~~
    
    > Note 2 to entry: in {{term(JSON)}} the {{property(Observation::result)}} is the member `value` of the Observation object.
    
    ~~~~json
    "Execution" : [ { "dataItemId": "..." ..., "value": "READY" } ]
    ~~~~

## Sample

{{block(Observation)}} that is continuously changing or analog data value.




It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with {{property(DataItem::category)}} as `SAMPLE` in the {{term(MTConnectDevices Response Document)}}.

{{block(Sample)}} **MUST** always be reported in `float`.

{{figure(Sample Example)}} shows {{block(Sample)}} type examples. It also shows an example for when the {{property(Observation::result)}} is not available (`dataItemId`=`cspeed`).

![Sample Example](figures/Sample%20Example.png "Sample Example"){: width="0.8"}

> Note: See {{lst(sample-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Sample)}} lists the additional and/or updated attributes for {{block(Sample)}}.


The value of {{property(Sample)}} **MUST** be `float`.

The {{property(units)}} for {{block(Sample)}} **MUST** always be specified.

### Value Properties of Sample

{{tbl(value-properties-of-sample)}} lists the Value Properties of {{block(Sample)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(duration)}}|`SECOND`|0..1|
|{{property(resetTriggered)}}|`ResetTriggeredEnum`|0..1|
|{{property(sampleRate)}}|`float`|0..1|
|{{property(statistic)}}|`StatisticEnum`|0..1|
{: caption="Value Properties of Sample" label="table:value-properties-of-sample"}

Descriptions for Value Properties of {{block(Sample)}}:

* {{property(duration)}} 

    time-period over which the data was collected.
    
    {{property(Sample::duration)}} **MUST** be provided when the {{property(DataItem::statistic)}} is defined in the {{term(MTConnectDevices Response Document)}}.

* {{property(resetTriggered)}} 

    identifies when a reported value has been reset and what has caused that reset to occur for those {{block(DataItem)}} entities that may be periodically reset to an initial value.
    
    `resetTriggered` **MUST** only be provided for the specific occurrence of a {{block(DataItem)}} reported in the {{term(MTConnectStreams Response Document)}} when the reset occurred.

    `ResetTriggeredEnum` Enumeration:

    * `ACTION_COMPLETE` 

        {{property(Observation::result)}} is measuring an action or operation was reset upon completion of that action or operation.

    * `ANNUAL` 

        {{property(Observation::result)}} was reset at the end of a 12-month period.

    * `DAY` 

        {{property(Observation::result)}} was reset at the end of a 24-hour period.

    * `MAINTENANCE` 

        {{property(Observation::result)}} was reset upon completion of a maintenance event.

    * `MANUAL` 

        {{property(Observation::result)}} was reset based on a physical reset action.

    * `MONTH` 

        {{property(Observation::result)}} was reset at the end of a monthly period.

    * `POWER_ON` 

        {{property(Observation::result)}} was reset when power was applied to the piece of equipment after a planned or unplanned interruption of power has occurred.

    * `SHIFT` 

        {{property(Observation::result)}} was reset at the end of a work shift.

    * `WEEK` 

        {{property(Observation::result)}} was reset at the end of a 7-day period.

* {{property(sampleRate)}} 

    rate at which successive samples of the value are recorded.
    

* {{property(statistic)}} 

    type of statistical calculation defined by the {{property(DataItem::statistic)}} defined in the {{term(MTConnectDevices Response Document)}}.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration. 

## Event

{{block(Observation)}} that is a discrete piece of information from a piece of equipment.




It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with {{property(DataItem::category)}} as `EVENT` in the {{term(MTConnectDevices Response Document)}}.

{{figure(Event Example)}} shows {{block(Event)}} type examples. It also shows an example for when the {{property(Observation::result)}} is not available (`dataItemId`=`d1_asset_rem`).

![Event Example](figures/Event%20Example.png "Event Example"){: width="0.8"}

> Note: See {{lst(event-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Event)}} lists the additional and/or updated attributes for {{block(Event)}}.


### Value Properties of Event

{{tbl(value-properties-of-event)}} lists the Value Properties of {{block(Event)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(resetTriggered)}}|`ResetTriggeredEnum`|0..1|
{: caption="Value Properties of Event" label="table:value-properties-of-event"}

Descriptions for Value Properties of {{block(Event)}}:

* {{property(resetTriggered)}} 

    identifies when a reported value has been reset and what has caused that reset to occur for those {{block(DataItem)}} entities that may be periodically reset to an initial value.
    
    `resetTriggered` **MUST** only be provided for the specific occurrence of a {{block(DataItem)}} reported in the {{term(MTConnectStreams Response Document)}} when the reset occurred.

    The value of {{property(resetTriggered)}} **MUST** be one of the `ResetTriggeredEnum` enumeration. 

## Condition

{{block(Observation)}} that provides the {{term(condition)}} of a piece of equipment or a {{term(Component)}}.




It provides the information and data reported from a piece of equipment with {{property(DataItem::category)}} as `CONDITION` in the {{term(MTConnectDevices Response Document)}}.

{{figure(Condition Example)}} shows {{block(Condition)}} type examples for various {{property(Condition::state)}}: `Normal` (`dataItemId` = `path_system`) and `Warning` (`dataItemId` = `logic_cond`). It also shows an example for when the {{property(Condition::state)}} is not available (`dataItemId` = `cont_system`).

![Condition Example](figures/Condition%20Example.png "Condition Example"){: width="0.8"}

> Note: See {{lst(condition-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Condition)}} lists the additional and/or updated attributes for {{block(Condition)}}.


### Value Properties of Condition

{{tbl(value-properties-of-condition)}} lists the Value Properties of {{block(Condition)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(nativeCode)}}|`string`|0..1|
|{{property(nativeSeverity)}}|`string`|0..1|
|{{property(qualifier)}}|`QualifierEnum`|0..1|
|{{property(statistic)}}|`StatisticEnum`|0..1|
|{{property(xs:lang)}}|`xslang`|0..1|
|{{property(state)}}|`ConditionStateEnum`|0..1|
|{{property(conditionId)}}|`string`|1|
{: caption="Value Properties of Condition" label="table:value-properties-of-condition"}

Descriptions for Value Properties of {{block(Condition)}}:

* {{property(nativeCode)}} 

    native code is the proprietary identifier designating a specific alarm, fault or warning code provided by the piece of equipment.

* {{property(nativeSeverity)}} 

    severity information to a client software application if the piece of equipment designates a severity level to a fault.

* {{property(qualifier)}} 

    additional information regarding a {{term(condition state)}} associated with the measured value of a process variable.
    
    {{property(Condition::qualifier)}} defines whether the {{term(condition state)}} represented indicates a measured value that is above or below an expected value of a process variable.

    `QualifierEnum` Enumeration:

    * `HIGH` 

        measured value is greater than the expected value for a process variable.

    * `LOW` 

        measured value is less than the expected value for a process variable.

* {{property(statistic)}} 

    {{property(Condition::statistic)}} provides additional information describing the meaning of the {{block(Condition)}} entity.
    
    {{property(Condition::statistic)}} **MUST** match the {{property(DataItem::statistic)}} defined in the {{term(MTConnectDevices Response Document)}}.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration. 

* {{property(xs:lang)}} 

    specifies the language of the {{property(Observation::result)}} returned for the {{block(Condition)}}. 
    
    See {{cite(IETF RFC 4646)}} (http://www.ietf.org/rfc/rfc4646.txt).

* {{property(state)}} 

    {{term(condition state)}} of the piece of equipment or {{block(Component)}}.

    `ConditionStateEnum` Enumeration:

    * `Fault` 

        {{term(condition state)}} that requires intervention to continue operation to function properly.

    * `Normal` 

        {{term(condition state)}} that indicates operation within specified limits.

    * `Warning` 

        {{term(condition state)}} that requires concern and supervision and may become hazardous if no action is taken.

* {{property(conditionId)}} 

    identifier of an individual {{term(condition activation)}} provided by a piece of equipment.
    
    {{property(Condition::conditionId)}} **MUST** be unique for all concurrent {{termpl(condition activation)}}.
    
    {{property(Condition::conditionId)}} **MUST** be maintained for all state transitions related to the same {{term(condition activation)}}.
    
    Multiple {{property(Condition::conditionId)}}s **MAY** exist for the same {{property(nativeCode)}}.
    
    If {{property(Condition::conditionId)}} is not given, the value is the {{property(Condition::nativeCode)}}. If {{property(Condition::nativeCode)}} and {{property(Condition::conditionId)}} are not given, {{property(Condition::conditionId)}} **MUST** be generated.
