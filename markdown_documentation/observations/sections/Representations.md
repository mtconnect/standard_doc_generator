
## Representations

This section provides semantic information for the {{block(Representation)}} model.

![Representation](figures/Representation.png "Representation"){: width="0.8"}

> Note: See {{sect(Representation Schema Diagrams)}} for XML schema.

### Representation


specifies the format and structure of the {{property(result)}} for an {{block(Observation)}}. 

The {{block(Representation)}} type for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} in the {{term(MTConnectDevices Response Document)}}.

{{block(Value)}} is the default {{block(Representation)}} type for all {{block(Observation)}} types.

The name of the {{block(Observation)}} type is modified for all {{block(Representation)}} types other than {{block(Value)}} by appending the pascal case of the {{block(Representation)}} type. 

Example: The name for {{block(Sample)}} {{block(Observation)}} type `Temperature`with `Representation` type of `TimeSeries` becomes `TemperatureTimeSeries`.

### Value


default {{block(Representation)}} type for all {{block(Observation)}} types where {{property(result)}} of the {{block(Observation)}} types is an MTConnect data type. See {{sect(Data Types)}}.


### TimeSeries


{{block(Representation)}} for an {{block(Observation)}} composed of a series of sampled data.



{{block(TimeSeries)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `TIME_SERIES`.

{{block(DataItem)}} with `TIME_SERIES` {{property(representation)}} **MUST** have a {{property(category)}} of `SAMPLE`.

{{fig(TemperatureTimeSeries)}} shows the model for {{block(Temperature)}} ({{block(Sample)}} type) with a {{block(Representation)}} type of {{block(TimeSeries)}}. 

![TemperatureTimeSeries](figures/TemperatureTimeSeries.png "TemperatureTimeSeries"){: width="0.8"}

> Note: See {{fig(AbsTimeSeries Schema)}} for XML schema.

{{block(TimeSeries)}} **MUST** report multiple values at fixed intervals in a single {{block(Observation)}}. At minimum, one of {{block(DataItem)}} or {{block(Observation)}} **MUST** specify the {{property(sampleRate)}} in `Hertz`(values/second); fractional rates are permitted. When the {{block(Observation)}} and the {{block(DataItem)}} specify the {{property(sampleRate)}}, the {{block(Observation)}} {{property(sampleRate)}} supersedes the {{block(DataItem)}}.

The {{block(Observation)}} **MUST** set the {{property(timestamp)}} to the time the last value was observed. The {{property(duration)}} **MAY** indicate the time interval from the first to the last value in the series.

{{sect(Value Properties of TimeSeries)}} defines additional attributes for an {{block(Observation)}} with {{block(TimeSeries)}} {{block(Representation)}} type.

#### Value Properties of TimeSeries

{{tbl(value-properties-of-timeseries)}} lists the Value Properties of {{block(TimeSeries)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(sampleCount)}}|`integer`|1|
|{{property(result)}}|`float`|1..*|
{: caption="Value Properties of TimeSeries"}

Descriptions for Value Properties of {{block(TimeSeries)}}:

* {{property(sampleCount)}} 

    number of values given for the {{block(Observation)}}.

### Discrete


**DEPRECATED** {{block(Representation)}} for an {{block(Observation)}} where each discrete occurrence of the data may have the same value as the previous occurrence of the data.



{{block(Discrete)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `DISCRETE`.

{{block(DataItem)}} with `DISCRETE` {{property(representation)}} **MUST** have a {{property(category)}} of `EVENT`.

*MTConnect Version 1.5* replaced {{property(representation)}} `DISCRETE` with a {{property(discrete)}} property for {{block(DataItem)}}.

Each occurrence of the {{block(Observation)}} **MAY** have the same value as the previous occurrence, and **MUST NOT** suppress duplicates.

Examples of {{block(Discrete)}}: A `PartCount` reporting the completion of each part using a 1 to indicate completion of a single part, a `Message` that occurs each time a door opens. 

#### Value Properties of Discrete

{{tbl(value-properties-of-discrete)}} lists the Value Properties of {{block(Discrete)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(result)}}|`string`|0..1|
{: caption="Value Properties of Discrete"}

### DataSet


{{block(Representation)}} for an {{block(Observation)}} composed of value(s) represented as a set of {{termplural(key-value pair)}}.



{{block(DataSet)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `DATA_SET`.

{{block(DataItem)}} with `DATA_SET` {{property(representation)}} **MUST** have a {{property(category)}} of `SAMPLE` or `EVENT`.

{{fig(VariableDataSet)}} shows the model for {{block(Variable)}} ({{block(Event)}} type) with a {{block(Representation)}} type of {{block(DataSet)}}. 

![VariableDataSet](figures/VariableDataSet.png "VariableDataSet"){: width="0.8"}

> Note: See {{fig(DataSet Schema)}} for XML schema.

{{block(DataSet)}} reports multiple values as a set of {{term(key-value pair)}} where each {{term(key)}} **MUST** be unique. The representation of the {{term(key-value pair)}} is an {{block(Entry)}}. The value of each {{block(Entry)}} **MUST** have the same constraints and format as the {{block(Observation)}} defined for the `VALUE` {{property(representation)}} for the {{block(DataItem)}} {{property(type)}} (See {{sect(Value)}}). 

The meaning of each {{block(Entry)}} **MAY** be provided as the {{block(DataItem)}} {{block(EntryDefinition)}}.

{{fig(DataSet Example)}} shows {{block(Event)}} {{block(Observation)}} type {{block(Variable)}} with a {{block(Representation)}} type of `DataSet`.

![DataSet Example](figures/DataSet%20Example.png "DataSet Example"){: width="0.8"}

> Note: See {{lst(dataset-example)}} for the {{term(XML)}} representation of the same example.

#### Management of Data Set Observations

An {{term(agent)}} **MUST** maintain the current state of the {{block(DataSet)}} as described in {{citetitle(MTCPart1)}} *Section Part 1: Management of Streaming Data Storage*.

One or more {{termplural(key-value pair)}} **MAY** be added, removed, or changed in an {{block(Observation)}}. An {{term(agent)}} **MUST** publish the changes to one or more {{termplural(key-value pair)}} as a single {{block(Observation)}}. An {{term(agent)}} **MUST** indicate the removal of a {{term(key-value pair)}} from a {{block(DataSet)}} using the {{property(removed)}} attribute equal `true`.

When the {{block(DataItem)}} {{property(discrete,DataItem)}} attribute is `false` or is not present, an {{term(agent)}} in response to a {{term(sample request)}} **MUST** only publish the changed {{term(key-value pair)}} since the previous state of the {{block(DataSet)}}.

When the {{block(DataItem)}} {{property(discrete,DataItem)}} attribute is `true`, an {{term(agent)}}, in response to a {{term(sample request)}}, **MUST** report all {{termplural(key-value pair)}} ignoring the state of the {{block(DataSet)}}.

When an {{term(agent)}} responds to a {{term(current request)}}, the {{term(response document)}} **MUST** include the full set of {{termplural(key-value pair)}}. If the {{term(current request)}} includes an `at` query parameter, the {{term(agent)}} **MUST** provide the set of {{termplural(key-value pair)}} at the  {{term(sequence number)}}.

When an {{block(Observation)}} {{term(reset)}} occurs, the {{block(DataSet)}} **MUST** remove all {{termplural(key-value pair)}} making the set empty. The {{block(Observation)}} **MAY** simultaneously populate the {{block(DataSet)}} with new {{termplural(key-value pair)}}. The previous entries **MUST NOT** be included and **MUST NOT** have {{property(removed)}} attribute equal `true`.

When the {{block(Observation)}}  is `UNAVAILABLE` the {{block(DataSet)}} **MUST** remove all {{termplural(key-value pair)}} making the set empty.

#### Value Properties of DataSet

{{tbl(value-properties-of-dataset)}} lists the Value Properties of {{block(DataSet)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(count)}}|`integer`|1|
{: caption="Value Properties of DataSet"}

Descriptions for Value Properties of {{block(DataSet)}}:

* {{property(count)}} 

    number of {{block(Entry)}} elements for the {{block(Observation)}}.

#### Part Properties of DataSet

{{tbl(part-properties-of-dataset)}} lists the Part Properties of {{block(DataSet)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Entry)}}|0..*|
{: caption="Part Properties of DataSet"}

Descriptions for Part Properties of {{block(DataSet)}}:

* {{block(Entry)}} 

    {{term(key-value pair)}} published as part of a {{block(DataSet)}}.

    See {{sect(Entry)}}.

### Table


{{block(Representation)}} for an {{block(Observation)}} composed of two-dimensional sets of {{termplural(key-value pair)}} where the {{block(Entry)}} represents rows containing sets of {{termplural(key-value pair)}} given by {{block(Cell)}} entities. 


{{block(Table)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `TABLE`.

{{block(DataItem)}} with `TABLE` {{property(representation)}} **MUST** have a {{property(category)}} of `SAMPLE` or `EVENT`.

{{fig(WorkOffsetTable)}} shows the model for {{block(WorkOffset)}} ({{block(Event)}} type) with a {{block(Representation)}} type of {{block(Table)}}. 

![WorkOffsetTable](figures/WorkOffsetTable.png "WorkOffsetTable"){: width="0.8"}

> Note: See {{fig(Table Schema)}} for XML schema.

{{block(Table)}} has the same behavior as the {{block(DataSet)}} for change tracking, clearing, and history. When an {{block(Entry)}} changes, all {{block(Cell)}} entities update at the same time; they are not tracked separately like {{block(Entry)}}.

The meaning of each {{block(Entry)}} and {{block(Cell)}} **MAY** be provided as the {{block(DataItem)}} {{block(EntryDefinition)}} and {{block(CellDefinition)}}.

The {{block(Entry)}} {{property(key)}} attribute **MUST** be the unique identity of the {{block(Entry)}} within an {{block(Observation)}}. The {{block(Cell)}} {{property(key)}} attribute **MUST** be the unique identity of the {{block(Cell)}} within an {{block(Entry)}}.

{{fig(Table Example)}} shows {{block(Event)}} {{block(Observation)}} type {{block(WorkOffset)}} with a {{block(Representation)}} type of `Table`.

![Table Example](figures/Table%20Example.png "Table Example"){: width="0.8"}

> Note: See {{lst(table-example)}} for the {{term(XML)}} representation of the same example.



#### Value Properties of Table

{{tbl(value-properties-of-table)}} lists the Value Properties of {{block(Table)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(count)}}|`integer`|1|
{: caption="Value Properties of Table"}

Descriptions for Value Properties of {{block(Table)}}:

* {{property(count)}} 

    number of {{termplural(key-value pair)}} represented as {{block(Entry)}} entities.

#### Part Properties of Table

{{tbl(part-properties-of-table)}} lists the Part Properties of {{block(Table)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(TableEntry)}}|0..*|
{: caption="Part Properties of Table"}

Descriptions for Part Properties of {{block(Table)}}:

* {{block(TableEntry)}} 

    {{term(key-value pair)}} published as part of a {{block(Table)}}.
    
    > Note: In the {{term(XML)}} representation, {{block(TableEntry)}} **MUST** appear as {{block(Entry)}}.
    
    

    See {{sect(TableEntry)}}.

### Entry


{{term(key-value pair)}} published as part of a {{block(DataSet)}}.

#### Constraints for Entry Values

The value of each {{block(Entry)}} **MUST** have the same restrictions as the value of an {{term(observation)}} with {{property(representation)}} of `VALUE`.

An {{block(Entry)}} **MAY** be further constrained by the {{block(DataItem)}} definition (see {{citetitle(MTCPart2)}}), for example a `VariableDataSet` having a string value **MAY** have a floating-point {{block(Temperature)}} value. A restriction **MUST NOT** be broadened or removed, for example, the value "READY" **MUST NOT** occur with a `TemperatureDataSet` constrained to floating-point numbers.

The {{citetitle(MTCPart2)}} {{block(DataItem)}} {{block(Definition)}} **MAY** provide the {{property(type)}} and {{property(units)}} of an {{block(Entry)}} for a {{property(key)}}.


#### Value Properties of Entry

{{tbl(value-properties-of-entry)}} lists the Value Properties of {{block(Entry)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(key)}}|`ID`|1|
|{{property(removed)}}|`boolean`|0..1|
|{{property(result)}}|`string`|0..1|
{: caption="Value Properties of Entry"}

Descriptions for Value Properties of {{block(Entry)}}:

* {{property(key)}} 

    unique identifier for each {{term(key-value pair)}}.

* {{property(removed)}} 

    removal indicator of a {{term(key-value pair)}}.

* {{property(result)}} 

    value of the {{block(Entry)}}.

### TableEntry


{{term(key-value pair)}} published as part of a {{block(Table)}}.

> Note: In the {{term(XML)}} representation, {{block(TableEntry)}} **MUST** appear as {{block(Entry)}}.




#### Value Properties of TableEntry

{{tbl(value-properties-of-tableentry)}} lists the Value Properties of {{block(TableEntry)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(key)}}|`ID`|1|
|{{property(removed)}}|`boolean`|0..1|
{: caption="Value Properties of TableEntry"}

Descriptions for Value Properties of {{block(TableEntry)}}:

* {{property(key)}} 

    unique identifier for each {{term(key-value pair)}}.

* {{property(removed)}} 

    removal indicator of a {{term(key-value pair)}}.

#### Reference Properties of TableEntry

{{tbl(reference-properties-of-tableentry)}} lists the Reference Properties of {{block(TableEntry)}}.

|Reference Property name|Multiplicity|
|:-|:-:|
|{{block(Table)}} (organized by {{block(TableEntry)}})|1|
{: caption="Reference Properties of TableEntry"}

Descriptions for Reference Properties of {{block(TableEntry)}}:

* {{block(Table)}} 

    {{block(Representation)}} for an {{block(Observation)}} composed of two-dimensional sets of {{termplural(key-value pair)}} where the {{block(Entry)}} represents rows containing sets of {{termplural(key-value pair)}} given by {{block(Cell)}} entities. 
    

    See {{sect(TableEntry)}}.

#### Part Properties of TableEntry

{{tbl(part-properties-of-tableentry)}} lists the Part Properties of {{block(TableEntry)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Cell)}}|0..*|
{: caption="Part Properties of TableEntry"}

Descriptions for Part Properties of {{block(TableEntry)}}:

* {{block(Cell)}} 

    {{term(key-value pair)}} published as part of a {{block(TableEntry)}}.

    See {{sect(Cell)}}.

### Cell


{{term(key-value pair)}} published as part of a {{block(TableEntry)}}.

#### Constraints for Cell Values

The value of each {{block(Cell)}} **MUST** have the same restrictions as the value of an {{term(observation)}} with {{property(representation)}} of `VALUE`.

An {{block(Cell)}} **MAY** be further constrained by the {{block(DataItem)}} definition (see {{citetitle(MTCPart2)}}), for example a `VariableDataSet` having a string value **MAY** have a floating-point {{block(Temperature)}} value. A restriction **MUST NOT** be broadened or removed, for example, the value `READY` **MUST NOT** occur with a `TemperatureDataSet` constrained limited to floating-point numbers.

The {{citetitle(MTCPart2)}} {{block(DataItem)}} {{block(Definition)}} **MAY** provide the {{property(type)}} and {{property(units)}} of a {{block(Cell)}} for a {{property(key)}}.

#### Value Properties of Cell

{{tbl(value-properties-of-cell)}} lists the Value Properties of {{block(Cell)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(key)}}|`ID`|1|
|{{property(result)}}|`string`|0..1|
{: caption="Value Properties of Cell"}

Descriptions for Value Properties of {{block(Cell)}}:

* {{property(key)}} 

    unique identifier for each {{term(key-value pair)}}.

* {{property(result)}} 

    value of the {{block(Cell)}}.
