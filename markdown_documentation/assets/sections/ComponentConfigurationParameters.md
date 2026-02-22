
## Component Configuration Parameters

This section provides semantic information for the {{block(ComponentConfigurationParameters)}} model.

![ComponentConfigurationParameters](figures/ComponentConfigurationParameters.png "ComponentConfigurationParameters"){: width="0.8"}


### ComponentConfigurationParameters

set of {{block(ParameterSet)}}s that govern the functionality of the related {{block(Component)}}.



#### Part Properties of ComponentConfigurationParameters

{{tbl(part-properties-of-componentconfigurationparameters)}} lists the Part Properties of {{block(ComponentConfigurationParameters)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(ParameterSet)}} (organized by `ParameterSets`)|1..*|
{: caption="Part Properties of ComponentConfigurationParameters" label="table:part-properties-of-componentconfigurationparameters"}

Descriptions for Part Properties of {{block(ComponentConfigurationParameters)}}:

* {{block(ParameterSet)}} 

    set of {{block(Parameter)}}s.

    {{block(ParameterSets)}} groups one or more {{block(ParameterSet)}} entities. See {{sect(ParameterSet)}}.

### ParameterSet

set of {{block(Parameter)}}s.



#### Value Properties of ParameterSet

{{tbl(value-properties-of-parameterset)}} lists the Value Properties of {{block(ParameterSet)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(name)}}|`string`|0..1|
{: caption="Value Properties of ParameterSet" label="table:value-properties-of-parameterset"}

Descriptions for Value Properties of {{block(ParameterSet)}}:

* {{property(name)}} 

    name of the parameter set if more than one exists.

#### Part Properties of ParameterSet

{{tbl(part-properties-of-parameterset)}} lists the Part Properties of {{block(ParameterSet)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Parameter)}} (organized by `Parameters`)|1..*|
{: caption="Part Properties of ParameterSet" label="table:part-properties-of-parameterset"}

Descriptions for Part Properties of {{block(ParameterSet)}}:

* {{block(Parameter)}} 

    property that determines the characteristic or behavior of an entity.

    {{block(Parameters)}} groups one or more {{block(Parameter)}} entities. See {{sect(Parameter)}}.

### Parameter

property that determines the characteristic or behavior of an entity.



The value of {{property(Parameter)}} **MUST** be `string`.

#### Value Properties of Parameter

{{tbl(value-properties-of-parameter)}} lists the Value Properties of {{block(Parameter)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(identifier)}}|`string`|1|
|{{property(name)}}|`string`|1|
|{{property(minimum)}}|`double`|0..1|
|{{property(maximum)}}|`double`|0..1|
|{{property(nominal)}}|`double`|0..1|
|{{property(units)}}|`string`|0..1|
{: caption="Value Properties of Parameter" label="table:value-properties-of-parameter"}

Descriptions for Value Properties of {{block(Parameter)}}:

* {{property(identifier)}} 

    internal identifier, register, or address.

* {{property(name)}} 

    descriptive name.

* {{property(minimum)}} 

    minimal allowed value.

* {{property(maximum)}} 

    maximum allowed value.

* {{property(nominal)}} 

    nominal value.

* {{property(units)}} 

    engineering units.
    
    {{property(Parameter::units)}} **SHOULD** be SI or MTConnect Units.
