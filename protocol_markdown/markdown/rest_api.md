# MTConnect ReST Protocol

MTConnect requires one normative method for requesting data from an {{term(agent)}}. Other protocols and access methods are informative and supported by companion specifications.

## REST Interface

An {{term(agent)}} **MUST** provide a ReST API {{term(application programming interface)}} supporting HTTP version 1.0 or greater.  This interface **MUST** support HTTP (RFC7230) and use URIs (RFC3986) to identify specific information requested from an {{term(agent)}}.

The REST API adheres to the architectural principles of a stateless service to retrieve information associated with pieces of equipment. Additionally, the API is read-only and does not produce any side effects on the data stored in an {{term(agent)}} or change the function of the {{term(agent)}} itself.

## HTTP Request

The MTConnect standard defines that an {{term(agent)}} **MUST** support the `HTTP` `GET` verb -- no other HTTP verbs are required to be supported. See IETF RFC 7230 for a complete description of the HTTP request structure. The 

The HTTP uses Uniform Resource Identifiers (URI) as outlined in IETF RFC 3986 as the *request-target*. IETF RFC 7230 specifies the http URI scheme for the *request-target* as follows:

1. `protocol`: The protocol used for the request. Must be `http` or `https`.
2. `authority`: The network domain or address of the agent with an optional port.
2. `path`: A Hierarchical Identifier following a slash (`/`) and before the optional question-mark (`?`) where slashes (`/`) separate segments.
3. `query`: The portion of the HTTP request following the question-mark (`?`). The query portion of the HTTP request is composed of key-value pairs, `<key>=<value>` separated by an ampersand (`&`).

### `path` Portion of an HTTP Request

The `<Path>` portion of the *request-target* has the following segments:

* `<device name or uuid>`: optional {{term(name)}} or {{term(uuid)}} of the {{term(device)}}
* `<request>`: request, must be one of the following: 
  - `probe`
  - `current`
  - `sample`
  - `asset` or `assets`
    - additional optional segment `<asset ids>`
  
If {{term(name)}} or {{term(uuid)}} segement are not specified in the {{term(http request)}}, an {{term(agent)}} **MUST** return information for all pieces of equipment. The following sections will 

Examples: 
  
* `http://localhost:5000/my_device/probe`
  
    The request only provides information about `my_device`.
  
* `http://localhost:5000/probe`

  The request provides information for all devices. 

The following section specifies the details for each request.

## MTConnect ReST API

An {{term(agent)}} **MUST** support {{termplural(probe request)}}, {{termplural(current request)}}, {{termplural(sample request)}}, and {{termplural(asset request)}}.

The following sections define how the {{term(http request)}} is structured to support each of these types of {{termplural(request)}} and the information that an {{term(agent)}} **MUST** provide in response:

### Probe Request

#### Query Portion of the Probe Request

There are no {{term(query http request}} required for the {{term(probe request)}}. Any parameters **MUST** be ignored by the {{term(agent)}}.

#### Response to a Probe Request

The {{term(agent)}} **MUST** respond to a successful {{term(probe request)}} with a {{term(http status code)}} `200` (`OK`) and an {{term(mtconnectdevices response document)}}. If the {{term(request)}} fails, the {{term(agent)}} **MUST** respond with an an {{term(mtconnecterrors response document)}} a {{term(http status code)}} other than 200.

#### HTTP Status Codes for a Probe Request

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(probe request)}}:

* Status Code: `200`, Code Name: `OK`:

  The {{term(request)}} succeeded.
  
* Status Code: `400`, Code Name: `Bad Request`:

  The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `404`, Code Name: `Not Found`:

  The device name or uuid could not be located. The {{term(response)}} **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `405`, Code Name: `Method Not Allowed`:

  The {{term(request)}} specified a method other than `GET`
  
* Status Code: `406`, Code Name: `Not Acceptable`:

  The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
    
* Status Code: `431`, Code Name: `Request Header Fields Too Large`:

  The fields in the {{term(http request)}} exceed the limit of the implementation of the {{term(agent)}}.
  
* Status Code: `500`, Code Name: `Internal Server Error`:

  There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.
  
### Current Request

#### Query Portion of a Current Request

The following optional {{term(query http request)}} parameters **MUST** be supported for a {{term(current request)}}:

* {{term(at query)}}: unsigned 64-bit integer

  The {{termplural(mtconnect response document)}} **MUST** include {{termplural(observation)}} consistent with a specific {{term(sequence number)}} given by the value of the {{term(at query)}} parameter.

  If the value is either less than the {{term(firstsequence)}} or greater than the (lastsequence)}}, the {{term(request)}} **MUST** return a 404 {{term(http status code)}} and the {{term(agent)}} **MUST** return an {{term(mtconnecterrors response document)}} with an {{term(outofrange value)}} {{term(errorcode)}}. 
  
  The {{term(at query)}} parameter **MUST NOT** be used in conjunction with the {{term(interval query)}} parameter.

* {{term(interval query)}}: unsigned integer milliseconds

  The {{term(agent)}} **MUST** continuously publish {{termplural(response document)}} pausing for the number of milliseconds given as the value.

  The {{term(interval query)}} value **MUST** be in milliseconds, and **MUST** be a positive integer greater than zero (0). 

  The {{term(interval query)}} parameter **MUST NOT** be used in conjunction with the {{term(at query)}} parameter.

* {{term(path query)}}: string

  An XPath evaluated against the {{term(device information model)}} that references the {{termplural(component)}} and {{termplural(data item)}} to include in the {{term(mtconnectstreams response document)}}.
  
  When a {{term(component)}} element is referenced by the XPath, all {{termplural(observation)}} for its {{termplural(data item)}} and related {{termplural(component)}} **MUST** be included in the {{term(mtconnectstreams response document)}}.

#### Response to a Current Request

The {{term(agent)}} **MUST** respond to a successful {{term(current request)}} with a {{term(http status code)}} `200` (`OK`) and an {{term(mtconnectstreams response document)}}. If the {{term(request)}} fails, the {{term(agent)}} **MUST** respond with an an {{term(mtconnecterrors response document)}} a {{term(http status code)}} other than 200.

#### HTTP Status Codes for a Current Request

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(current request)}}:

* Status Code: `200`, Code Name: `OK`:

  The {{term(request)}} succeeded.
  
* Status Code: `400`, Code Name: `Bad Request`:

  The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `404`, Code Name: `Not Found`:

  One of the following conditions apply:
  
  * The device name or uuid could not be located. 
  * The {{term(at query)}} was {{term(outofrange value)}} range.
  
  The {{term(response)}} **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `405`, Code Name: `Method Not Allowed`:

  The {{term(request)}} specified a method other than `GET`
  
* Status Code: `406`, Code Name: `Not Acceptable`:

  The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
    
* Status Code: `431`, Code Name: `Request Header Fields Too Large`:

  The fields in the {{term(http request)}} exceed the limit of the implementation of the {{term(agent)}}.
  
* Status Code: `500`, Code Name: `Internal Server Error`:

  There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.

### Sample Request

#### Query Portion of a Sample Request

The following {{term(query http request)}} parameters **MUST** be supported in an {{term(http request line)}} for a {{term(sample request)}}:

* {{term(count model)}}: signed integer

  The {{term(count model)}} parameter designates the maximum number of {{termplural(observation)}} the {{term(agent)}} **MUST** publish in the {{term(response document)}}. 

  The {{term(count model)}} **MUST NOT** be zero (0). 

  When the {{term(count model)}} is greater than zero (0), the {{term(from query)}} parameter **MUST** default to the {{term(firstsequence)}}. The evaluation of {{termplural(observation)}} starts at {{term(from query)}} and moves forward accumulating newer {{termplural(observation)}} until the number of {{termplural(observation)}} equals the {{term(count model)}} or the  {{term(observation)}} at {{term(lastsequence)}} is considered. 

  When the {{term(count model)}} is less than zero (0), the {{term(from query)}} parameter **MUST**  default to the {{term(lastsequence)}}. The evaluation of {{termplural(observation)}} starts at {{term(from query)}} and moves backward accumulating older {{termplural(observation)}} until the number of {{termplural(observation)}} equals the absolute value of {{term(count model)}} or the {{term(observation)}} at {{term(firstsequence)}} is considered. 

  {{term(count model)}} **MUST NOT** be less than zero (0) when an {{term(interval query)}} parameter is given. 

  If {{term(count model)}} is not provided, it **MUST** default to `100`. 

  If the absolute value of {{term(count model)}} is greater than the size of the {{term(buffer)}} or equal to zero (0), the {{term(agent)}} **MUST** return a `404` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an {{term(outofrange value)}}  {{term(errorcode)}}. 

  If the {{term(count model)}} parameter is not a numeric value, the {{term(agent)}} **MUST** return a `400` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an {{term(invalidrequest value)}}  {{term(errorcode)}}.

* {{term(from query)}}: unsigned 64-bit integer
 
  The {{term(from query)}} parameter designates the {{term(sequence number)}} of the first {{term(observation)}} in the {{term(buffer)}} the {{term(agent)}} **MUST** consider publishing in the {{term(response document)}}. 

  If {{term(from query)}} is zero (0), it **MUST** be set to the {{term(firstsequence)}}, the oldest {{term(observation)}} in the {{term(buffer)}}. 

  If {{term(from query)}} and {{term(count model)}} parameters are not given, {{term(from query)}} **MUST** default to the {{term(firstsequence)}}. 

  If the {{term(from query)}} parameter is less than the {{term(firstsequence)}} or greater than {{term(lastsequence)}}, the {{term(agent)}} **MUST** return a `404` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an {{term(outofrange value)}} {{term(errorcode)}}. 

* {{term(heartbeat query)}}: unsigned integer milliseconds
  
  Sets the time period for the {{term(heartbeat)}} function in an {{term(agent)}}. 

  The value for {{term(heartbeat query)}} represents the amount of time after a {{term(response document)}} has been published until a new {{term(response document)}} **MUST** be published, even when no new data is available. 

  The value for {{term(heartbeat query)}} is defined in milliseconds.

  If no value is defined for {{term(heartbeat query)}}, the value **MUST** default to 10 seconds. 

  {{term(heartbeat query)}} **MUST** only be specified if {{term(interval query)}} is also specified.

* {{term(interval query)}}: unsigned integer milliseconds

  The {{term(agent)}} **MUST** continuously publish {{termplural(response document)}} when the query parameters include {{term(interval query)}} using the value as the minimum period between adjacent publications. 

  The {{term(interval query)}} value **MUST** be in milliseconds, and **MUST** be a positive integer greater than or equal to zero (0). 

  If the value for the {{term(interval query)}} parameter is zero (0), the {{term(agent)}} **MUST** publish  {{termplural(response document)}} when any {{termplural(observation)}} become available.

  If the period between the publication of a {{term(response document)}} and reception of {{termplural(observation)}} exceeds the {{term(interval query)}}, the {{term(agent)}} **MUST** wait for a maximum of {{term(heartbeat query)}} milliseconds for {{termplural(observation)}}. Upon the arrival of {{termplural(observation)}}, the {{term(agent)}} **MUST** immediately publish a {{term(response document)}}. When the period equals or exceeds the {{term(heartbeat query)}}, the {{term(agent)}} **MUST** publish an empty {{term(response document)}}.

* {{term(path query)}}: string
  
  An XPath evaluated against the {{term(device information model)}} that references the {{termplural(component)}} and {{termplural(data item)}} to include in the {{term(mtconnectstreams response document)}}.
  
  When a {{term(component)}} element is referenced by the XPath, all {{termplural(observation)}} for its {{termplural(data item)}} and related {{termplural(component)}} **MUST** be included in the {{term(mtconnectstreams response document)}}.


* {{term(to)}}: unisgned 64-bit integer

  The {{term(to)}} parameter specifies the {{term(sequence number)}} of the {{term(observation)}} in the {{term(buffer)}} that will be the upper bound of the \glspl{observation} in the {{term(response document)}}.


  Rules for {{term(to)}} are as follows:

  * The value of {{term(to)}} **MUST** be an unsigned 64-bit integer.
  * The value of {{term(to)}} **MUST** be greater than the `firstSequence`.
  * The value of {{term(to)}} **MUST** be less than or equal to the `lastSequence`.
  * The value of {{term(to)}} **MUST** be greater than `from`.
  * If {{term(to)}} and {{term(count model)}} are given, the {{term(count model)}} parameter **MUST** be greater than zero.
  * If {{term(to)}} and {{term(count model)}} are given, the maximum number of {{termplural(observation)}} published in the {{term(response document)}} **MUST NOT** be greater than the value of {{term(count model)}}.
  * If {{term(to)}} is not given, see the {{term(from query)}} parameter for default behavior.
  * If the {{term(to)}} parameter is less than the `firstSequence` or greater than `lastSequence`, the {{term(agent)}} **MUST** return a `404` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an `OUT_OF_RANGE` `errorCode`.
  * If the {{term(to)}} parameter is not a positive numeric value, the {{term(agent)}} **MUST** return a `400` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an `INVALID_REQUEST` `errorCode`.
  * If the {{term(to)}} parameter is less than the {{term(from query)}} parameter, the {{term(agent)}} **MUST** return a `400` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an `INVALID_REQUEST` `errorCode`.
  * If the {{term(to)}} parameter is given and the {{term(count model)}} parameter is less than zero, the {{term(agent)}} **MUST** return a `400` {{term(http status code)}} and **MUST** publish an {{term(mtconnecterrors response document)}} with an `INVALID_REQUEST` `errorCode`.

#### Response to a Sample Request

The {{term(agent)}} **MUST** respond to a successful {{term(sample request)}} with a {{term(http status code)}} `200` (`OK`) and an {{term(mtconnectstreams response document)}}. If the {{term(request)}} fails, the {{term(agent)}} **MUST** respond with an an {{term(mtconnecterrors response document)}} a {{term(http status code)}} other than 200.

#### HTTP Status Codes for a Sample Request

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(current request)}}:

* Status Code: `200`, Code Name: `OK`:

  The {{term(request)}} succeeded.
  
* Status Code: `400`, Code Name: `Bad Request`:

  The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `404`, Code Name: `Not Found`:

  One of the following conditions apply:
  
  * The device name or UUID could not be located. 
  * One of the {{termplural(assetid path)}} could not be found.
  
  The {{term(response)}} **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `405`, Code Name: `Method Not Allowed`:

  The {{term(request)}} specified a method other than `GET`
  
* Status Code: `406`, Code Name: `Not Acceptable`:

  The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
    
* Status Code: `431`, Code Name: `Request Header Fields Too Large`:

  The fields in the {{term(http request)}} exceed the limit of the implementation of the {{term(agent)}}.
  
* Status Code: `500`, Code Name: `Internal Server Error`:

  There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.

### Asset Request

#### Path Portion of an Asset Request

The following additional segment of path **MUST** be supported in the {{term(http request line)}} for an {{term(asset request)}}:

* `asset_ids`: 

  The {{term(path query)}} portion is a list of ({{term(assetid path)}}) for specific {{termplural(asset document)}}.  

  In response, the {{term(agent)}} returns an {{term(mtconnectassets response document)}} that contains information for the specific {{termplural(asset)}} for each of the {{term(assetid path)}} values provided in the {{term(request)}}. Each {{term(assetid path)}} is separated by a ";".
  
Examples:

* `http://localhost:5000/assets/CuttingTool1;CuttingTool2`

  The {{term(mtconnectassets response document)}} contains {{term(asset)}} documents for an asset with {{term(assetid)}} of `CuttingTool1` and `CuttingTool2`

#### Query Portion of an Asset Request

A {{term(query)}} may be used to more precisely define the specific information to be included in a {{term(response document)}}.   Multiple parameters may be used in a {{term(query)}} to further refine the information to be included.  When multiple parameters are provided, each parameter is separated by an & character and each parameter appears only once in the {{term(query)}}.  The parameters within the {{term(query)}} may appear in any sequence.

The following {{term(query http request)}} parameters **MUST** be supported in an {{term(http request line)}} for an {{term(asset request)}}:

* {{term(removed)}}: boolean `true` or `false`

  The value for {{term(removed)}} **MUST** be {{term(true removed)}} or {{term(false removed)}} and interpreted as follows:
  
  * `true`: {{termplural(asset document)}} for {{termplural(asset)}} marked as removed **MUST** be included in the {{term(response document)}}. 
  * `false`: {{termplural(asset document)}} for {{termplural(asset)}} marked as removed **MUST NOT** be included in the {{term(response document)}}. 
  
  If {{term(removed)}} is not given, the default value **MUST** be {{term(false removed)}}. 

* {{term(count model)}}: unsigned integer

  Specifies the maximum number of {{termplural(asset document)}} returned in an {{term(mtconnectassets response document)}}.
  
  If {{term(count model)}} is not given, the default value **MUST** be `100`.

#### Response to an Asset Request

The {{term(response)}} to an {{term(asset request)}} **SHOULD** be an {{term(mtconnectassets response document)}} containing information for one or more {{termplural(asset document)}} designated by the {{term(request)}}.  
The {{term(response)}} to an {{term(asset request)}} **MUST** always provide the most recent information available to an {{term(agent)}}.

The {{termplural(asset document)}} provided in the {{term(mtconnectassets response document)}} will be limited to those specified in the combination of the {{term(path query)}} segment of the {{term(asset request)}} and the parameters provided in the {{term(query http request)}} segment of that {{term(request)}}.

If the {{term(removed)}} query parameter is not provided with a value of {{term(true removed)}}, {{termplural(asset document)}} for {{termplural(asset)}} that have been marked as removed will not be provided in the response. 

#### HTTP Status Codes for a Asset Request

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(asset request)}}:

* Status Code: `200`, Code Name: `OK`:

  The {{term(request)}} succeeded.
  
* Status Code: `400`, Code Name: `Bad Request`:

  The {{term(request)}} was invalid. The {{term(response)}}  **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `404`, Code Name: `Not Found`:

  One of the following conditions apply:
  
  * The device name or uuid could not be located. 
  * The {{term(from query)}} or {{term(to)}} was {{term(outofrange value)}}.
  
  The {{term(response)}} **MUST** have an {{term(mtconnecterrors response document)}}.
  
* Status Code: `405`, Code Name: `Method Not Allowed`:

  The {{term(request)}} specified a method other than `GET`
  
* Status Code: `406`, Code Name: `Not Acceptable`:

  The HTTP `Accept` Header in the {{term(request)}} was not one of the supported representations.
    
* Status Code: `431`, Code Name: `Request Header Fields Too Large`:

  The fields in the {{term(http request)}} exceed the limit of the implementation of the {{term(agent)}}.
  
* Status Code: `500`, Code Name: `Internal Server Error`:

  There was an unexpected error in the {{term(agent)}} while responding to a {{term(request)}}.

### HTTP Errors

When an {{term(agent)}} receives an {{term(http request)}} that is incorrectly formatted or is not supported by the {{term(agent)}}, the {{term(agent)}} **MUST** publish an {{term(http error message)}} which includes a specific status code from the tables above indicating that the {{term(request)}} could not be handled by the {{term(agent)}}.

Also, if the {{term(agent)}} experiences an internal error and is unable to provide the requested {{term(response document)}}, it **MUST** publish an {{term(http error message)}} that includes a specific status code from the table above.

When an {{term(agent)}} encounters an error in interpreting or responding to an {{term(http request)}}, the {{term(agent)}} **MUST** also publish an {{term(mtconnecterrors response document)}} that provides additional details about the error.  See {{latex(\sect{Error Information Model})}} for details on the {{term(mtconnecterrors response document)}}.  

### Streaming Data

HTTP {{term(data streaming)}} is a method for an {{term(agent)}} to provide a continuous stream of {{termplural(observation)}} in response to a single {{term(request)}} using a {{term(publishsubscribe)}} communication pattern.

When an {{term(http request)}} includes an {{term(interval query)}} parameter, an {{term(agent)}} **MUST** provide data with a minimum delay in milliseconds between the end of one data transmission and the beginning of the next.  A value of zero (0) for the {{term(interval query)}} parameter indicates that the {{term(agent)}} should deliver data at the highest rate possible and is only relevant for {{termplural(sample request)}} .

The format of the response **MUST** use an `x-multipart-replace` encoded message with each section separated by MIME boundaries.  Each section **MUST** contain an entire {{term(mtconnectstreams response document)}}. 

When streaming for a {{term(current request)}}, the {{term(agent)}} produces a {{term(mtconnectstreams response document)}} with the most current {{termplural(observation)}} every {{term(interval query)}} milliseconds.

When streaming for a {{term(sample request)}}, if there are no available {{termplural(observation)}} after the {{term(interval query)}} time elapsed, the {{term(agent)}} **MUST** wait for either the {{term(heartbeat query)}} time to elapse or an {{term(observation)}} arrives. If the {{term(heartbeat query)}} time elapses and no {{termplural(observation)}} arrive, then an empty {{term(mtconnectstreams)}} document **MUST** be sent.

> Note: For more information on MIME, see IETF RFC 1521 and RFC 822.

An example of the format for a {{term(http request)}} that  includes an {{term(interval query)}} parameter is:

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

Lines 1-9 in {{ref{http-response-header})}} represent a standard header for a MIME `multipart/x-mixed-replace` message.  The boundary is a separator for each section of the stream. Lines 7-8 indicate this is a multipart MIME message and the boundary between sections. 

With streaming protocols, the `Content-length` **MUST** be omitted and `Transfer-Encoding` **MUST** be set to `chunked` (line 9). See IETF RFC 7230 for a full description of the HTTP protocol and chunked encoding.

~~~~
--a8e12eced4fb871ac096a99bf9728425
Content-type: text/xml
Content-length: 887

<?xml version="1.0" ecoding="UTF-8"?>
<MTConnectStreams ...>...
~~~~
{: caption="HTTP Response header 2" label="http-response-header-2" start="last"}

Each section of the document begins with a boundary preceded by two hyphens (`--`). The `Content-type` and `Content-length` header fields **MUST** be provided for each section and **MUST** be followed by `<CR><LF><CR><LF>` (ASCII code for `<CR>` is 13 and `<LF>` 10) before the {{term(xml)}} document. The header and the `<CR><LF><CR><LF>` **MUST NOT** included in the computation of the content length.

An {{term(agent)}} **MUST** continue to stream results until the client closes the connection.  The {{term(agent)}} **MUST NOT** the streaming for any other reason other than the {{term(agent)}} process shutting down or the client application becoming unresponsive and not receiving data (as indicated by not consuming data and the write operation blocking).

#### Heartbeat

When {{term(streaming data)}} is requested from a {{term(sample request)}}, an {{term(agent)}} **MUST** support a {{term(heartbeat)}} to indicate to a client application that the HTTP connection is still viable during times when there is no new data available to be published.  The {{term(heartbeat)}} is indicated by an {{term(agent)}} by sending an MTConnect {{term(response document)}} with an empty Steams container (See {{latex(\citetitle{MTCPart3})}}, *Section 4.1 Streams* for more details on the {{term(streams)}} container) to the client software application.

The {{term(heartbeat)}} **MUST** occur on a periodic basis given by the optional {{term(heartbeat query)}} query parameter and **MUST** default to 10 seconds.  An {{term(agent)}} **MUST** maintain a separate {{term(heartbeat)}} for each client application for which the {{term(agent)}} is responding to a {{term(data streaming)}} {{term(request)}}.

An {{term(agent)}} **MUST** begin calculating the interval for the time-period of the {{term(heartbeat)}} for each client application immediately after a {{term(response document)}} is published to that specific client application.

The {{term(heartbeat)}} remains in effect for each client software application until the {{term(data streaming)}} {{term(request)}} is terminated by either the {{term(agent)}} or the client application.

### References

A {{term(component)}} **MAY** include a set of {{termplural(reference term)}} of the following types that **MAY** alter the content of the {{termplural(mtconnectstreams response document)}} published in response to a {{term(current request)}} or a {{term(sample request)}} as specified:

* A {{term(component term)}} {{term(reference term)}} ({{term(componentref)}}) modifies the set of resulting {{termplural(data entity)}}, limited by a path query parameter of a {{term(current request)}} or {{term(sample request)}}, to include the {{termplural(data entity)}} associated with the {{term(structural element)}} whose value for its {{term(id)}} attribute matches the value provided for the {{term(idref)}} attribute of the {{term(componentref)}} element. Additionally, {{termplural(data entity)}} defined for any {{term(lower level)}} {{term(structural element)}}(s) associated with the identified {{term(structural element)}} **MUST** also be returned. The result is equivalent to appending `//[@id=<"idRef">]` to the path query parameters of the {{term(current request)}} or {{term(sample request)}}. See {{latex(\sect{Current Request Implemented Using HTTP})}} for more details on path queries.

* A {{term(data item)}} {{term(reference term)}} ({{term(dataitemref)}}) modifies the set of resulting {{termplural(data entity)}}, limited by a path query parameter of a {{term(current request)}} or {{term(sample request)}}, to include the {{term(data entity)}} whose value for its {{term(id)}} attribute matches the value provided for the {{term(idref)}} attribute of the {{term(dataitemref)}} element. The result is equivalent to appending `//[@id=<"idRef">]` to the path query parameters of the {{term(current request)}} or {{term(sample request)}}. See {{latex(\sect{Current Request Implemented Using HTTP})}} for more details on path queries.

