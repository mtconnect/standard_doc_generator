
## PowerSources

This section provides semantic information for the {{block(PowerSource)}} entity.

![PowerSources](figures/PowerSources.png "PowerSources"){: width="0.8"}



### PowerSource

potential energy sources for the {{block(Component)}}.



The value of {{property(PowerSource)}} **MUST** be `string`.

#### Value Properties of PowerSource

{{tbl(value-properties-of-powersource)}} lists the Value Properties of {{block(PowerSource)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(type)}}|`PowerSourceTypeEnum`|1|
|{{property(id)}}|`ID`|1|
|{{property(componentIdRef)}}|`ID`|0..1|
|{{property(order)}}|`integer`|0..1|
{: caption="Value Properties of PowerSource" label="table:value-properties-of-powersource"}

Descriptions for Value Properties of {{block(PowerSource)}}:

* {{property(type)}} 

    type of the power source.

    `<<extensible>>` `PowerSourceTypeEnum` Enumeration:

    * `PRIMARY` 

        main or principle.

    * `SECONDARY` 

        alternate or not primary.

    * `STANDBY` 

        held near at hand and ready for use and is uninterruptible.

* {{property(id)}} 

    unique identifier for the power source.

* {{property(componentIdRef)}} 

    reference to the {{block(Component)}} providing observations about the power source.

* {{property(order)}} 

    optional precedence for a given power source.
