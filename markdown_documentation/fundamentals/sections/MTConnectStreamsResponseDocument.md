
## MTConnectStreams Response Document

This section provides semantic information for the {{block(MTConnectStreams)}} entity.

### MTConnectStreams

root entity of an {{term(MTConnectStreams Response Document)}} that contains the {{term(Observation Information Model)}} of one or more {{block(Device)}} entities.

![MTConnectStreams](figures/MTConnectStreams.png "MTConnectStreams"){: width="0.8"}

> Note: Additional properties of {{block(MTConnectStreams)}} **MAY** be defined for schema and namespace declaration. See {{sect(Schema and Namespace Declaration Information)}} for an {{term(XML)}} example.



#### Part Properties of MTConnectStreams

{{tbl(part-properties-of-mtconnectstreams)}} lists the Part Properties of {{block(MTConnectStreams)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Header)}}|1|
|{{block(DeviceStream)}} (organized by `Streams`)|0..*|
{: caption="Part Properties of MTConnectStreams" label="table:part-properties-of-mtconnectstreams"}

Descriptions for Part Properties of {{block(MTConnectStreams)}}:

* {{block(Header)}} 

    provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.

* {{block(DeviceStream)}} 

    {{termplural(organize)}} data reported from a {{block(Device)}}.

    {{block(Streams)}} groups one or more {{block(DeviceStream)}} entities. See {{package(Observation Information Model)}} for more detail.

### Header

provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.



#### Value Properties of Header

{{tbl(value-properties-of-header2)}} lists the Value Properties of {{block(Header)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(firstSequence)}}|`uInt64`|1|
|{{property(lastSequence)}}|`uInt64`|1|
|{{property(nextSequence)}}|`uInt64`|1|
|{{property(version)}}|`version`|1|
|{{property(testIndicator)}}|`boolean`|0..1|
|{{property(sender)}}|`string`|1|
|{{property(instanceId)}}|`uInt64`|1|
|{{property(creationTime)}}|`dateTime`|1|
|{{property(bufferSize)}}|`uInt32`|1|
|{{property(deviceModelChangeTime)}}|`dateTime`|1|
{: caption="Value Properties of Header" label="table:value-properties-of-header2"}

Descriptions for Value Properties of {{block(Header)}}:

* {{property(firstSequence)}} 

    {{term(sequence number)}} assigned to the oldest piece of {{term(streaming data)}} stored in the {{term(buffer)}} of the {{term(agent)}} immediately prior to the time that the {{term(agent)}} published the {{term(response document)}}.   

* {{property(lastSequence)}} 

    {{term(sequence number)}} assigned to the last piece of {{term(streaming data)}} that was added to the {{term(buffer)}} of the {{term(agent)}} immediately prior to the time that the {{term(agent)}} published the {{term(response document)}}.   
    
    

* {{property(nextSequence)}} 

    {{term(sequence number)}} of the piece of {{term(streaming data)}} that is the next piece of data to be retrieved from the {{term(buffer)}} of the {{term(agent)}} that was not included in the {{term(response document)}} published by the {{term(agent)}}.
    
    If the {{term(streaming data)}} included in the {{term(response document)}} includes the last piece of data stored in the {{term(buffer)}} of the {{term(agent)}} at the time that the document was published, then the value reported for {{property(nextSequence)}} **MUST** be equal to {{property(lastSequence)}} + 1.

* {{property(version)}} 

    {{term(major)}}, {{term(minor)}}, and {{term(revision)}} number of the MTConnect Standard that defines the {{term(semantic data model)}} that represents the content of the {{term(response document)}}. It also includes the revision number of the {{term(schema)}} associated with that specific {{term(semantic data model)}}.
    
    As an example, the value reported for {{property(version)}} for a {{term(response document)}} that was structured based on {{term(schema)}} revision 10 associated with Version 1.4.0 of the MTConnect Standard would be:  1.4.0.10

* {{property(testIndicator)}} 

    indicates whether the {{term(agent)}} that published the {{term(response document)}} is operating in a test mode.
    
    If {{property(testIndicator)}} is not specified, the value for {{property(testIndicator)}} **MUST** be interpreted to be `false`.

* {{property(sender)}} 

    identification defining where the {{term(agent)}} that published the {{term(response document)}} is installed or hosted.
    
    {{property(sender)}} **MUST** be either an IP Address or Hostname describing where the {{term(agent)}} is installed or the URL of the {{term(agent)}}; e.g., `http://<address>[:port]/`. 
    
    > Note:  The port number need not be specified if it is the default HTTP port 80.

* {{property(instanceId)}} 

    identifier for a specific instantiation of the {{term(buffer)}} associated with the {{term(agent)}} that published the {{term(response document)}}.  
         
    {{property(instanceId)}} **MUST** be changed to a different unique number each time the {{term(buffer)}} is cleared and a new set of data begins to be collected.

* {{property(creationTime)}} 

    timestamp that an {{term(agent)}} published the {{term(response document)}}. 

* {{property(bufferSize)}} 

    maximum number of {{termplural(DataItem)}} that **MAY** be retained in the {{term(agent)}} that published the {{term(response document)}} at any point in time.
    
    > Note 1 to entry:  {{property(bufferSize)}} represents the maximum number of sequence numbers that **MAY** be stored in the {{term(agent)}}. 
    
    > Note 2 to entry: The implementer is responsible for allocating the appropriate amount of storage capacity required to accommodate the {{property(bufferSize)}}.
    

* {{property(deviceModelChangeTime)}} 

    timestamp of the last update of the {{block(Device)}} information for any device.
