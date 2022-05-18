
## Device

{{block(Component)}} composed of a piece of equipment that produces {{termplural(observation)}} about itself.


A {{block(Device)}} {{termplural(organize)}} its parts as {{block(Component)}} entities.

A {{block(Device)}} **MUST** have a {{property(name)}} and {{property(uuid)}} attribute to identify itself. 

A {{block(Device)}} **MUST** have the following {{block(DataItems)}}: {{block(Availability)}}, {{block(AssetChanged)}}, and {{block(AssetRemoved)}}.

See {{package(Components)}} for more details on the properties of {{block(Device)}}.

> See {{sect(Part Properties of Device)}} for a list of {{term(top level)}} {{block(Component)}} types for a {{block(Device)}}.



### Value Properties of Device

{{tbl(value-properties-of-device)}} lists the Value Properties of {{block(Device)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|`<<deprecated>>` {{property(iso841Class)}}|`string`|0..1|
|{{property(uuid)}}|`ID`|1|
|{{property(mtconnectVersion)}}|`string`|0..1|
|{{property(name)}}|`string`|1|
{: caption="Value Properties of Device" label="table:value-properties-of-device"}

Descriptions for Value Properties of {{block(Device)}}:

* `<<deprecated>>` {{property(iso841Class)}} 

    **DEPRECATED** in *MTConnect Version 1.2*.

* {{property(mtconnectVersion)}} 

    MTConnect version of the {{term(Device Information Model)}} used to configure the information to be published for a piece of equipment in an {{term(MTConnect Response Document)}}.

### Part Properties of Device

{{tbl(part-properties-of-device)}} lists the Part Properties of {{block(Device)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Auxiliary)}} (organized by `<<organizer>>` `Auxiliaries`)|0..*|
|{{block(Controller)}} (organized by `<<organizer>>` `Controllers`)|0..*|
|{{block(Interface)}} (organized by `<<organizer>>` `Interfaces`)|0..*|
|{{block(Resource)}} (organized by `<<organizer>>` `Resources`)|0..*|
|{{block(Structure)}} (organized by `<<organizer>>` `Structures`)|0..*|
|{{block(System)}} (organized by `<<organizer>>` `Systems`)|0..*|
|{{block(Axis)}} (organized by `<<organizer>>` `Axes`)|0..*|
|{{block(Adapter)}} (organized by `<<organizer>>` `Adapters`)|0..*|
{: caption="Part Properties of Device" label="table:part-properties-of-device"}

Descriptions for Part Properties of {{block(Device)}}:

* {{block(Auxiliary)}} 

    abstract {{block(Component)}} composed of removable part(s) of a piece of equipment that provides supplementary or extended functionality.

* {{block(Controller)}} 

    {{block(System)}} that provides regulation or management of a system or component. {{cite(ISO 16484-5:2017)}}

* {{block(Interface)}} 

    abstract {{block(Component)}} that coordinates actions and activities between pieces of equipment.
    

* {{block(Resource)}} 

    abstract {{block(Component)}} composed of material or personnel involved in a manufacturing process.

* {{block(Structure)}} 

    {{block(Component)}} composed of part(s) comprising the rigid bodies of the piece of equipment.

* {{block(System)}} 

    abstract {{block(Component)}} that is permanently integrated into the piece of equipment.

* {{block(Axis)}} 

    abstract {{block(Component)}} composed of a motion system that provides linear or rotational motion for a piece of equipment.

* {{block(Adapter)}} 

    {{block(Component)}} that provides information about the data source for an {{term(MTConnect Agent)}}.

### Commonly Observed DataItem Types for Device

{{tbl(commonly-observed-dataitem-types-for-device)}} lists the Commonly Observed DataItem Types for {{block(Device)}}.

|Commonly Observed DataItem Types|Multiplicity|
|:-|:-:|
|{{block(Availability)}}|1|
|{{block(AssetChanged)}}|1|
|{{block(AssetRemoved)}}|1|
{: caption="Commonly Observed DataItem Types for Device" label="table:commonly-observed-dataitem-types-for-device"}
