
## Specifications

This section provides semantic information for the {{block(Specification)}} entity.

![Specifications](figures/Specifications.png "Specifications"){: width="0.8"}

> Note: See {{figure(Specifications Schema)}} for XML schema.

![Specification Example](figures/Specification%20Example.png "Specification Example"){: width="0.8"}

> Note: See {{lst(specification-example)}} for the {{term(XML)}} representation of the same example.

### Specification

design characteristics for a piece of equipment.



#### Value Properties of Specification

{{tbl(value-properties-of-specification)}} lists the Value Properties of {{block(Specification)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`DataItemTypeEnum`|1|
|{{property(subType)}}|`DataItemSubTypeEnum`|0..1|
|{{property(dataItemIdRef)}}|`ID`|0..1|
|{{property(units)}}|`UnitEnum`|0..1|
|{{property(compositionIdRef)}}|`ID`|0..1|
|{{property(name)}}|`string`|0..1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
|{{property(id)}}|`ID`|0..1|
|{{property(originator)}}|`OriginatorEnum`|1|
{: caption="Value Properties of Specification" label="table:value-properties-of-specification"}

Descriptions for Value Properties of {{block(Specification)}}:

* {{property(type)}} 

    same as {{block(DataItem)}} {{property(type)}}. See {{package(DataItem Types)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration. 

* {{property(subType)}} 

    same as {{block(DataItem)}} {{property(DataItem::subType)}}. See {{sect(DataItem)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration. 

* {{property(dataItemIdRef)}} 

    reference to the {{property(id)}} attribute of the {{block(DataItem)}} associated with this element.

* {{property(units)}} 

    same as {{block(DataItem)}} {{property(DataItem::units)}}. See {{sect(DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

* {{property(compositionIdRef)}} 

    reference to the {{property(id)}} attribute of the {{block(Composition)}} associated with this element.

* {{property(name)}} 

    {{property(name)}} provides additional meaning and differentiates between {{block(Specification)}} elements.

* {{property(coordinateSystemIdRef)}} 

    references the {{block(CoordinateSystem)}} for geometric {{block(Specification)}} elements.

* {{property(id)}} 

    unique identifier for this {{block(Specification)}}.

* {{property(originator)}} 

    reference to the creator of the {{block(Specification)}}.

    `OriginatorEnum` Enumeration:

    * `MANUFACTURER` 

        manufacturer of a piece of equipment or {{block(Component)}}.

    * `USER` 

        owner or implementer of a piece of equipment or {{block(Component)}}.

#### Part Properties of Specification

{{tbl(part-properties-of-specification)}} lists the Part Properties of {{block(Specification)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Maximum)}}|0..1|
|{{block(UpperLimit)}}|0..1|
|{{block(LowerWarning)}}|0..1|
|{{block(LowerLimit)}}|0..1|
|{{block(UpperWarning)}}|0..1|
|{{block(Nominal)}}|0..1|
|{{block(Minimum)}}|0..1|
{: caption="Part Properties of Specification" label="table:part-properties-of-specification"}

Descriptions for Part Properties of {{block(Specification)}}:

* {{block(Maximum)}} 

    numeric upper constraint.

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(LowerWarning)}} 

    lower boundary indicating increased concern and supervision may be required.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(UpperWarning)}} 

    upper boundary indicating increased concern and supervision may be required.

* {{block(Nominal)}} 

    numeric target or expected value.

* {{block(Minimum)}} 

    numeric lower constraint.

### ProcessSpecification

{{block(Specification)}} that provides information used to assess the conformance of a variable to process requirements.



#### Part Properties of ProcessSpecification

{{tbl(part-properties-of-processspecification)}} lists the Part Properties of {{block(ProcessSpecification)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(SpecificationLimits)}}|0..1|
|{{block(ControlLimits)}}|0..1|
|{{block(AlarmLimits)}}|0..1|
{: caption="Part Properties of ProcessSpecification" label="table:part-properties-of-processspecification"}

Descriptions for Part Properties of {{block(ProcessSpecification)}}:

* {{block(SpecificationLimits)}} 

    set of limits that define a range of values designating acceptable performance for a variable.

    See {{sect(SpecificationLimits)}}.

* {{block(ControlLimits)}} 

    set of limits that is used to indicate whether a process variable is stable and in control.

    See {{sect(ControlLimits)}}.

* {{block(AlarmLimits)}} 

    set of limits that is used to trigger warning or alarm indicators.

    See {{sect(AlarmLimits)}}.

### ControlLimits

set of limits that is used to indicate whether a process variable is stable and in control.



#### Part Properties of ControlLimits

{{tbl(part-properties-of-controllimits)}} lists the Part Properties of {{block(ControlLimits)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(UpperLimit)}}|0..1|
|{{block(UpperWarning)}}|0..1|
|{{block(LowerWarning)}}|0..1|
|{{block(Nominal)}}|0..1|
|{{block(LowerLimit)}}|0..1|
{: caption="Part Properties of ControlLimits" label="table:part-properties-of-controllimits"}

Descriptions for Part Properties of {{block(ControlLimits)}}:

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(UpperWarning)}} 

    upper boundary indicating increased concern and supervision may be required.

* {{block(LowerWarning)}} 

    lower boundary indicating increased concern and supervision may be required.

* {{block(Nominal)}} 

    numeric target or expected value.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

### AlarmLimits

set of limits that is used to trigger warning or alarm indicators.



#### Part Properties of AlarmLimits

{{tbl(part-properties-of-alarmlimits)}} lists the Part Properties of {{block(AlarmLimits)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(UpperLimit)}}|0..1|
|{{block(UpperWarning)}}|0..1|
|{{block(LowerLimit)}}|0..1|
|{{block(LowerWarning)}}|0..1|
{: caption="Part Properties of AlarmLimits" label="table:part-properties-of-alarmlimits"}

Descriptions for Part Properties of {{block(AlarmLimits)}}:

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(UpperWarning)}} 

    upper boundary indicating increased concern and supervision may be required.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(LowerWarning)}} 

    lower boundary indicating increased concern and supervision may be required.

### SpecificationLimits

set of limits that define a range of values designating acceptable performance for a variable.



#### Part Properties of SpecificationLimits

{{tbl(part-properties-of-specificationlimits)}} lists the Part Properties of {{block(SpecificationLimits)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(UpperLimit)}}|0..1|
|{{block(Nominal)}}|0..1|
|{{block(LowerLimit)}}|0..1|
{: caption="Part Properties of SpecificationLimits" label="table:part-properties-of-specificationlimits"}

Descriptions for Part Properties of {{block(SpecificationLimits)}}:

* {{block(UpperLimit)}} 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

* {{block(Nominal)}} 

    numeric target or expected value.

* {{block(LowerLimit)}} 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.

### UpperWarning

upper boundary indicating increased concern and supervision may be required.



The value of {{property(UpperWarning)}} **MUST** be `float`.

### UpperLimit

upper conformance boundary for a variable.

> Note: immediate concern or action may be required.



The value of {{property(UpperLimit)}} **MUST** be `float`.

### Maximum

numeric upper constraint.



The value of {{property(Maximum)}} **MUST** be `float`.

### LowerLimit

lower conformance boundary for a variable.

> Note: immediate concern or action may be required.



The value of {{property(LowerLimit)}} **MUST** be `float`.

### LowerWarning

lower boundary indicating increased concern and supervision may be required.



The value of {{property(LowerWarning)}} **MUST** be `float`.

### Minimum

numeric lower constraint.



The value of {{property(Minimum)}} **MUST** be `float`.

### Nominal

numeric target or expected value.



The value of {{property(Nominal)}} **MUST** be `float`.
