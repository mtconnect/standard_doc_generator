
## Properties of DataItem

This section provides semantic information for the elements of a {{block(DataItem)}}.

> Note: See {{sect(DataItems Schema Diagrams)}} for XML schema of the elements for {{block(DataItem)}}.

### ResetTrigger


type of event that may cause a reset to occur.


#### Value Properties of ResetTrigger

{{tbl(value-properties-of-resettrigger)}} lists the Value Properties of {{block(ResetTrigger)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(type)}} | `ResetTriggerEnum` | 1 |
{: caption="Value Properties of ResetTrigger"}

Descriptions for Value Properties of {{block(ResetTrigger)}}:

* {{property(type)}} 

    type of {{block(ResetTrigger)}}.

    The value of {{property(type)}} **MUST** be one of the `ResetTriggerEnum` enumeration.

    `ResetTriggerEnum` Enumeration:


    * `ACTION_COMPLETE` 

        {{term(observation)}} of the {{block(DataItem)}} that is measuring an action or operation is to be reset upon completion of that action or operation.

    * `ANNUAL` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a 12-month period.

    * `DAY` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a 24-hour period.

    * `LIFE` 

        {{term(observation)}} of the {{block(DataItem)}} is not reset and accumulates for the entire life of the piece of equipment.

    * `MAINTENANCE` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset upon completion of a maintenance event.

    * `MONTH` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a monthly period.

    * `POWER_ON` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset when power was applied to the piece of equipment after a planned or unplanned interruption of power has occurred.

    * `SHIFT` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a work shift.

    * `WEEK` 

        {{term(observation)}} of the {{block(DataItem)}} is to be reset at the end of a 7-day period.

### Source


identifies the {{block(Component)}}, {{block(DataItem)}}, or {{block(Composition)}} from which a measured value originates.

One of {{property(componentId)}}, {{property(compositionId)}}, or {{property(dataItemId)}} **MUST** be defined for {{block(Source)}}.


    The value of {{property(Source)}} **MUST** be `string`.


#### Value Properties of Source

{{tbl(value-properties-of-source)}} lists the Value Properties of {{block(Source)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(componentId)}} | `ID` | 0..1 |
| {{property(compositionId)}} | `ID` | 0..1 |
| {{property(dataItemId)}} | `ID` | 0..1 |
{: caption="Value Properties of Source"}

Descriptions for Value Properties of {{block(Source)}}:

* {{property(componentId)}} 

    identifier attribute of the {{block(Component)}} element that represents the physical part of a piece of equipment where the data represented by the {{block(DataItem)}} element originated.

* {{property(compositionId)}} 

    identifier attribute of the {{block(Composition)}} element that the reported data is most closely associated.

* {{property(dataItemId)}} 

    identifier attribute of the {{block(DataItem)}} that represents the originally measured value of the data referenced by this data item.

### InitialValue


starting value for a {{block(DataItem)}} as well as the value to be set for the {{block(DataItem)}} after a reset event.


    The value of {{property(InitialValue)}} **MUST** be `string`.


### Filter


provides a means to control when an {{term(agent)}} records updated information for a {{block(DataItem)}}. 


#### Value Properties of Filter

{{tbl(value-properties-of-filter)}} lists the Value Properties of {{block(Filter)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(type)}} | `FilterEnum` | 1 |
{: caption="Value Properties of Filter"}

Descriptions for Value Properties of {{block(Filter)}}:

* {{property(type)}} 

    type of {{block(Filter)}}

    The value of {{property(type)}} **MUST** be one of the `FilterEnum` enumeration.

    `FilterEnum` Enumeration:


    * `MINIMUM_DELTA` 

        new value **MUST NOT** be reported for a data item unless the measured value has changed from the last reported value by at least the delta given as the value of this element.
        
        The value of {{block(Filter)}} **MUST** be an absolute value using the same units as the reported data.

    * `PERIOD` 

        data reported for a data item is provided on a periodic basis. The `PERIOD` for reporting data is defined in the value of the {{block(Filter)}}.
        
        The value of {{block(Filter)}} **MUST** be an absolute value reported in seconds representing the time between reported samples of the value of the data item.

### Constraints


{{termplural(organize)}} a set of expected values that can be reported for a {{block(DataItem)}}.


#### Value Properties of Constraints

{{tbl(value-properties-of-constraints)}} lists the Value Properties of {{block(Constraints)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| `<<deprecated>>`{{property(Filter)}} | `FilterEnum` | 0..1 |
| {{property(Maximum)}} | `float` | 0..1 |
| {{property(Minimum)}} | `float` | 0..1 |
| {{property(Nominal)}} | `float` | 0..1 |
| {{property(Value)}} | `string` | 0..* |
{: caption="Value Properties of Constraints"}

Descriptions for Value Properties of {{block(Constraints)}}:

* `<<deprecated>>`{{property(Filter)}} 

    **DEPRECATED** in *MTConnect Version 1.4* – Moved to the {{block(Filters)}} element of {{block(DataItem)}}.

* {{property(Maximum)}} 

    numeric upper constraint.
    
    If the data reported for a data item is a range of numeric values, the expected value reported **MAY** be described with an upper limit defined by this constraint.

* {{property(Minimum)}} 

    numeric lower constraint.
    
    If the data reported for a data item is a range of numeric values, the expected value reported **MAY** be described with a lower limit defined by this constraint.

* {{property(Nominal)}} 

    numeric target or expected value.

* {{property(Value)}} 

    single data value that is expected to be reported for a {{block(DataItem)}}.
    
    {{property(Value)}} **MUST NOT** be used in conjunction with any other {{block(Constraint)}} elements.

### Definition


defines the meaning of {{block(Entry)}} and {{block(Cell)}} elements associated with the {{block(DataItem)}} when the {{property(representation)}} is either `DATA` or `TABLE`.


#### Part Properties of Definition

{{tbl(part-properties-of-definition)}} lists the Part Properties of {{block(Definition)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(CellDefinition)}} (organized by {{block(CellDefinitions)}}) | 0..* |
| {{block(Description)}} | 0..1 |
| {{block(EntryDefinition)}} (organized by {{block(EntryDefinitions)}}) | 0..* |
{: caption="Part Properties of Definition"}

Descriptions for Part Properties of {{block(Definition)}}:

* {{block(CellDefinition)}} 

    semantic definition of a {{block(Cell)}}.
    {{block(CellDefinitions)}} groups one or more {{block(CellDefinition)}} entities. See {{sect(CellDefinition)}}.

* {{block(Description)}} 

    descriptive content.
    See {{sect(Description)}}.

* {{block(EntryDefinition)}} 

    semantic definition of an {{block(Entry)}}.
    {{block(EntryDefinitions)}} groups one or more {{block(EntryDefinition)}} entities. See {{sect(EntryDefinition)}}.
