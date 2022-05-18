
## REST Protocol

An {{term(agent)}} **MUST** provide a REST API {{term(API)}} supporting HTTP version 1.0 or greater.  This interface **MUST** support HTTP (RFC7230) and use URIs (RFC3986) to identify specific information requested from an {{term(agent)}}. 

The REST API adheres to the architectural principles of a stateless service to retrieve information associated with pieces of equipment. Additionally, the API is read-only and does not produce any side effects on the {{term(agent)}} or the equipment. In REST state management, the client is responsible for recovery in case of an error or loss of connection.

### HTTP Request

An {{term(agent)}} **MUST** support the `HTTP` `GET` verb, all other verbs are optional. See IETF RFC 7230 for a complete description of the HTTP request structure.

The HTTP uses Uniform Resource Identifiers (URI) as outlined in IETF RFC 3986 as the *request-target*. IETF RFC 7230 specifies the http URI scheme for the *request-target* as follows:

1. `protocol`: The protocol used for the request. Must be `http` or `https`.

2. `authority`: The network domain or address of the agent with an optional port.

3. `path`: A Hierarchical Identifier following a slash (`/`) and before the optional question-mark (`?`). The `path` separates segments by a slash (`/`).

4. `query`: The portion of the HTTP request following the question-mark (`?`). The query portion of the HTTP request is composed of key-value pairs, `=` separated by an ampersand (`&`).

#### `path` Portion of an HTTP Request

The `path` portion of the *request-target* has the following segments:

* `device-name` or `uuid`: optional `name` or `uuid` of the {{block(Device)}}
* `request`: request, must be one of the following: (also see {{sect(Operations for Agent)}})
  - {{operation(REST Protocol::Agent::probe)}}
  - {{operation(REST Protocol::Agent::current)}}
  - {{operation(REST Protocol::Agent::sample)}}
  - {{operation(REST Protocol::Agent::asset)}}  or `assets`
    - {{operation(REST Protocol::Agent::asset)}} request has additional optional segment `<asset ids>`
  
If `name` or `uuid` segement are not specified in the {{term(HTTP Request)}}, an {{term(agent)}} **MUST** return information for all pieces of equipment. The following sections will 

Examples: 
  
* `http://localhost:5000/my_device/probe`
  
    The request only provides information about `my_device`.
  
* `http://localhost:5000/probe`

  The request provides information for all devices. 

The following section specifies the details for each request.

### MTConnect REST API

An {{term(agent)}} **MUST** support {{termplural(probe request)}}, {{termplural(current request)}}, {{termplural(sample request)}}, and {{termplural(asset request)}}.

See the operations of the {{block(REST Protocol::Agent)}} for details regarding the {{termplural(request)}}.

### HTTP Errors

When an {{term(agent)}} receives an {{term(HTTP Request)}} that is incorrectly formatted or is not supported by the {{term(agent)}}, the {{term(agent)}} **MUST** publish an {{term(HTTP Error Message)}} which includes a specific status code from the tables above indicating that the {{term(request)}} could not be handled by the {{term(agent)}}.

Also, if the {{term(agent)}} experiences an internal error and is unable to provide the requested {{term(response document)}}, it **MUST** publish an {{term(HTTP Error Message)}} that includes a specific status code from the table above.

When an {{term(agent)}} encounters an error in interpreting or responding to an {{term(HTTP Request)}}, the {{term(agent)}} **MUST** also publish an {{term(MTConnectErrors Response Document)}} that provides additional details about the error.  See {{sect(Error Information Model)}} for details on the {{term(MTConnectErrors Response Document)}}.  

#### Streaming Data

HTTP {{term(data streaming)}} is a method for an {{term(agent)}} to provide a continuous stream of {{termplural(observation)}} in response to a single {{term(request)}} using a {{term(publish and subscribe)}} communication pattern.

When an {{term(HTTP Request)}} includes an `interval` parameter, an {{term(agent)}} **MUST** provide data with a minimum delay in milliseconds between the end of one data transmission and the beginning of the next.  A value of zero (0) for the `interval` parameter indicates that the {{term(agent)}} should deliver data at the highest rate possible and is only relevant for {{termplural(sample request)}} .

The format of the response **MUST** use an `x-multipart-replace` encoded message with each section separated by MIME boundaries.  Each section **MUST** contain an entire {{term(MTConnectStreams Response Document)}}. 

When streaming for a {{term(current request)}}, the {{term(agent)}} produces an {{term(MTConnectStreams Response Document)}} with the most current {{termplural(observation)}} every `interval` milliseconds.

When streaming for a {{term(sample request)}}, if there are no available {{termplural(observation)}} after the `interval` time elapsed, the {{term(agent)}} **MUST** wait for either the `heartbeat` time to elapse or an {{term(observation)}} arrives. If the `heartbeat` time elapses and no {{termplural(observation)}} arrive, then an empty {{term(MTConnectStreams Response Document)}} **MUST** be sent.

> Note: For more information on MIME, see IETF RFC 1521 and RFC 822.

An example of the format for an {{term(HTTP Request)}} that  includes an `interval` parameter is:

~~~~
http://localhost:5000/sample?interval=1000
~~~~
{: caption="Example for HTTP Request with interval parameter" label="example-for-http-request-with-interval-parameter"}

HTTP Response Header:

~~~~
HTTP/1.1 200 OK
Connection: close
Date: Sat, 13 Mar 2010 08:33:37 UTC
Status: 200 OK
Content-Disposition: inline
X-Runtime: 144ms
Content-Type: multipart/x-mixed-replace;boundary=
a8e12eced4fb871ac096a99bf9728425
Transfer-Encoding: chunked
~~~~
{: caption="HTTP Response header" label="http-response-header"}

Lines 1-9 in {{lst(http-response-header)}} represent a standard header for a MIME `multipart/x-mixed-replace` message.  The boundary is a separator for each section of the stream. Lines 7-8 indicate this is a multipart MIME message and the boundary between sections. 

With streaming protocols, the `Content-length` **MUST** be omitted and `Transfer-Encoding` **MUST** be set to `chunked` (line 9). See IETF RFC 7230 for a full description of the HTTP protocol and chunked encoding.

~~~~
--a8e12eced4fb871ac096a99bf9728425
Content-type: text/xml
Content-length: 887

<?xml version="1.0" ecoding="UTF-8"?>
<MTConnectStreams ...>...
~~~~
{: caption="HTTP Response header 2" label="http-response-header-2" start="last"}

Each section of the document begins with a boundary preceded by two hyphens (`--`). The `Content-type` and `Content-length` header fields **MUST** be provided for each section and **MUST** be followed by `<CR><LF><CR><LF>` (ASCII code for `<CR>` is 13 and `<LF>` 10) before the {{term(XML)}} document. The header and the `<CR><LF><CR><LF>` **MUST NOT** be included in the computation of the content length.

An {{term(agent)}} MUST continue to stream results until the client closes the connection. The {{term(agent)}} MUST NOT stop streaming for any reason other than the following:

* {{term(agent)}} process stops
* The client application stops receiving data

##### Heartbeat

When {{term(streaming data)}} is requested from a {{term(sample request)}}, an {{term(agent)}} **MUST** support a {{term(heartbeat)}} to indicate to a client application that the HTTP connection is still viable during times when there is no new data available to be published.  The {{term(heartbeat)}} is indicated by an {{term(agent)}} by sending an MTConnect {{term(response document)}} with an empty {{block(Steams)}} entity (See {{package(Observation Information Model)}} for more details on {{block(Streams)}}) to the client software application.

The {{term(heartbeat)}} **MUST** occur on a periodic basis given by the optional `heartbeat` query parameter and **MUST** default to 10 seconds.  An {{term(agent)}} **MUST** maintain a separate {{term(heartbeat)}} for each client application for which the {{term(agent)}} is responding to a {{term(data streaming)}} {{term(request)}}.

An {{term(agent)}} **MUST** begin calculating the interval for the time-period of the {{term(heartbeat)}} for each client application immediately after a {{term(response document)}} is published to that specific client application.

The {{term(heartbeat)}} remains in effect for each client software application until the {{term(data streaming)}} {{term(request)}} is terminated by either the {{term(agent)}} or the client application.

#### References

A {{block(Component)}} **MAY** include a set of {{block(Reference)}} entities of the following types that **MAY** alter the content of the {{termplural(MTConnectStreams Response Document)}} published in response to a {{term(current request)}} or a {{term(sample request)}} as specified:

* A {{term(Component)}} reference ({{block(ComponentRef)}}) modifies the set of {{termplural(Observation)}}, limited by a path query parameter of a {{term(current request)}} or {{term(sample request)}}, to include the {{termplural(Observation)}} associated with the entity whose value for its `id` attribute matches the value provided for the `idRef` attribute of the {{block(ComponentRef)}} element. Additionally, {{termplural(Observation)}} defined for any {{term(lower level)}} entity(s) associated with the identified entities **MUST** also be returned. The result is equivalent to appending `//[@id=<"idRef">]` to the path query parameters of the {{term(current request)}} or {{term(sample request)}}. See {{package(Agent)}} for more details on path queries.

* A {{term(DataItem)}} reference ({{block(DataItemRef)}}) modifies the set of resulting {{termplural(Observation)}}, limited by a path query parameter of a {{term(current request)}} or {{term(sample request)}}, to include the {{termplural(Observation)}} whose value for its `id` attribute matches the value provided for the `idRef` attribute of the {{block(DataItemRef)}} element. The result is equivalent to appending `//[@id=<"idRef">]` to the path query parameters of the {{term(current request)}} or {{term(sample request)}}. See {{package(Agent)}} for more details on path queries.


### Agent

{{term(agent)}}.

An {{term(agent)}} **MUST** perform the following tasks:

* Collect data from manufacturing equipment.
* Generate {{termplural(response document)}}.
* Provide a REST interface using {{term(HTTP)}}.

In addition to {{term(XML)}} and {{term(HTTP)}}, An {{term(agent)}} **MAY** provide additional protocols and representations. Some representations **MAY** have companion specifications.



#### Value Properties of Agent

{{tbl(value-properties-of-agent)}} lists the Value Properties of {{block(Agent)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(instanceId)}}|`uInt32`|1|
|{{property(sequenceNumber)}}|`uInt64`|1|
|{{property(bufferSize)}}|`uInt32`|1|
|{{property(maxAssets)}}|`uInt32`|1|
|{{property(assetCount)}}|`uInt32`|1|
{: caption="Value Properties of Agent" label="table:value-properties-of-agent"}

Descriptions for Value Properties of {{block(Agent)}}:

* {{property(instanceId)}} 

    identifier for an {{term(instance)}} of the {{term(agent)}}.
         
    {{property(instanceId)}} **MUST** be changed to a different unique number each time the {{term(buffer)}} is cleared and a new set of data begins to be collected.

* {{property(sequenceNumber)}} 

    {{term(sequence number)}}.

* {{property(bufferSize)}} 

    maximum number of {{termplural(Observation)}} that **MAY** be retained in the {{term(agent)}} that published the {{term(response document)}} at any point in time.

* {{property(maxAssets)}} 

    maximum number of {{termplural(Asset)}} that **MAY** be retained in the {{term(agent)}} that published the {{term(response document)}} at any point in time.

* {{property(assetCount)}} 

    current number of {{termplural(Asset)}} that are currently stored in the {{term(agent)}} as of the {{property(creationTime)}} that the {{term(agent)}} published the {{term(response document)}}.

#### Part Properties of Agent

{{tbl(part-properties-of-agent)}} lists the Part Properties of {{block(Agent)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Observation)}} (organized by `buffer`)|0..*|
|{{block(Asset)}} (organized by `assetBuffer`)|0..*|
{: caption="Part Properties of Agent" label="table:part-properties-of-agent"}

Descriptions for Part Properties of {{block(Agent)}}:

* {{block(Observation)}} 

    abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.

    {{property(buffer)}} is a {{term(buffer)}} for {{block(Observation)}} types.

* {{block(Asset)}} 

    abstract {{term(Asset)}}. 

    {{property(assetBuffer)}} is an {{term(asset buffer)}} for {{block(Asset)}} types.

#### Operations for Agent

* `probe`

    {{term(agent)}} **MUST** respond to a successful {{term(probe request)}} with an {{block(MTConnectDevices)}} entity containing either one, when a {{block(Device)}} `name` or `uuid` is given, or all known {{block(Device)}} entries.
    
    When successful, an {{block(MTConnectDevices)}} entity is returned and status code of 200. Otherwise an {{block(MTConnectError)}} and an associated status code.

    The parameters for {{property(Agent)}} are:

    * `device`

        if present, speciﬁes that only the {{block(Device)}} for the given name or uuid will be returned.
         
        If not present,  all associated {{block(Device)}} for the Agent will be returned.

    * `status`

        {{term(HTTP Status Code)}}.
        
        The following {{termplural(HTTP Status Code)}} **MUST** be supported as possible responses to a {{term(probe request)}}:
        
        * Status Code: `200`, Code Name: `OK`:
        
          The {{term(request)}} succeeded.
          
        * Status Code: `400`, Code Name: `Bad Request`:
        
          The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `404`, Code Name: `Not Found`:
        
          The device name or uuid could not be located. The {{term(response)}} **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `405`, Code Name: `Method Not Allowed`:
        
          The {{term(request)}} specified a method other than `GET`
          
        * Status Code: `406`, Code Name: `Not Acceptable`:
        
          The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
            
        * Status Code: `431`, Code Name: `Request Header Fields Too Large`:
        
          The fields in the {{term(HTTP Request)}} exceed the limit of the implementation of the {{term(agent)}}.
          
        * Status Code: `500`, Code Name: `Internal Server Error`:
        
          There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.

    * `return`

        {{term(agent)}} **MUST** respond to a successful {{term(probe request)}} with an {{term(HTTP Status Code)}} `200` (`OK`) and an {{term(MTConnectDevices Response Document)}}. If the {{term(request)}} fails, the {{term(agent)}} **MUST** respond with an {{term(MTConnectErrors Response Document)}} an {{term(HTTP Status Code)}} other than 200.
        
        {{block(MTConnectDevices)}} if successful, {{block(MTConnectError)}} otherwise.
          

* `current`

    {{term(agent)}} **MUST** respond to a successful {{term(current request)}} with an {{block(MTConnectStreams)}} block containing the latest values for the selected {{termplural(observation)}}. If the `at` parameter is given, the values for the {{termplural(observation)}} are a snapshot taken when the `lastSequence` number was equal to the value of the `at` parameter.
    
    When successful, an {{block(MTConnectStreams)}} entity is returned and status code of 200. Otherwise an {{block(MTConnectError)}} and an associated status code.

    The parameters for {{property(Agent)}} are:

    * `device`

        optional {{block(Device)}} `name` or `uuid`. If not given, all devices are returned.

    * `path`

        XPath evaluated against the {{term(Device Information Model)}} that references the {{termplural(Component)}} and {{termplural(DataItem)}} to include in the {{term(MTConnectStreams Response Document)}}.
          
        When a {{block(Component)}} element is referenced by the XPath, all {{termplural(observation)}} for its {{termplural(DataItem)}} and related {{termplural(Component)}} **MUST** be included in the {{term(MTConnectStreams Response Document)}}.
        

    * `frequency`

        {{term(agent)}} **MUST** stream samples and events to the client application pausing for frequency milliseconds between each part. Each part will contain a maximum of {{property(count)}} events or samples and from will be used to indicate the beginning of the stream.
        
        **DEPRECATED** Version 1.2, replace by {{property(interval)}}

    * `at`

        {{termplural(response document)}} **MUST** include {{termplural(observation)}} consistent with a specific {{term(sequence number)}} given by the value of the `at` parameter.
        
        If the value is either less than the `firstSequence` or greater than the `lastSequence`, the {{term(request)}} **MUST** return a 404 {{term(HTTP Status Code)}} and the {{term(agent)}} **MUST** return an {{term(MTConnectErrors Response Document)}} with an `OUT_OF_RANGE` {{property(errorCode)}}. 
          
        The `at` parameter **MUST NOT** be used in conjunction with the `interval` parameter.
        

    * `interval`

        {{term(agent)}} **MUST** continuously publish {{termplural(response document)}} pausing for the number of milliseconds given as the value.
        
        The `interval` value **MUST** be in milliseconds, and **MUST** be a positive integer greater than zero (0). 
        
        The `interval` parameter **MUST NOT** be used in conjunction with the `at` parameter.
        

    * `status`

        {{term(HTTP Status Code)}}.
        
        The following {{termplural(HTTP Status Code)}} **MUST** be supported as possible responses to a {{term(current request)}}:
        
        * Status Code: `200`, Code Name: `OK`:
        
          The {{term(request)}} succeeded.
          
        * Status Code: `400`, Code Name: `Bad Request`:
        
          The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `404`, Code Name: `Not Found`:
        
          One of the following conditions apply:
          
          * The device name or uuid could not be located. 
          * The `at` was `OUT_OF_RANGE` range.
          
          The {{term(response)}} **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `405`, Code Name: `Method Not Allowed`:
        
          The {{term(request)}} specified a method other than `GET`
          
        * Status Code: `406`, Code Name: `Not Acceptable`:
        
          The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
            
        * Status Code: `431`, Code Name: `Request Header Fields Too Large`:
        
          The fields in the {{term(HTTP Request)}} exceed the limit of the implementation of the {{term(agent)}}.
          
        * Status Code: `500`, Code Name: `Internal Server Error`:
        
          There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.

    * `return`

        {{term(agent)}} responds to a {{term(current request)}} with an {{term(MTConnectStreams Response Document)}} that contains the current value of {{termplural(Observation)}} associated with each piece of {{term(streaming data)}} available from the {{term(agent)}}, subject to any filtering defined in the {{term(request)}}.
        

* `sample`

    {{term(agent)}} **MUST** respond to a successful  {{term(sample request)}} with an {{block(MTConnectStreams)}} entity containing the values for the selected {{termplural(observation)}} according to the parameters provided.
    
    When successful, an {{block(MTConnectStreams)}} entity is returned and status code of 200. Otherwise an {{block(MTConnectError)}} and an associated status code.

    The parameters for {{property(Agent)}} are:

    * `device`

        optional {{block(Device)}} `name` or `uuid`. If not given, all devices are returned.

    * `path`

        XPath evaluated against the {{term(Device Information Model)}} that references the {{termplural(Component)}} and {{termplural(DataItem)}} to include in the {{term(MTConnectStreams Response Document)}}.
          
        When a {{block(Component)}} element is referenced by the XPath, all {{termplural(observation)}} for its {{termplural(DataItem)}} and related {{termplural(Component)}} **MUST** be included in the {{term(MTConnectStreams Response Document)}}.
        

    * `from`

        designates the {{term(sequence number)}} of the first {{term(observation)}} in the {{term(buffer)}} the {{term(agent)}} **MUST** consider publishing in the {{term(response document)}}. 
        
        If `from` is zero (0), it **MUST** be set to the `firstSequence`, the oldest {{term(observation)}} in the {{term(buffer)}}. 
        
        If `from` and `count` parameters are not given, `from` **MUST** default to the `firstSequence`. 
        
        If the `from` parameter is less than the `firstSequence` or greater than `lastSequence`, the {{term(agent)}} **MUST** return a `404` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `OUT_OF_RANGE` {{property(errorCode)}}. 
        

    * `count`

        designates the maximum number of {{termplural(observation)}} the {{term(agent)}} **MUST** publish in the {{term(response document)}}. 
        
        The `count` **MUST NOT** be zero (0). 
        
        When the `count` is greater than zero (0), the `from` parameter **MUST** default to the `firstSequence`. The evaluation of {{termplural(observation)}} starts at `from` and moves forward accumulating newer {{termplural(observation)}} until the number of {{termplural(observation)}} equals the `count` or the  {{term(observation)}} at `lastSequence` is considered. 
        
        When the `count` is less than zero (0), the `from` parameter **MUST**  default to the `lastSequence`. The evaluation of {{termplural(observation)}} starts at `from` and moves backward accumulating older {{termplural(observation)}} until the number of {{termplural(observation)}} equals the absolute value of `count` or the {{term(observation)}} at `firstSequence` is considered. 
        
        `count` **MUST NOT** be less than zero (0) when an `interval` parameter is given. 
        
        If `count` is not provided, it **MUST** default to `100`. 
        
        If the absolute value of `count` is greater than the size of the {{term(buffer)}} or equal to zero (0), the {{term(agent)}} **MUST** return a `404` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `OUT_OF_RANGE`  {{property(errorCode)}}. 
        
        If the `count` parameter is not a numeric value, the {{term(agent)}} **MUST** return a `400` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `INVALID_REQUEST`  {{property(errorCode)}}.
        

    * `frequency`

        {{term(agent)}} **MUST** stream samples and events to the client application pausing for frequency milliseconds between each part. Each part will contain a maximum of {{property(count)}} events or samples and from will be used to indicate the beginning of the stream.
        
        **DEPRECATED** Version 1.2, replace by {{property(interval)}}

    * `heartbeat`

        sets the time period for the {{term(heartbeat)}} function in an {{term(agent)}}. 
        
        The value for `heartbeat` represents the amount of time after a {{term(response document)}} has been published until a new {{term(response document)}} **MUST** be published, even when no new data is available. 
        
        The value for `heartbeat` is defined in milliseconds.
        
        If no value is defined for `heartbeat`, the value **MUST** default to 10 seconds. 
        
        `heartbeat` **MUST** only be specified if `interval` is also specified.
        

    * `interval`

        {{term(agent)}} **MUST** continuously publish {{termplural(response document)}} when the query parameters include `interval` using the value as the minimum period between adjacent publications. 
        
        The `interval` value **MUST** be in milliseconds, and **MUST** be a positive integer greater than or equal to zero (0). 
        
        If the value for the `interval` parameter is zero (0), the {{term(agent)}} **MUST** publish  {{termplural(response document)}} when any {{termplural(observation)}} become available.
        
        If the period between the publication of a {{term(response document)}} and reception of {{termplural(observation)}} exceeds the `interval`, the {{term(agent)}} **MUST** wait for a maximum of `heartbeat` milliseconds for {{termplural(observation)}}. Upon the arrival of {{termplural(observation)}}, the {{term(agent)}} **MUST** immediately publish a {{term(response document)}}. When the period equals or exceeds the `heartbeat`, the {{term(agent)}} **MUST** publish an empty {{term(response document)}}.

    * `to`

        specifies the {{term(sequence number)}} of the {{term(observation)}} in the {{term(buffer)}} that will be the upper bound of the {{termplural(observation)}} in the {{term(response document)}}.
        
        
        Rules for `to` are as follows:
        
        * The value of `to` **MUST** be an unsigned 64-bit integer.
        * The value of `to` **MUST** be greater than the `firstSequence`.
        * The value of `to` **MUST** be less than or equal to the `lastSequence`.
        * The value of `to` **MUST** be greater than `from`.
        * If `to` and `count` are given, the `count` parameter **MUST** be greater than zero.
        * If `to` and `count` are given, the maximum number of {{termplural(observation)}} published in the {{term(response document)}} **MUST NOT** be greater than the value of `count`.
        * If `to` is not given, see the `from` parameter for default behavior.
        * If the `to` parameter is less than the `firstSequence` or greater than `lastSequence`, the {{term(agent)}} **MUST** return a `404` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `OUT_OF_RANGE` `errorCode`.
        * If the `to` parameter is not a positive numeric value, the {{term(agent)}} **MUST** return a `400` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `INVALID_REQUEST` `errorCode`.
        * If the `to` parameter is less than the `from` parameter, the {{term(agent)}} **MUST** return a `400` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `INVALID_REQUEST` `errorCode`.
        * If the `to` parameter is given and the `count` parameter is less than zero, the {{term(agent)}} **MUST** return a `400` {{term(HTTP Status Code)}} and **MUST** publish an {{term(MTConnectErrors Response Document)}} with an `INVALID_REQUEST` `errorCode`.
        

    * `status`

        {{term(HTTP Status Code)}}.
        
        The following {{termplural(HTTP Status Code)}} **MUST** be supported as possible responses to a {{term(current request)}}:
        
        * Status Code: `200`, Code Name: `OK`:
        
          The {{term(request)}} succeeded.
          
        * Status Code: `400`, Code Name: `Bad Request`:
        
          The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `404`, Code Name: `Not Found`:
        
          One of the following conditions apply:
          
          * The device name or UUID could not be located. 
          * One of the `asset_ids` could not be found.
          
          The {{term(response)}} **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `405`, Code Name: `Method Not Allowed`:
        
          The {{term(request)}} specified a method other than `GET`
          
        * Status Code: `406`, Code Name: `Not Acceptable`:
        
          The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
            
        * Status Code: `431`, Code Name: `Request Header Fields Too Large`:
        
          The fields in the {{term(HTTP Request)}} exceed the limit of the implementation of the {{term(agent)}}.
          
        * Status Code: `500`, Code Name: `Internal Server Error`:
        
        There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.
        

    * `return`

        {{term(agent)}} **MUST** respond to a successful {{term(sample request)}} with an {{term(HTTP Status Code)}} `200` (`OK`) and an {{term(MTConnectStreams Response Document)}}. If the {{term(request)}} fails, the {{term(agent)}} **MUST** respond with an {{term(MTConnectErrors Response Document)}} an {{term(HTTP Status Code)}} other than 200.
        

* `asset`

    {{term(agent)}} **MUST** respond to a successful {{term(asset request)}} with an {{block(MTConnectAssets)}} entity with the selected {{term(asset)}} entities according to the parameters provided.
    
    When successful, an {{block(MTConnectAssets)}} entity is returned and status code of 200. Otherwise an {{block(MTConnectError)}} and an associated status code.

    The parameters for {{property(Agent)}} are:

    * `device`

        optional {{block(Device)}} `name` or `uuid`. If not given, all devices are returned.

    * `assetIds`

        `path` portion is a list of (`asset_id`) for specific {{termplural(MTConnectAssets Response Document)}}.  
        
        In response, the {{term(agent)}} returns an {{term(MTConnectAssets Response Document)}} that contains information for the specific {{termplural(asset)}} for each of the `asset_id` values provided in the {{term(request)}}. Each `asset_id` is separated by a ";".
        

    * `count`

        specifies the maximum number of {{termplural(MTConnectAssets Response Document)}} returned in an {{term(MTConnectAssets Response Document)}}.
          
        If `count` is not given, the default value **MUST** be `100`.
        

    * `type`

        type of {{term(Asset)}}. See {{package(Asset Information Model)}}.

    * `removed`

        value for {{property(removed)}} **MUST** be `true` or `false` and interpreted as follows:
          
        * `true`: {{termplural(MTConnectAssets Response Document)}} for {{termplural(asset)}} marked as removed **MUST** be included in the {{term(response document)}}. 
        * `false`: {{termplural(MTConnectAssets Response Document)}} for {{termplural(asset)}} marked as removed **MUST NOT** be included in the {{term(response document)}}. 
          
        If {{property(removed)}} is not given, the default value **MUST** be `false`. 
        

    * `status`

        {{term(HTTP Status Code)}}.
        
        The following {{termplural(HTTP Status Code)}} **MUST** be supported as possible responses to a {{term(asset request)}}:
        
        * Status Code: `200`, Code Name: `OK`:
        
          The {{term(request)}} succeeded.
          
        * Status Code: `400`, Code Name: `Bad Request`:
        
          The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `404`, Code Name: `Not Found`:
        
          One of the following conditions apply:
          
          * The device name or uuid could not be located. 
          * The `from` or `to` was `OUT_OF_RANGE`.
          
          The {{term(response)}} **MUST** have an {{term(MTConnectErrors Response Document)}}.
          
        * Status Code: `405`, Code Name: `Method Not Allowed`:
        
          The {{term(request)}} specified a method other than `GET`
          
        * Status Code: `406`, Code Name: `Not Acceptable`:
        
          The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
            
        * Status Code: `431`, Code Name: `Request Header Fields Too Large`:
        
          The fields in the {{term(HTTP Request)}} exceed the limit of the implementation of the {{term(agent)}}.
          
        * Status Code: `500`, Code Name: `Internal Server Error`:
        
          There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.

    * `return`

        {{termplural(MTConnectAssets Response Document)}} provided in the {{term(MTConnectAssets Response Document)}} will be limited to those specified in the combination of the `path` segment of the {{term(asset request)}} and the parameters provided in the `query` segment of that {{term(request)}}.
