
## MTConnectAssets Response Document

This section provides semantic information for the {{block(MTConnectAssets)}} entity.

### MTConnectAssets

root entity of an {{term(MTConnectAssets Response Document)}} that contains the {{term(Asset Information Model)}} of {{block(Asset)}} types.

![MTConnectAssets](figures/MTConnectAssets.png "MTConnectAssets"){: width="0.8"}

> Note: Additional properties of {{block(MTConnectAssets)}} **MAY** be defined for schema and namespace declaration. See {{sect(Schema and Namespace Declaration Information)}} for an {{term(XML)}} example.



#### Part Properties of MTConnectAssets

{{tbl(part-properties-of-mtconnectassets)}} lists the Part Properties of {{block(MTConnectAssets)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Header)}}|1|
|{{block(Asset)}} (organized by `Assets`)|0..*|
{: caption="Part Properties of MTConnectAssets" label="table:part-properties-of-mtconnectassets"}

Descriptions for Part Properties of {{block(MTConnectAssets)}}:

* {{block(Header)}} 

    provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.

* {{block(Asset)}} 

    abstract {{term(Asset)}}. 

    {{block(Assets)}} groups one or more {{block(Asset)}} types. See {{package(Asset Information Model)}} for more details.

### Header

provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.



#### Value Properties of Header

{{tbl(value-properties-of-header3)}} lists the Value Properties of {{block(Header)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(deviceModelChangeTime)}}|`datetime`|1|
|{{property(assetBufferSize)}}|`uint32`|1|
|{{property(assetCount)}}|`uint32`|1|
|{{property(creationTime)}}|`datetime`|1|
|{{property(instanceId)}}|`uint64`|1|
|{{property(sender)}}|`string`|1|
|{{property(testIndicator)}}|`boolean`|0..1|
|{{property(version)}}|`version`|1|
{: caption="Value Properties of Header" label="table:value-properties-of-header3"}

Descriptions for Value Properties of {{block(Header)}}:

* {{property(deviceModelChangeTime)}} 

    timestamp of the last update of the {{block(Device)}} information for any device.

* {{property(assetBufferSize)}} 

    maximum number of {{block(Asset)}} types that can be stored in the {{term(agent)}} that published the {{term(response document)}}.  
    
    > Note: The implementer is responsible for allocating the appropriate amount of storage capacity required to accommodate the {{property(Header::assetBufferSize)}}.
    

* {{property(assetCount)}} 

    current number of {{block(Asset)}} that are currently stored in the {{term(agent)}} as of the {{property(Header::creationTime)}} that the {{term(agent)}} published the {{term(response document)}}.
    
    {{property(Header::assetCount)}} **MUST NOT** be larger than the value reported for {{property(Header::assetBufferSize)}}.
    

* {{property(creationTime)}} 

    timestamp that an {{term(agent)}} published the {{term(response document)}}. 

* {{property(instanceId)}} 

    identifier for a specific instantiation of the {{term(buffer)}} associated with the {{term(agent)}} that published the {{term(response document)}}.  
         
    {{property(Header::instanceId)}} **MUST** be changed to a different unique number each time the {{term(buffer)}} is cleared and a new set of data begins to be collected.

* {{property(sender)}} 

    identification defining where the {{term(agent)}} that published the {{term(response document)}} is installed or hosted.
    
    {{property(Header::sender)}} **MUST** be either an IP Address or Hostname describing where the {{term(agent)}} is installed or the URL of the {{term(agent)}}; e.g., `http://<address>[:port]/`. 
    
    > Note:  The port number need not be specified if it is the default HTTP port 80.

* {{property(testIndicator)}} 

    indicates whether the {{term(agent)}} that published the {{term(response document)}} is operating in a test mode.
    
    If {{property(Header::testIndicator)}} is not specified, the value for {{property(Header::testIndicator)}} **MUST** be interpreted to be `false`.

* {{property(version)}} 

    {{term(major)}}, {{term(minor)}}, and {{term(revision)}} number of the MTConnect Standard that defines the {{term(semantic data model)}} that represents the content of the {{term(response document)}}. It also includes the revision number of the {{term(schema)}} associated with that specific {{term(semantic data model)}}.
    
    As an example, the value reported for {{property(Header::version)}} for a {{term(response document)}} that was structured based on {{term(schema)}} revision 10 associated with Version 1.4.0 of the MTConnect Standard would be:  1.4.0.10
