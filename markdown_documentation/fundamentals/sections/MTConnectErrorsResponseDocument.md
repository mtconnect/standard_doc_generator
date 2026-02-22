
## MTConnectErrors Response Document

This section provides semantic information for the {{block(MTConnectErrors)}} entity.

### MTConnectError

root entity of an {{term(MTConnectErrors Response Document)}} that contains the {{term(Error Information Model)}}.

![MTConnectError](figures/MTConnectErrors.png "MTConnectError"){: width="0.8"}

> Note: Additional properties of {{block(MTConnectError)}} **MAY** be defined for schema and namespace declaration. See {{sect(Schema and Namespace Declaration Information)}} for an {{term(XML)}} example.



#### Part Properties of MTConnectError

{{tbl(part-properties-of-mtconnecterror)}} lists the Part Properties of {{block(MTConnectError)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Header)}}|1|
|{{block(Error)}} (organized by `Errors`)|1..*|
|`<<deprecated>>` {{block(Error)}}|1|
{: caption="Part Properties of MTConnectError" label="table:part-properties-of-mtconnecterror"}

Descriptions for Part Properties of {{block(MTConnectError)}}:

* {{block(Header)}} 

    provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.

* {{block(Error)}} 

    error encountered by an {{term(agent)}} when responding to a {{term(request)}}.

    {{block(Errors)}} groups one or more {{block(Error)}} entities. See {{sect(Error)}}.
    
    > Note: When compatibility with Version 1.0.1 and earlier of the MTConnect Standard is required for an implementation, the {{term(MTConnectErrors Response Document)}} contains only a single {{block(Error)}} entity and the {{block(Errors)}} entity **MUST NOT** appear in the document.

* {{block(Error)}} 

    error encountered by an {{term(agent)}} when responding to a {{term(request)}}.

### Header

provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.



#### Value Properties of Header

{{tbl(value-properties-of-header4)}} lists the Value Properties of {{block(Header)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(bufferSize)}}|`uint32`|1|
|{{property(creationTime)}}|`datetime`|1|
|{{property(instanceId)}}|`uint64`|1|
|{{property(sender)}}|`string`|1|
|{{property(testIndicator)}}|`boolean`|0..1|
|{{property(version)}}|`version`|1|
|`<<deprecated>>` {{property(firstSequence)}}|`uint64`|0..1|
|`<<deprecated>>` {{property(lastSequence)}}|`uint64`|0..1|
|`<<deprecated>>` {{property(nextSequence)}}|`uint64`|0..1|
|{{property(deviceModelChangeTime)}}|`datetime`|1|
{: caption="Value Properties of Header" label="table:value-properties-of-header4"}

Descriptions for Value Properties of {{block(Header)}}:

* {{property(bufferSize)}} 

    maximum number of {{termplural(DataItem)}} that **MAY** be retained in the {{term(agent)}} that published the {{term(response document)}} at any point in time.
    
    > Note 1 to entry:  {{property(Header::bufferSize)}} represents the maximum number of sequence numbers that **MAY** be stored in the {{term(agent)}}. 
    
    > Note 2 to entry: The implementer is responsible for allocating the appropriate amount of storage capacity required to accommodate the {{property(Header::bufferSize)}}.
    

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

* `<<deprecated>>` {{property(firstSequence)}} 

    {{term(sequence number)}} assigned to the oldest piece of {{term(streaming data)}} stored in the {{term(buffer)}} of the {{term(agent)}} immediately prior to the time that the {{term(agent)}} published the {{term(response document)}}.   

* `<<deprecated>>` {{property(lastSequence)}} 

    {{term(sequence number)}} assigned to the last piece of {{term(streaming data)}} that was added to the {{term(buffer)}} of the {{term(agent)}} immediately prior to the time that the {{term(agent)}} published the {{term(response document)}}.   
    
    

* `<<deprecated>>` {{property(nextSequence)}} 

    {{term(sequence number)}} of the piece of {{term(streaming data)}} that is the next piece of data to be retrieved from the {{term(buffer)}} of the {{term(agent)}} that was not included in the {{term(response document)}} published by the {{term(agent)}}.
    
    If the {{term(streaming data)}} included in the {{term(response document)}} includes the last piece of data stored in the {{term(buffer)}} of the {{term(agent)}} at the time that the document was published, then the value reported for {{property(Header::nextSequence)}} **MUST** be equal to {{property(Header::lastSequence)}} + 1.

* {{property(deviceModelChangeTime)}} 

    timestamp of the last update of the {{block(Device)}} information for any device.

### Error

error encountered by an {{term(agent)}} when responding to a {{term(request)}}.



The value of {{property(Error)}} **MUST** be `string`.

#### Value Properties of Error

{{tbl(value-properties-of-error)}} lists the Value Properties of {{block(Error)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(errorCode)}}|`ErrorCodeEnum`|1|
{: caption="Value Properties of Error" label="table:value-properties-of-error"}

Descriptions for Value Properties of {{block(Error)}}:

* {{property(errorCode)}} 

    descriptive code that indicates the type of error that was encountered by an {{term(agent)}}.

    `ErrorCodeEnum` Enumeration:

    * `ASSET_NOT_FOUND` 

        {{term(request)}} for information specifies an {{block(Asset)}} that is not recognized by the {{term(agent)}}.

    * `INTERNAL_ERROR` 

        {{term(agent)}} experienced an error while attempting to published the requested information.

    * `INVALID_REQUEST` 

        {{term(request)}} contains information that was not recognized by the {{term(agent)}}.

    * `INVALID_URI` 

        {{term(URI)}} provided was incorrect.

    * `INVALID_XPATH` 

        {{term(XPath)}} identified in the {{term(request)}} for information could not be parsed correctly by the {{term(agent)}}.
        
        This could be caused by an invalid syntax or the {{term(XPath)}} did not match a valid identify for any information stored in the {{term(agent)}}. 

    * `NO_DEVICE` 

        identity of the {{block(Device)}} specified in the {{term(request)}} for information is not associated with the {{term(agent)}}.

    * `OUT_OF_RANGE` 

        {{term(request)}} for information specifies {{term(streaming data)}} that includes sequence number(s) for pieces of data that are beyond the end of the {{term(buffer)}}.

    * `QUERY_ERROR` 

        {{term(agent)}} was unable to interpret the query.
        
        The query parameters do not contain valid values or include an invalid parameter.

    * `TOO_MANY` 

        `count` parameter provided in the {{term(request)}} for information requires either of the following:
        
        * {{term(streaming data)}} that includes more pieces of data than the {{term(agent)}} is capable of organizing in an {{term(MTConnectStreams Response Document)}}. 
        
        * {{block(Assets)}} that include more {{block(Asset)}} in an {{term(MTConnectAssets Response Document)}} than the {{term(agent)}} is capable of handling. 

    * `UNAUTHORIZED` 

        {{term(requester)}} does not have sufficient permissions to access the requested information.

    * `UNSUPPORTED` 

        valid {{term(request)}} was provided, but the {{term(agent)}} does not support the feature or type of {{term(request)}}.
