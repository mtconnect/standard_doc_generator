
## Streams

This section provides semantic information for the {{block(Streams)}} model.

If there is no data to be reported for a request for data, an {{block(MTConnectStreams)}} entity **MUST** be returned with an empty {{block(Streams)}} entity.

> Note: See {{sect(Observations Schema Diagrams)}} for XML schema of {{block(Streams)}} model.

### DeviceStream


{{termplural(organize)}} data reported from a {{block(Device)}}.

{{block(DeviceStream)}} **MUST** be provided for each {{block(Device)}} reporting data in an {{block(MTConnectStreams)}} {{term(response document)}}.

If the response to the request for data from an {{term(agent)}} does not contain any data for a specific {{block(Device)}}, an empty {{block(DeviceStream)}} entity **MAY** be created to indicate that the {{block(Device)}} exists, but there was no data available.

#### Value Properties of DeviceStream

{{tbl(value-properties-of-devicestream)}} lists the Value Properties of {{block(DeviceStream)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(name)}} | `ID` | 1 |
| {{property(uuid)}} | `ID` | 1 |
{: caption="Value Properties of DeviceStream"}

Descriptions for Value Properties of {{block(DeviceStream)}}:

* {{property(name)}} 

    name of the {{block(Device)}}.
    
    The value reported for {{property(name,DeviceStream)}} **MUST** be the same as the value defined for the {{property(name,Device)}} attribute of the same {{block(Device)}} in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(uuid)}} 

    uuid of the {{block(Device)}}.
    
    The value reported for {{property(uuid,DeviceStream)}} **MUST** be the same as the value defined for the {{property(uuid,Device)}} attribute of the same {{block(Device)}} in the {{block(MTConnectDevices)}} {{term(response document)}}.

#### Reference Properties of DeviceStream

{{tbl(reference-properties-of-devicestream)}} lists the Reference Properties of {{block(DeviceStream)}}.

| Reference Property name | Multiplicity |
|:-------------------------------------|:-------------:|
| {{block(ComponentStream)}} | 1..* |
{: caption="Reference Properties of DeviceStream"}

Descriptions for Reference Properties of {{block(DeviceStream)}}:

* {{block(ComponentStream)}} 

    organizes the data associated with each {{block(Component)}} entity defined for a {{block(Device)}} in the associated {{term(MTConnectDevices Response Document)}}.
    See {{sect(ComponentStream)}}.

### ComponentStream


organizes the data associated with each {{block(Component)}} entity defined for a {{block(Device)}} in the associated {{term(MTConnectDevices Response Document)}}.

At least one of {{block(Sample)}}, {{block(Event)}}, or {{block(Condition)}} **MUST** be organized by a {{block(ComponentStream)}} entity.

#### Value Properties of ComponentStream

{{tbl(value-properties-of-componentstream)}} lists the Value Properties of {{block(ComponentStream)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(component)}} | `string` | 1 |
| {{property(componentId)}} | `ID` | 1 |
| {{property(name)}} | `string` | 0..1 |
| {{property(nativeName)}} | `string` | 0..1 |
| {{property(uuid)}} | `ID` | 0..1 |
{: caption="Value Properties of ComponentStream"}

Descriptions for Value Properties of {{block(ComponentStream)}}:

* {{property(component)}} 

    identifies the {{block(Component)}} type associated with the {{block(ComponentStream)}}.
    
    Examples of {{property(component)}} are {{block(Device)}}, {{block(Controller)}}, {{block(Linear)}} and {{block(Loader)}}.

* {{property(componentId)}} 

    identifier of the {{block(Component)}} as defined by the {{property(id)}}
    attribute in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(name)}} 

    name of the {{block(Component)}} associated with the {{block(ComponentStream)}}.

* {{property(nativeName)}} 

    common name of the {{block(Component)}} associated with the {{block(ComponentStream)}}.

* {{property(uuid)}} 

    uuid of the {{block(Component)}} associated with the {{block(ComponentStream)}}.

#### Reference Properties of ComponentStream

{{tbl(reference-properties-of-componentstream)}} lists the Reference Properties of {{block(ComponentStream)}}.

| Reference Property name | Multiplicity |
|:-------------------------------------|:-------------:|
| {{block(Event)}} (organized by {{block(Events)}}) | 0..* |
| {{block(Sample)}} (organized by {{block(Samples)}}) | 0..* |
| {{block(Condition)}} (organized by {{block(Conditions)}}) | 0..* |
{: caption="Reference Properties of ComponentStream"}

Descriptions for Reference Properties of {{block(ComponentStream)}}:

* {{block(Event)}} 

    {{block(Observation)}} that is a discrete piece of information from a piece of equipment.
    
    {{block(Events)}} groups one or more {{block(Event)}} entities. See {{sect(Event)}}.

* {{block(Sample)}} 

    {{block(Observation)}} that is continuously changing or analog data value.
    
    {{block(Samples)}} groups one or more {{block(Sample)}} entities. See {{sect(Sample)}}.

* {{block(Condition)}} 

    {{block(Observation)}} that provides information about an entity's status regarding its ability to operate or it provides an indication whether the data reported for the entity is within an expected range.
    
    
    {{block(Conditions)}} groups one or more {{block(Condition)}} entities. See {{sect(Condition)}}.
    
    > Note: In the {{term(XML)}} representation, {{block(Conditions)}} **MUST** appear as `Condition` element in the {{term(MTConnectStreams Response Document)}}.
