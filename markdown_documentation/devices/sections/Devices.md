
## Devices

This section provides semantic information for the {{block(Device)}} entity and its types.

### Device


{{block(Component)}} composed of a piece of equipment that produces {{termplural(observation)}} about itself.

A {{block(Device)}} {{termplural(organize)}} its parts as {{block(Component)}} entities.

A {{block(Device)}} **MUST** have a {{property(name)}} and {{property(uuid)}} attribute to identify itself. 

A {{block(Device)}} **MUST** have the following {{block(DataItems)}}: {{block(Availability)}}, {{block(AssetChanged)}}, and {{block(AssetRemoved)}}.

See {{sect(Component)}} for details on the {{block(Device)}} model. 

#### Value Properties of Device

{{tbl(value-properties-of-device)}} lists the Value Properties of {{block(Device)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| `<<deprecated>>`{{property(iso841Class)}} | `string` | 0..1 |
| {{property(uuid)}} | `ID` | 1 |
| {{property(mtconnectVersion)}} | `string` | 0..1 |
| {{property(name)}} | `string` | 1 |
{: caption="Value Properties of Device"}

Descriptions for Value Properties of {{block(Device)}}:

* `<<deprecated>>`{{property(iso841Class)}} 

    **DEPRECATED** in *MTConnect Version 1.1*.

* {{property(mtconnectVersion)}} 

    MTConnect version of the {{term(Device Information Model)}} used to configure the information to be published for a piece of equipment in an {{term(MTConnect Response Document)}}.

### Agent


{{block(Device)}} composed of an {{term(MTConnect Agent)}} and all its connected data sources.

An {{block(Agent)}} **MUST** be provided by all {{term(MTConnect Agent)}} implementations.

An {{block(Agent)}} **MUST** provide notifications when devices are added or changed.

An {{block(Agent)}} **MUST** provide connection information for each data source currently supplying data to the {{term(MTConnect Agent)}}.

An {{block(Agent)}} **MAY** provide information about telemetry relating to data sources.

An {{block(Agent)}} **MAY** provide information about the {{term(MTConnect Agent)}} resource utilization.

