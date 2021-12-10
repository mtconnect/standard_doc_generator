# MTConnect Specification and Material Statement

{{term(AMT)}} owns the copyright in this MTConnect Specification or Material. {{term(AMT)}} grants to you a non-exclusive, non-transferable, revocable, non-sublicensable, fully-paid-up copyright license to reproduce, copy and redistribute this MTConnect Specification or Material, provided that you may only copy or redistribute the MTConnect Specification or Material in the form in which you received it, without modifications, and with all copyright notices and other notices and disclaimers contained in the MTConnect Specification or Material.

If you intend to adopt or implement an MTConnect Specification or Material in a product, whether hardware, software or firmware, which complies with an MTConnect Specification, you shall agree to the MTConnect Specification Implementer License Agreement ("Implementer License") or to the MTConnect Intellectual Property Policy and Agreement ("IP Policy"'). The Implementer License and IP Policy each sets forth the license terms and other terms of use for MTConnect Implementers to adopt or implement the MTConnect Specifications, including certain license rights covering necessary patent claims for that purpose. These materials can be found at {{url(www.MTConnect.org)}}, or or by contacting {{url(mailto:info@MTConnect.org)}}. 

MTConnect Institute and {{term(AMT)}} have no responsibility to identify patents, patent claims or patent applications which may relate to or be required to implement a Specification, or to determine the legal validity or scope of any such patent claims brought to their attention. Each MTConnect Implementer is responsible for securing its own licenses or rights to any patent or other intellectual property rights that may be necessary for such use, and neither {{term(AMT)}} nor MTConnect Institute have any obligation to secure any such rights.

This Material and all MTConnect Specifications and Materials are provided "as is" and MTConnect Institute and {{term(AMT)}}, and each of their respective members, officers, affiliates, sponsors and agents, make no representation or warranty of any kind relating to these materials or to any implementation of the MTConnect Specifications or Materials in any product, including, without limitation, any expressed or implied warranty of noninfringement, merchantability, or fitness for particular purpose, or of the accuracy, reliability, or completeness of information contained herein. In no event shall MTConnect Institute or {{term(AMT)}} be liable to any user or implementer of MTConnect Specifications or Materials for the cost of procuring substitute goods or services, lost profits, loss of use, loss of data or any incidental, consequential, indirect, special or punitive damages or other direct damages, whether under contract, tort, warranty or otherwise, arising in any way out of access, use or inability to use the MTConnect Specification or other MTConnect Materials, whether or not they had advance notice of the possibility of such damage.


# Purpose of This Document

This document, {{citetitle(MTCPart3)}} of the MTConnect Standard, establishes the rules and terminology that describes the information returned by an {{term(MTConnect Agent)}} from a piece of equipment.  The {{term(Observation Information Model}} also defines, in {{sect(Observations Information Model)}}, the structure for the {{termplural(response document)}} that are returned from an {{term(agent)}} in response to a {{term(sample request)}} or {{term(current request)}}.  

{{citetitle(MTCPart3)}} is not a stand-alone document.   This document is used in conjunction with {{citetitle(MTCPart1)}}  which defines the fundamentals of the operation of the MTConnect Standard and {{citetitle(MTCPart2)}} that defines the semantic model representing the information that may be returned from a piece of equipment.

> Note: {{citetitle(MTCPart5)}} provides details on extensions to the {{term(Observation Information Model)}} required to describe the interactions between pieces of equipment.

In the MTConnect Standard, equipment represents any tangible property that is used in the operation of a manufacturing facility.  Examples of equipment are machine tools, ovens, sensor units, workstations, software applications, and bar feeders.

# Terminology and Conventions

Refer to Section 3 of {{citetitle(MTCPart1)}} for a dictionary of terms, reserved language, and document conventions used in the MTConnect Standard.

{{printglossary[title=General Terms, type=general]()}}
{{printglossary[title=Information Model Terms, type=informationmodel]()}}
{{printglossary[title=Protocol Terms, type=protocol]()}}
{{printglossary[title=HTTP Terms, type=http]()}}
{{printglossary[title=XML Terms, type=xml]()}}
{{printglossary[title=MTConnect Terms, type=conceptmodel]()}}

{{printacronyms()}}

{{printbibliography[title=MTConnect References,keyword=MTC]()}}

{{printbibliography[title=Other References,notkeyword=MTC]()}}

{{glsaddall()}}


# Observations Information Model

The {{term(Observation Information Model)}} provides a representation of the data reported by a piece of equipment used for a manufacturing process, or used for any other purpose.  Additional descriptive information associated with the reported data is defined by the {{block(MTConnectDevices)}} entity, which is described in {{citetitle(MTCPart2)}}.

Information defined in the {{term(Observation Information Model)}} allows a software application to (1) determine the {{termplural(Observation)}} for {{termplural(DataItem)}} returned from a piece of equipment and (2) interpret the data associated with those {{termplural(Observation)}} with the same meaning, value, and context that it had at its original source.  To do this, the software application issues one of two HTTP requests to an {{term(agent)}} associated with a piece of equipment.  They are:

* `sample`:  Returns a designated number of time stamped {{termplural(Observation)}} from an {{term(agent)}} associated with a piece of equipment; subject to any HTTP filtering associated with the request.  See {{cite(Section 8.3.3)}} of {{citetitle(MTCPart1)}} of the MTConnect Standard for details on the `sample` HTTP request.

* `current`:  Returns a snapshot of either the most recent values or the values at a given sequence number for all {{termplural(Observation)}} associated with a piece of equipment from an {{term(agent)}}; subject to any HTTP filtering associated with the request.  See {{cite(Section 8.3.2)}} of {{citetitle(MTCPart1)}} of the MTConnect Standard for details on the `current` HTTP request.


An {{term(agent)}} responds to either the `sample` or `current` HTTP request with an {{term(MTConnectStreams Response Document)}}.  This document contains information describing {{termplural(Observation)}} reported by an {{term(agent)}} associated with a piece of equipment.   A client software application may correlate the information provided in the {{term(MTConnectStreams Response Document)}} with the physical and logical structure for that piece of equipment defined in the {{block(MTConnectDevices)}} entity to form a clear and unambiguous understanding of the information provided.  (See details on the structure for a piece of equipment described in {{citetitle(MTCPart2)}}).

{{block(Streams)}} for an {{block(MTConnectStreams)}} entity contains a {{block(DeviceStream)}} entity for each piece of equipment represented in the document.  Each {{block(DeviceStream)}} is comprised of two primary types of entities – {{termplural(Component)}} and {{termplural(Observation)}}.  The contents of the {{block(DeviceStream)}} container are described in detail in this document, {{citetitle(MTCPart3)}} of the MTConnect Standard.

{{termplural(Component)}} are defined for both the {{block(MTConnectDevices)}} and the {{block(MTConnectStreams)}} entities.  These {{termplural(Component)}} are used to provide a logical organization of the information provided in each entity.  

* For an {{block(MTConnectDevices)}} entity: {{termplural(Component)}} organize information that represents the physical and logical parts and sub-parts of a piece of equipment.  (See {{citetitle(MTCPart2)}}, Section 4 of the MTConnect Standard for more details on {{termplural(Component)}} used in the {{block(MTConnectDevices)}} entity).  

* For an {{block(MTConnectStreams)}} entity: {{termplural(Component)}} provide the structure to organize the data returned from a piece of equipment and establishes the proper context for that data.  The {{termplural(Component)}} specifically defined for {{block(MTConnectStreams)}} are {{block(DeviceStream)}} (see {{sect(DeviceStream)}}) and {{block(ComponentStream)}} (see {{sect(ComponentStream)}}).   

{{block(DeviceStream)}} and {{block(ComponentStream)}} entities have a direct correlation to each of the {{term(Component)}} defined in the {{block(MTConnectDevices)}} entity.

Within each {{block(ComponentStream)}} entity in the {{block(MTConnectStreams)}} entity, {{termplural(Observation)}} are modeled as {{block(Observation)}} entities. The three types of {{block(Observation)}} entity are {{block(Sample)}}, {{block(Event)}}, and {{block(Condition)}}.  (See {{sect(Observation Types)}} for more information on these entities.)


## MTConnectStreams

This section provides semantic information for the {{block(MTConnectStreams)}} entity.

### Header


provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.


#### Value Properties of Header

{{tbl(value-properties-of-header)}} lists the Value Properties of {{block(Header)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(firstSequence)}} | `uInt64` | 1 |
| {{property(lastSequence)}} | `uInt64` | 1 |
| {{property(nextSequence)}} | `uInt64` | 1 |
| {{property(deviceModelChangeTime)}} | `dateTime` | 1 |
| {{property(version)}} | `version` | 1 |
| {{property(testIndicator)}} | `boolean` | 0..1 |
| {{property(sender)}} | `string` | 1 |
| {{property(instanceId)}} | `uInt64` | 1 |
| {{property(creationTime)}} | `dateTime` | 1 |
| {{property(bufferSize)}} | `uInt32` | 1 |
{: caption="Value Properties of Header"}

Descriptions for Value Properties of {{block(Header)}}:

* {{property(firstSequence)}} 

    {{term(sequence number)}} assigned to the oldest piece of {{term(streaming data)}} stored in the {{term(buffer)}} of the {{term(agent)}} immediately prior to the time that the {{term(agent)}} published the {{term(response document)}}.   

* {{property(lastSequence)}} 

    {{term(sequence number)}} assigned to the last piece of {{term(streaming data)}} that was added to the {{term(buffer)}} of the {{term(agent)}} immediately prior to the time that the {{term(agent)}} published the {{term(response document)}}.   
    
    

* {{property(nextSequence)}} 

    {{term(sequence number)}} of the piece of {{term(streaming data)}} that is the next piece of data to be retrieved from the {{term(buffer)}} of the {{term(agent)}} that was not included in the {{term(response document)}} published by the {{term(agent)}}.
    
    If the {{term(streaming data)}} included in the {{term(response document)}} includes the last piece of data stored in the {{term(buffer)}} of the {{term(agent)}} at the time that the document was published, then the value reported for {{property(nextSequence)}} **MUST** be equal to {{property(lastSequence)}} + 1.

* {{property(deviceModelChangeTime)}} 

    timestamp of the last update of the {{block(Device)}} information for any device.

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
    

### MTConnectStreams


root entity of an {{term(MTConnectStreams Response Document)}} that contains the {{term(Observation Information Model)}} of one or more {{block(Device)}} entities.

> Note: Additional properties of {{block(MTConnectStreams)}} **MAY** be defined for schema and namespace declaration. See {{citetitle(MTCPart1)}}.


#### Reference Properties of MTConnectStreams

{{tbl(reference-properties-of-mtconnectstreams)}} lists the Reference Properties of {{block(MTConnectStreams)}}.

| Reference Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Header)}} | 1 |
| {{block(DeviceStream)}} (organized by {{block(Streams)}}) | 1..* |
{: caption="Reference Properties of MTConnectStreams"}

Descriptions for Reference Properties of {{block(MTConnectStreams)}}:

* {{block(Header)}} 

    provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.
    provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.

* {{block(DeviceStream)}} 

    {{termplural(organize)}} data reported from a {{block(Device)}}.
    {{block(Streams)}} groups one or more {{block(DeviceStream)}} entities. See {{sect(Streams)}} for more detail.


# Streams Model

{{block(MTConnectStreams)}} organizes the information and data that is reported by an {{term(agent)}} for a piece of equipment.

![Observations](figures/Observations.png "Observations"){: width="0.8"}

> Note: See {{sect(Observations Schema Diagrams)}} for XML schema.

{{fig(DeviceStream Example)}} shows a complete example of {{block(DeviceStream)}} for the {{block(Device)}} shown in {{textit(Figure 2: Component Example)}} in {{citetitle(MTCPart2)}}.

![DeviceStream Example](figures/DeviceStream%20Example.png "DeviceStream Example"){: width="0.8"}

> Note: See {{lst(devicestream-example)}} for the {{term(XML)}} representation of the same example.


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
|--------------------:|--------------------:|-------------:|
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
|-------------------------------------:|-------------:|
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
|--------------------:|--------------------:|-------------:|
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
|-------------------------------------:|-------------:|
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



## Observations

This section provides semantic information for the {{block(Observation)}} model.

> Note: See {{sect(Observations Schema Diagrams)}} for XML schema of {{block(Observation)}} types.

### Observations made for DataItem

{{block(Component)}} {{termplural(observe)}} {{block(DataItem)}} entities and creates {{block(Observation)}} entities for the {{block(DataItem)}} entities. See {{fig(Observations)}}.

{{block(Observation)}} entities made by a {{block(Component)}} are organized by a {{block(ComponentStream)}} which is specifically created for that {{block(Component)}}.

![Observations made for DataItem Example](figures/Observations%20made%20for%20DataItem%20Example.png "Observations made for DataItem Example"){: width="0.8"}

> Note: See {{sect(Observations made for DataItem Example)}} for how XML representation of the same example is separated into {{term(MTConnectDevices Response Document)}} and {{term(MTConnectStreams Response Document)}}.

{{fig(Observations made for DataItem Example)}} is a subset of {{fig(DeviceStream Example)}}. It shows an example of the association between a {{block(DataItem)}} {{block(Event)}} type (`EMERGENCY_STOP`) and an {{block(Observation)}} {{block(Event)}} type (`EmergencyStop`). See {{sect(Naming Convention for Observation types)}}.

{{fig(Observations made for DataItem Example)}} also shows example of the association between a {{block(Component)}} type (`Controller`) and related {{block(ComponentStream)}}.

#### Naming Convention for Observation types

The name of an {{block(Observation)}} type **MUST** derive from the {{block(DataItem)}} property {{property(type)}} converted to Pascal-Case by removing underscores (_ ) and capitalizing each word. The conversion **MUST NOT** apply to the following abbreviated words: `PH`, `AC`, `DC` and `URI`. `MTCONNECT` **MUST** be converted to `MTConnect`. See {{fig(Observations made for DataItem Example)}} for an example.

The name of an {{block(Observation)}} type reported in the {{term(MTConnectStreams Response Document)}} is extended when the {{property(representation)}} property is used to further describe that {{block(DataItem)}} in the {{term(MTConnectDevices Response Document)}}. See {{sect(Representations)}} for more details.

### Observation


abstract entity that provides telemetry data for a {{block(DataItem)}} at a point in time.


#### Value Properties of Observation

{{tbl(value-properties-of-observation)}} lists the Value Properties of {{block(Observation)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(compositionId)}} | `ID` | 0..1 |
| {{property(dataItemId)}} | `ID` | 1 |
| {{property(name)}} | `string` | 0..1 |
| {{property(sequence)}} | `integer` | 1 |
| {{property(subType)}} | `DataItemSubTypeEnum` | 0..1 |
| {{property(timestamp)}} | `dateTime` | 1 |
| {{property(type)}} | `DataItemTypeEnum` | 1 |
| {{property(units)}} | `UnitEnum` | 0..1 |
| {{property(result)}} | `string` | 0..1 |
{: caption="Value Properties of Observation"}

Descriptions for Value Properties of {{block(Observation)}}:

* {{property(compositionId)}} 

    identifier of the {{block(Composition)}} entity defined in the {{block(MTConnectDevices)}} {{term(response document)}} associated with the data reported for the {{block(Observation)}}.

* {{property(dataItemId)}} 

    unique identifier of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(dataItemId)}} **MUST** match the {{property(id)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(name)}} 

    name of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(name)}} **MUST** match the {{property(name)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(sequence)}} 

    number representing the sequential position of an occurrence of an {{term(observation)}} in the data buffer of an {{term(agent)}}.
    
    {{property(sequence)}} **MUST** have a value represented as an unsigned 64-bit value from 1 to $2^{64}-1$.

* {{property(subType)}} 

    subtype of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(subType)}} **MUST** match the {{property(subType)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(subType)}} **MUST** be one of the `DataItemSubTypeEnum` enumeration.

* {{property(timestamp)}} 

    most accurate time available to a piece of equipment that represents the point in time that the data reported was measured.

* {{property(type)}} 

    type of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(type)}} **MUST** match the {{property(type)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(type)}} **MUST** be one of the `DataItemTypeEnum` enumeration.

* {{property(units)}} 

    units of the {{block(DataItem)}} associated with this {{block(Observation)}}.
    
    {{property(units)}} **MUST** match the {{property(units)}} attribute of
    the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration.

* {{property(result)}} 

    {{term(observation)}} of the {{block(Observation)}} entity.
    
    The default value type for {{property(result)}} is `string`.

### Condition


{{block(Observation)}} that provides information about an entity's status regarding its ability to operate or it provides an indication whether the data reported for the entity is within an expected range.



It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with a {{property(category,DataItem)}} property of `CONDITION` in the {{block(MTConnectDevices Response Document)}}.

{{fig(Condition Example)}} shows {{block(Condition)}} type examples for various {{property(state)}}: `Normal` (`dataItemId` = `path_system`) and `Warning` (`dataItemId` = `logic_cond`). It also shows an example for when the {{property(state)}} is not available (`dataItemId` = `cont_system`).

![Condition Example](figures/Condition%20Example.png "Condition Example"){: width="0.8"}

> Note: See {{lst(condition-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Condition)}} lists the additional and/or updated attributes for {{block(Condition)}}.

#### Value Properties of Condition

{{tbl(value-properties-of-condition)}} lists the Value Properties of {{block(Condition)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(nativeCode)}} | `string` | 0..1 |
| {{property(nativeSeverity)}} | `string` | 0..1 |
| {{property(qualifier)}} | `QualifierEnum` | 0..1 |
| {{property(statistic)}} | `StatisticEnum` | 0..1 |
| {{property(xs:lang)}} | `xslang` | 0..1 |
| {{property(type)}} | `ConditionEnum` | 1 |
{: caption="Value Properties of Condition"}

Descriptions for Value Properties of {{block(Condition)}}:

* {{property(nativeCode)}} 

    native code (usually an alpha-numeric value) generated by the controller of a piece of equipment providing a reference identifier for a {{block(Condition)}}.
    
    This is the same information an operator or maintenance personnel may see as a reference code designating a specific fault code provided by the piece of equipment.

* {{property(nativeSeverity)}} 

    severity information to a client software application if the piece of equipment designates a severity level to a fault.

* {{property(qualifier)}} 

    additional information regarding a {{term(condition state)}} associated with the measured value of a process variable.
    
    {{property(qualifier)}} defines whether the {{term(condition state)}} represented indicates a measured value that is above or below an expected value of a process variable.

    The value of {{property(qualifier)}} **MUST** be one of the `QualifierEnum` enumeration.

    `QualifierEnum` Enumeration:


    * `HIGH` 

        measured value is greater than the expected value for a process variable.

    * `LOW` 

        measured value is less than the expected value for a process variable.

* {{property(statistic)}} 

    {{property(statistic)}} provides additional information describing the meaning of the {{block(Condition)}} element.
    
    {{property(statistic)}} **MUST** match the {{property(statistic)}} attribute of the {{block(DataItem)}} entity defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration.

* {{property(xs:lang)}} 

    specifies the language of the {{property(result)}} returned for the {{block(Condition)}}. 
    
    See {{cite(IETF RFC 4646)}} (http://www.ietf.org/rfc/rfc4646.txt).

### Event


{{block(Observation)}} that is a discrete piece of information from a piece of equipment.



It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with a {{property(category,DataItem)}} property of `EVENT` in the {{block(MTConnectDevices Response Document)}}.

{{fig(Event Example)}} shows {{block(Event)}} type examples. It also shows an example for when the {{property(result)}} is not available (`dataItemId`=`d1_asset_rem`).

![Event Example](figures/Event%20Example.png "Event Example"){: width="0.8"}

> Note: See {{lst(event-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Event)}} lists the additional and/or updated attributes for {{block(Event)}}.

#### Value Properties of Event

{{tbl(value-properties-of-event)}} lists the Value Properties of {{block(Event)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(resetTriggered)}} | `ResetTriggeredEnum` | 0..1 |
| {{property(type)}} | `EventEnum` | 1 |
{: caption="Value Properties of Event"}

Descriptions for Value Properties of {{block(Event)}}:

* {{property(resetTriggered)}} 

    identifies when a reported value has been reset and what has caused that reset to occur for those {{block(DataItem)}} entities that may be periodically reset to an initial value.
    
    {{property(resetTriggered)}} **MUST** only be provided for the specific occurrence of a {{block(DataItem)}} reported in the {{block(MTConnectStreams)}} {{term(response document)}} when the reset occurred.

    The value of {{property(resetTriggered)}} **MUST** be one of the `ResetTriggeredEnum` enumeration.

    `ResetTriggeredEnum` Enumeration:


    * `ACTION_COMPLETE` 

        {{property(result)}} of the {{block(Observation)}} that is measuring an action or operation was reset upon completion of that action or operation.

    * `ANNUAL` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a 12-month period.

    * `DAY` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a 24-hour period.

    * `MAINTENANCE` 

        {{property(result)}} of the {{block(Observation)}} was reset upon completion of a maintenance event.

    * `MANUAL` 

        {{property(result)}} of the {{block(Observation)}} was reset based on a physical reset action.

    * `MONTH` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a monthly period.

    * `POWER_ON` 

        {{property(result)}} of the {{block(Observation)}} was reset when power was applied to the piece of equipment after a planned or unplanned interruption of power has occurred.

    * `SHIFT` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a work shift.

    * `WEEK` 

        {{property(result)}} of the {{block(Observation)}} was reset at the end of a 7-day period.

### Sample


{{block(Observation)}} that is continuously changing or analog data value.



It provides the information and data reported from a piece of equipment for those {{block(DataItem)}} entities defined with a {{property(category,DataItem)}} property of `SAMPLE` in the {{block(MTConnectDevices Response Document)}}.

{{block(Sample)}} **MUST** always be reported in `float`.

{{fig(Sample Example)}} shows {{block(Sample)}} type examples. It also shows an example for when the {{property(result)}} is not available (`dataItemId`=`cspeed`).

![Sample Example](figures/Sample%20Example.png "Sample Example"){: width="0.8"}

> Note: See {{lst(sample-example)}} for the {{term(XML)}} representation of the same example.

The following {{sect(Value Properties of Sample)}} lists the additional and/or updated attributes for {{block(Sample)}}.

#### Value Properties of Sample

{{tbl(value-properties-of-sample)}} lists the Value Properties of {{block(Sample)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(duration)}} | `SECOND` | 0..1 |
| {{property(resetTriggered)}} | `ResetTriggeredEnum` | 0..1 |
| {{property(sampleRate)}} | `float` | 0..1 |
| {{property(statistic)}} | `StatisticEnum` | 0..1 |
| {{property(result)}} | `float` | 0..1 |
| {{property(units)}} | `UnitEnum` | 1 |
| {{property(type)}} | `SampleEnum` | 1 |
{: caption="Value Properties of Sample"}

Descriptions for Value Properties of {{block(Sample)}}:

* {{property(duration)}} 

    time-period over which the data was collected.
    
    {{property(duration)}} **MUST** be provided when the {{property(statistic)}} attribute of the {{block(DataItem)}} is defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

* {{property(resetTriggered)}} 

    identifies when a reported value has been reset and what has caused that reset to occur for those {{block(DataItem)}} entities that may be periodically reset to an initial value.
    
    {{property(resetTriggered)}} **MUST** only be provided for the specific occurrence of a {{block(DataItem)}} reported in the {{block(MTConnectStreams)}} {{term(response document)}} when the reset occurred.

    The value of {{property(resetTriggered)}} **MUST** be one of the `ResetTriggeredEnum` enumeration.

* {{property(sampleRate)}} 

    rate at which successive samples of the value are recorded.
    

* {{property(statistic)}} 

    type of statistical calculation defined by the {{property(statistic)}} attribute of the {{block(DataItem)}} defined in the {{block(MTConnectDevices)}} {{term(response document)}}.

    The value of {{property(statistic)}} **MUST** be one of the `StatisticEnum` enumeration.



## Representations

This section provides semantic information for the {{block(Representation)}} model.

![Representation](figures/Representation.png "Representation"){: width="0.8"}

> Note: See {{sect(Representation Schema Diagrams)}} for XML schema.

### Representation


specifies the format and structure of the {{property(result)}} for an {{block(Observation)}}. 

The {{block(Representation)}} type for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} in the {{term(MTConnectDevices Response Document)}}.

{{block(Value)}} is the default {{block(Representation)}} type for all {{block(Observation)}} types.

The name of the {{block(Observation)}} type is modified for all {{block(Representation)}} types other than {{block(Value)}} by appending the pascal case of the {{block(Representation)}} type. 

Example: The name for {{block(Sample)}} {{block(Observation)}} type `Temperature`with `Representation` type of `TimeSeries` becomes `TemperatureTimeSeries`.

### Value


default {{block(Representation)}} type for all {{block(Observation)}} types where {{property(result)}} of the {{block(Observation)}} types is an MTConnect data type. See {{sect(Data Types)}}.


### TimeSeries


{{block(Representation)}} for an {{block(Observation)}} composed of a series of sampled data.



{{block(TimeSeries)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `TIME_SERIES`.

{{block(DataItem)}} with `TIME_SERIES` {{property(representation)}} **MUST** have a {{property(category)}} of `SAMPLE`.

{{fig(TemperatureTimeSeries)}} shows the model for {{block(Temperature)}} ({{block(Sample)}} type) with a {{block(Representation)}} type of {{block(TimeSeries)}}. 

![TemperatureTimeSeries](figures/TemperatureTimeSeries.png "TemperatureTimeSeries"){: width="0.8"}

> Note: See {{fig(AbsTimeSeries Schema)}} for XML schema.

{{block(TimeSeries)}} **MUST** report multiple values at fixed intervals in a single {{block(Observation)}}. At minimum, one of {{block(DataItem)}} or {{block(Observation)}} **MUST** specify the {{property(sampleRate)}} in `Hertz`(values/second); fractional rates are permitted. When the {{block(Observation)}} and the {{block(DataItem)}} specify the {{property(sampleRate)}}, the {{block(Observation)}} {{property(sampleRate)}} supersedes the {{block(DataItem)}}.

The {{block(Observation)}} **MUST** set the {{property(timestamp)}} to the time the last value was observed. The {{property(duration)}} **MAY** indicate the time interval from the first to the last value in the series.

{{sect(Value Properties of TimeSeries)}} defines additional attributes for an {{block(Observation)}} with {{block(TimeSeries)}} {{block(Representation)}} type.

#### Value Properties of TimeSeries

{{tbl(value-properties-of-timeseries)}} lists the Value Properties of {{block(TimeSeries)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(sampleCount)}} | `integer` | 1 |
| {{property(result)}} | `float` | 1..* |
{: caption="Value Properties of TimeSeries"}

Descriptions for Value Properties of {{block(TimeSeries)}}:

* {{property(sampleCount)}} 

    number of values given for the {{block(Observation)}}.

### Discrete


**DEPRECATED** {{block(Representation)}} for an {{block(Observation)}} where each discrete occurrence of the data may have the same value as the previous occurrence of the data.



{{block(Discrete)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `DISCRETE`.

{{block(DataItem)}} with `DISCRETE` {{property(representation)}} **MUST** have a {{property(category)}} of `EVENT`.

*MTConnect Version 1.5* replaced {{property(representation)}} `DISCRETE` with a {{property(discrete)}} property for {{block(DataItem)}}.

Each occurrence of the {{block(Observation)}} **MAY** have the same value as the previous occurrence, and **MUST NOT** suppress duplicates.

Examples of {{block(Discrete)}}: A `PartCount` reporting the completion of each part using a 1 to indicate completion of a single part, a `Message` that occurs each time a door opens. 

#### Value Properties of Discrete

{{tbl(value-properties-of-discrete)}} lists the Value Properties of {{block(Discrete)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(result)}} | `string` | 0..1 |
{: caption="Value Properties of Discrete"}

### DataSet


{{block(Representation)}} for an {{block(Observation)}} composed of value(s) represented as a set of {{termplural(key-value pair)}}.



{{block(DataSet)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `DATA_SET`.

{{block(DataItem)}} with `DATA_SET` {{property(representation)}} **MUST** have a {{property(category)}} of `SAMPLE` or `EVENT`.

{{fig(VariableDataSet)}} shows the model for {{block(Variable)}} ({{block(Event)}} type) with a {{block(Representation)}} type of {{block(DataSet)}}. 

![VariableDataSet](figures/VariableDataSet.png "VariableDataSet"){: width="0.8"}

> Note: See {{fig(DataSet Schema)}} for XML schema.

{{block(DataSet)}} reports multiple values as a set of {{term(key-value pair)}} where each {{term(key)}} **MUST** be unique. The representation of the {{term(key-value pair)}} is an {{block(Entry)}}. The value of each {{block(Entry)}} **MUST** have the same constraints and format as the {{block(Observation)}} defined for the `VALUE` {{property(representation)}} for the {{block(DataItem)}} {{property(type)}} (See {{sect(Value)}}). 

The meaning of each {{block(Entry)}} **MAY** be provided as the {{block(DataItem)}} {{block(EntryDefinition)}}.

{{fig(DataSet Example)}} shows {{block(Event)}} {{block(Observation)}} type {{block(Variable)}} with a {{block(Representation)}} type of `DataSet`.

![DataSet Example](figures/DataSet%20Example.png "DataSet Example"){: width="0.8"}

> Note: See {{lst(dataset-example)}} for the {{term(XML)}} representation of the same example.

#### Management of Data Set Observations

An {{term(agent)}} **MUST** maintain the current state of the {{block(DataSet)}} as described in {{citetitle(MTCPart1)}} *Section Part 1: Management of Streaming Data Storage*.

One or more {{termplural(key-value pair)}} **MAY** be added, removed, or changed in an {{block(Observation)}}. An {{term(agent)}} **MUST** publish the changes to one or more {{termplural(key-value pair)}} as a single {{block(Observation)}}. An {{term(agent)}} **MUST** indicate the removal of a {{term(key-value pair)}} from a {{block(DataSet)}} using the {{property(removed)}} attribute equal `true`.

When the {{block(DataItem)}} {{property(discrete,DataItem)}} attribute is `false` or is not present, an {{term(agent)}} in response to a {{term(sample request)}} **MUST** only publish the changed {{term(key-value pair)}} since the previous state of the {{block(DataSet)}}.

When the {{block(DataItem)}} {{property(discrete,DataItem)}} attribute is `true`, an {{term(agent)}}, in response to a {{term(sample request)}}, **MUST** report all {{termplural(key-value pair)}} ignoring the state of the {{block(DataSet)}}.

When an {{term(agent)}} responds to a {{term(current request)}}, the {{term(response document)}} **MUST** include the full set of {{termplural(key-value pair)}}. If the {{term(current request)}} includes an `at` query parameter, the {{term(agent)}} **MUST** provide the set of {{termplural(key-value pair)}} at the  {{term(sequence number)}}.

When an {{block(Observation)}} {{term(reset)}} occurs, the {{block(DataSet)}} **MUST** remove all {{termplural(key-value pair)}} making the set empty. The {{block(Observation)}} **MAY** simultaneously populate the {{block(DataSet)}} with new {{termplural(key-value pair)}}. The previous entries **MUST NOT** be included and **MUST NOT** have {{property(removed)}} attribute equal `true`.

When the {{block(Observation)}}  is `UNAVAILABLE` the {{block(DataSet)}} **MUST** remove all {{termplural(key-value pair)}} making the set empty.

#### Value Properties of DataSet

{{tbl(value-properties-of-dataset)}} lists the Value Properties of {{block(DataSet)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(count)}} | `integer` | 1 |
{: caption="Value Properties of DataSet"}

Descriptions for Value Properties of {{block(DataSet)}}:

* {{property(count)}} 

    number of {{block(Entry)}} elements for the {{block(Observation)}}.

#### Part Properties of DataSet

{{tbl(part-properties-of-dataset)}} lists the Part Properties of {{block(DataSet)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Entry)}} | 0..* |
{: caption="Part Properties of DataSet"}

Descriptions for Part Properties of {{block(DataSet)}}:

* {{block(Entry)}} 

    {{term(key-value pair)}} published as part of a {{block(DataSet)}}.
    See {{sect(Entry)}}.

### Table


{{block(Representation)}} for an {{block(Observation)}} composed of two-dimensional sets of {{termplural(key-value pair)}} where the {{block(Entry)}} represents rows containing sets of {{termplural(key-value pair)}} given by {{block(Cell)}} entities. 


{{block(Table)}} for an {{block(Observation)}} is defined by the associated {{block(DataItem)}}'s property {{property(representation)}} as `TABLE`.

{{block(DataItem)}} with `TABLE` {{property(representation)}} **MUST** have a {{property(category)}} of `SAMPLE` or `EVENT`.

{{fig(WorkOffsetTable)}} shows the model for {{block(WorkOffset)}} ({{block(Event)}} type) with a {{block(Representation)}} type of {{block(Table)}}. 

![WorkOffsetTable](figures/WorkOffsetTable.png "WorkOffsetTable"){: width="0.8"}

> Note: See {{fig(Table Schema)}} for XML schema.

{{block(Table)}} has the same behavior as the {{block(DataSet)}} for change tracking, clearing, and history. When an {{block(Entry)}} changes, all {{block(Cell)}} entities update at the same time; they are not tracked separately like {{block(Entry)}}.

The meaning of each {{block(Entry)}} and {{block(Cell)}} **MAY** be provided as the {{block(DataItem)}} {{block(EntryDefinition)}} and {{block(CellDefinition)}}.

The {{block(Entry)}} {{property(key)}} attribute **MUST** be the unique identity of the {{block(Entry)}} within an {{block(Observation)}}. The {{block(Cell)}} {{property(key)}} attribute **MUST** be the unique identity of the {{block(Cell)}} within an {{block(Entry)}}.

{{fig(Table Example)}} shows {{block(Event)}} {{block(Observation)}} type {{block(WorkOffset)}} with a {{block(Representation)}} type of `Table`.

![Table Example](figures/Table%20Example.png "Table Example"){: width="0.8"}

> Note: See {{lst(table-example)}} for the {{term(XML)}} representation of the same example.



#### Value Properties of Table

{{tbl(value-properties-of-table)}} lists the Value Properties of {{block(Table)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(count)}} | `integer` | 1 |
{: caption="Value Properties of Table"}

Descriptions for Value Properties of {{block(Table)}}:

* {{property(count)}} 

    number of {{termplural(key-value pair)}} represented as {{block(Entry)}} entities.

#### Part Properties of Table

{{tbl(part-properties-of-table)}} lists the Part Properties of {{block(Table)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(TableEntry)}} | 0..* |
{: caption="Part Properties of Table"}

Descriptions for Part Properties of {{block(Table)}}:

* {{block(TableEntry)}} 

    {{term(key-value pair)}} published as part of a {{block(Table)}}.
    
    > Note: In the {{term(XML)}} representation, {{block(TableEntry)}} **MUST** appear as {{block(Entry)}}.
    
    
    See {{sect(TableEntry)}}.

### Entry


{{term(key-value pair)}} published as part of a {{block(DataSet)}}.

#### Constraints for Entry Values

The value of each {{block(Entry)}} **MUST** have the same restrictions as the value of an {{term(observation)}} with {{property(representation)}} of `VALUE`.

An {{block(Entry)}} **MAY** be further constrained by the {{block(DataItem)}} definition (see {{citetitle(MTCPart2)}}), for example a `VariableDataSet` having a string value **MAY** have a floating-point {{block(Temperature)}} value. A restriction **MUST NOT** be broadened or removed, for example, the value "READY" **MUST NOT** occur with a `TemperatureDataSet` constrained to floating-point numbers.

The {{citetitle(MTCPart2)}} {{block(DataItem)}} {{block(Definition)}} **MAY** provide the {{property(type)}} and {{property(units)}} of an {{block(Entry)}} for a {{property(key)}}.


#### Value Properties of Entry

{{tbl(value-properties-of-entry)}} lists the Value Properties of {{block(Entry)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(key)}} | `ID` | 1 |
| {{property(removed)}} | `boolean` | 0..1 |
| {{property(result)}} | `string` | 0..1 |
{: caption="Value Properties of Entry"}

Descriptions for Value Properties of {{block(Entry)}}:

* {{property(key)}} 

    unique identifier for each {{term(key-value pair)}}.

* {{property(removed)}} 

    removal indicator of a {{term(key-value pair)}}.

* {{property(result)}} 

    value of the {{block(Entry)}}.

### TableEntry


{{term(key-value pair)}} published as part of a {{block(Table)}}.

> Note: In the {{term(XML)}} representation, {{block(TableEntry)}} **MUST** appear as {{block(Entry)}}.




#### Value Properties of TableEntry

{{tbl(value-properties-of-tableentry)}} lists the Value Properties of {{block(TableEntry)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(key)}} | `ID` | 1 |
| {{property(removed)}} | `boolean` | 0..1 |
{: caption="Value Properties of TableEntry"}

Descriptions for Value Properties of {{block(TableEntry)}}:

* {{property(key)}} 

    unique identifier for each {{term(key-value pair)}}.

* {{property(removed)}} 

    removal indicator of a {{term(key-value pair)}}.

#### Reference Properties of TableEntry

{{tbl(reference-properties-of-tableentry)}} lists the Reference Properties of {{block(TableEntry)}}.

| Reference Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Table)}} (organized by {{block(TableEntry)}}) | 1 |
{: caption="Reference Properties of TableEntry"}

Descriptions for Reference Properties of {{block(TableEntry)}}:

* {{block(Table)}} 

    {{block(Representation)}} for an {{block(Observation)}} composed of two-dimensional sets of {{termplural(key-value pair)}} where the {{block(Entry)}} represents rows containing sets of {{termplural(key-value pair)}} given by {{block(Cell)}} entities. 
    
    See {{sect(TableEntry)}}.

#### Part Properties of TableEntry

{{tbl(part-properties-of-tableentry)}} lists the Part Properties of {{block(TableEntry)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Cell)}} | 0..* |
{: caption="Part Properties of TableEntry"}

Descriptions for Part Properties of {{block(TableEntry)}}:

* {{block(Cell)}} 

    {{term(key-value pair)}} published as part of a {{block(TableEntry)}}.
    See {{sect(Cell)}}.

### Cell


{{term(key-value pair)}} published as part of a {{block(TableEntry)}}.

#### Constraints for Cell Values

The value of each {{block(Cell)}} **MUST** have the same restrictions as the value of an {{term(observation)}} with {{property(representation)}} of `VALUE`.

An {{block(Cell)}} **MAY** be further constrained by the {{block(DataItem)}} definition (see {{citetitle(MTCPart2)}}), for example a `VariableDataSet` having a string value **MAY** have a floating-point {{block(Temperature)}} value. A restriction **MUST NOT** be broadened or removed, for example, the value `READY` **MUST NOT** occur with a `TemperatureDataSet` constrained limited to floating-point numbers.

The {{citetitle(MTCPart2)}} {{block(DataItem)}} {{block(Definition)}} **MAY** provide the {{property(type)}} and {{property(units)}} of a {{block(Cell)}} for a {{property(key)}}.

#### Value Properties of Cell

{{tbl(value-properties-of-cell)}} lists the Value Properties of {{block(Cell)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(key)}} | `ID` | 1 |
| {{property(result)}} | `string` | 0..1 |
{: caption="Value Properties of Cell"}

Descriptions for Value Properties of {{block(Cell)}}:

* {{property(key)}} 

    unique identifier for each {{term(key-value pair)}}.

* {{property(result)}} 

    value of the {{block(Cell)}}.


# Observation Types




## Condition States

This section provides semantic information on the {{termplural(condition state)}} defined for the {{block(Condition)}} of a piece of equipment.

### Fault


indicates an unexpected situation because the value is unexpected or out of tolerance for the data.


### Normal


indicates whether the value of the data is within an expected range.


### Warning


indicates a possible unexpected situation because the value is unexpected or out of tolerance for the data.




## Condition Types

This section provides semantic information for {{block(Condition)}} types.

{{block(Condition)}} types are reported differently from other {{block(Observation)}} types. They are reported based on the {{term(condition state)}} for each {{block(Condition)}}.

The {{property(type)}} and {{property(subType)}} (where applicable) properties for a {{block(Condition)}} **MAY** be any of the {{property(type)}} and {{property(subType)}} attributes defined for `SAMPLE` {{property(category)}} or `EVENT` {{property(category)}} {{block(DataItem)}} listed in the {{term(Device Information Model)}}.

This section lists additional {{block(Condition)}} types that have been defined to represent the health and fault status of {{termplural(Component)}}.

### Actuator

indication of a fault associated with an actuator.




### ChuckInterlock

state of an interlock function or control logic state intended to prevent the associated {{block(Chuck)}} component from being operated.




### Communications

indication that the piece of equipment has experienced a communications failure.




### DataRange

indication that the value of the data associated with a measured value or a calculation is outside of an expected range.




### Direction

direction of motion.




### EndOfBar

indication of whether the end of a piece of bar stock being feed by a bar feeder has been reached.




### Hardware

hardware of a {{block(Component)}}.




### InterfaceState

operational state of an {{block(Interface)}}.




### LogicProgram

indication that an error occurred in the logic program or programmable logic controller (PLC) associated with a piece of equipment.




### MotionProgram

indication that an error occurred in the motion program associated with a piece of equipment.




### System

general purpose indication associated with an electronic component of a piece of equipment or a controller that represents a fault that is not associated with the operator, program, or hardware.






## Event Types

This section provides semantic information for {{block(Event)}} types.

### ActivationCount

accumulation of the number of times a function has attempted to, or is planned to attempt to, activate or be performed.




The value of {{property(ActivationCount)}} **MUST** be a `string`.


#### Subtypes of ActivationCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### ActiveAxes

set of axes currently associated with a {{block(Path)}} or {{block(Controller)}}.




The value of {{property(ActiveAxes)}} **MUST** be a `string`.

### ActuatorState

operational state of an apparatus for moving or controlling a mechanism or system.




The value of {{property(ActuatorState)}} **MUST** be one of the `ActuatorStateEnum` enumeration. 

`ActuatorStateEnum` Enumeration:


* `ACTIVE` 

    {{block(Actuator)}} is operating.

* `INACTIVE` 

    {{block(Actuator)}} is not operating.

### AdapterSoftwareVersion

originator’s software version of the {{term(adapter)}}.




The value of {{property(AdapterSoftwareVersion)}} **MUST** be a `string`.


### AdapterURI

{{term(URI)}} of the {{term(adapter)}}.




The value of {{property(AdapterURI)}} **MUST** be a `string`.


### Alarm

**DEPRECATED:** Replaced with `CONDITION` category data items in Version 1.1.0.




The value of {{property(Alarm)}} **MUST** be a `string`.


### AlarmLimit

set of limits used to trigger warning or alarm indicators.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `AlarmLimitResult` keys.

`AlarmLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `UPPER_LIMIT` **MUST** be a `float`.


* `UPPER_WARNING` 

    upper boundary indicating increased concern and supervision may be required.
    The value of `UPPER_WARNING` **MUST** be a `float`.


* `LOWER_WARNING` 

    lower boundary indicating increased concern and supervision may be required.
    The value of `LOWER_WARNING` **MUST** be a `float`.


* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `LOWER_LIMIT` **MUST** be a `float`.


### Application

application on a {{block(Component)}}.




The value of {{property(Application)}} **MUST** be a `string`.


#### Subtypes of Application

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Application)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Application)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### AssetChanged

{{block(assetId)}} of the {{term(Asset)}} that has been added or changed.




The value of {{property(AssetChanged)}} **MUST** be a `string`.


#### Value Properties of AssetChanged

{{tbl(value-properties-of-assetchanged)}} lists the Value Properties of {{block(AssetChanged)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(assetType)}} | `AssetTypeEnum` | 1 |
{: caption="Value Properties of AssetChanged"}

Descriptions for Value Properties of {{block(AssetChanged)}}:

* {{property(assetType)}} 

    type of {{block(Asset)}} changed. See {{citetitle(MTCPart4)}} for details on the {{block(Asset)}} model.

    The value of {{property(assetType)}} **MUST** be one of the `AssetTypeEnum` enumeration.

    `AssetTypeEnum` Enumeration:


    * `CuttingTool` 

        {{block(CuttingTool)}} {{block(Asset)}} type.

    * `File` 

        {{block(File)}} {{block(Asset)}} type. 

    * `QIFDocumentWrapper` 

        {{block(QIFDocumentWrapper)}} {{block(Asset)}} type. 

    * `RawMaterial` 

        {{block(RawMaterial)}} {{block(Asset)}} type. 

### AssetRemoved

{{block(assetId)}} of the {{term(Asset)}} that has been removed.




The value of {{property(AssetRemoved)}} **MUST** be a `string`.


#### Value Properties of AssetRemoved

{{tbl(value-properties-of-assetremoved)}} lists the Value Properties of {{block(AssetRemoved)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(assetType)}} | `AssetTypeEnum` | 1 |
{: caption="Value Properties of AssetRemoved"}

Descriptions for Value Properties of {{block(AssetRemoved)}}:

* {{property(assetType)}} 

    type of {{block(Asset)}} removed. See {{citetitle(MTCPart4)}} for details on the {{block(Asset)}} model.

    The value of {{property(assetType)}} **MUST** be one of the `AssetTypeEnum` enumeration.

### Availability

{{term(agent)}}'s ability to communicate with the data source.




The value of {{property(Availability)}} **MUST** be one of the `AvailabilityEnum` enumeration. 

`AvailabilityEnum` Enumeration:


* `AVAILABLE` 

    data source is active and capable of providing data.

* `UNAVAILABLE` 

    data source is either inactive or not capable of providing data.

### AxisCoupling

describes the way the axes will be associated to each other. 
  
This is used in conjunction with `COUPLED_AXES` to indicate the way they are interacting.




The value of {{property(AxisCoupling)}} **MUST** be one of the `AxisCouplingEnum` enumeration. 

`AxisCouplingEnum` Enumeration:


* `TANDEM` 

    axes are physically connected to each other and operate as a single unit.

* `SYNCHRONOUS` 

    axes are not physically connected to each other but are operating together in lockstep.

* `MASTER` 

    axis is the master of the {{block(CoupledAxes)}}.

* `SLAVE` 

    axis is a slave to the {{block(CoupledAxes)}}.

### AxisFeedrateOverride

value of a signal or calculation issued to adjust the feedrate of an individual linear type axis.




The value of {{property(AxisFeedrateOverride)}} **MUST** be a `float`.

#### Subtypes of AxisFeedrateOverride

* `JOG`

    feedrate of an individual linear type axis when that axis is being operated in a
    manual state or method (jogging).
    
    When the `JOG` subtype of `AxisFeedrateOverride` is applied, the resulting commanded feedrate for the axis is limited to the value of the original `JOG` subtype of the `AxisFeedrate` multiplied by the value of the `JOG` subtype of
    `AxisFeedrateOverride`.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### AxisInterlock

state of the axis lockout function when power has been removed and the axis is allowed to move freely.




The value of {{property(AxisInterlock)}} **MUST** be one of the `AxisInterlockEnum` enumeration. 

`AxisInterlockEnum` Enumeration:


* `ACTIVE` 

    axis lockout function is activated, power has been removed from the axis, and the axis is allowed to move freely.

* `INACTIVE` 

    axis lockout function has not been activated, the axis may be powered, and the axis is capable of being controlled by another component.

### AxisState

state of a {{block(Linear)}} or {{block(Rotary)}} component representing an axis.




The value of {{property(AxisState)}} **MUST** be one of the `AxisStateEnum` enumeration. 

`AxisStateEnum` Enumeration:


* `HOME` 

    axis is in its home position.

* `TRAVEL` 

    axis is in motion.

* `PARKED` 

    axis has been moved to a fixed position and is being maintained in that position either electrically or mechanically. 
    
    Action is required to release the axis from this position.

* `STOPPED` 

    axis is stopped.

### Block

line of code or command being executed by a {{block(Controller)}} entity.




The value of {{property(Block)}} **MUST** be a `string`.


### BlockCount

total count of the number of blocks of program code that have been executed since execution started.




The value of {{property(BlockCount)}} **MUST** be a `integer`.

### ChuckInterlock

state of an interlock function or control logic state intended to prevent the associated {{block(Chuck)}} component from being operated.




The value of {{property(ChuckInterlock)}} **MUST** be one of the `ChuckInterlockEnum` enumeration. 

`ChuckInterlockEnum` Enumeration:


* `ACTIVE` 

    chuck cannot be unclamped.

* `INACTIVE` 

    chuck can be unclamped.

#### Subtypes of ChuckInterlock

* `MANUAL_UNCLAMP`

    indication of the state of an operator controlled interlock that can inhibit the ability to initiate an unclamp action of an electronically controlled chuck.
    
    When {{block(ChuckInterlockManualUnclamp)}} is `ACTIVE`, it is expected that a chuck cannot be unclamped until {{block(ChuckInterlockManualUnclamp)}} is set to `INACTIVE`. 
    

### ChuckState

operating state of a mechanism that holds a part or stock material during a manufacturing process. 

It may also represent a mechanism that holds any other mechanism in place within a piece of equipment.




The value of {{property(ChuckState)}} **MUST** be one of the `ChuckStateEnum` enumeration. 

`ChuckStateEnum` Enumeration:


* `OPEN` 

    {{block(Chuck)}} is open to the point of a positive confirmation.

* `CLOSED` 

    {{block(Chuck)}} is closed to the point of a positive confirmation.

* `UNLATCHED` 

    {{block(Chuck)}} is not closed to the point of a positive confirmation and not open to the point of a positive confirmation. 
    
    It is in an intermediate position.

### Code

programmatic code being executed.

**DEPRECATED** in *Version 1.1*.




The value of {{property(Code)}} **MUST** be a `string`.


### CompositionState

operating state of a mechanism represented by a {{block(Composition)}} entity.




The value of {{property(CompositionState)}} **MUST** be a `string`.


#### Subtypes of CompositionState

* `ACTION`

    indication of the operating state of a mechanism.
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `ACTION` **MUST** be one of the `ActionCompositionStateEnum` enumeration.

    `ActionCompositionStateEnum` Enumeration:


    * `ACTIVE` 

        {{block(Composition)}} is operating.

    * `INACTIVE` 

        {{block(Composition)}} is not operating.
* `LATERAL`

    indication of the position of a mechanism that may move in a lateral direction.   
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `LATERAL` **MUST** be one of the `LateralCompositionStateEnum` enumeration.

    `LateralCompositionStateEnum` Enumeration:


    * `RIGHT` 

        position of the {{block(Composition)}} is oriented to the right to the point of a positive confirmation.

    * `LEFT` 

        position of the {{block(Composition)}} is oriented to the left to the point of a positive confirmation.

    * `TRANSITIONING` 

        position of the {{block(Composition)}} is not oriented to the right to the point of a positive confirmation and is not oriented to the left to the point of a positive confirmation. 
        
        It is in an intermediate position.
* `MOTION`

    indication of the open or closed state of a mechanism.
    
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `MOTION` **MUST** be one of the `MotionCompositionStateEnum` enumeration.

    `MotionCompositionStateEnum` Enumeration:


    * `OPEN` 

        position of the {{block(Composition)}} is open to the point of a positive confirmation.

    * `UNLATCHED` 

        position of the {{block(Composition)}} is not open to the
        point of a positive confirmation and is not closed to the point of a positive confirmation. 
        
        It is in an intermediate position.

    * `CLOSED` 

        position of the {{block(Composition)}} is closed to the point of a positive confirmation.
* `SWITCHED`

    indication of the activation state of a mechanism.
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `SWITCHED` **MUST** be one of the `SwitchedCompositionStateEnum` enumeration.

    `SwitchedCompositionStateEnum` Enumeration:


    * `ON` 

        activation state of the {{block(Composition)}} is in an `ON` condition, it is operating, or it is powered.

    * `OFF` 

        activation state of the {{block(Composition)}} is in an `OFF` condition, it is not operating, or it is not powered.
* `VERTICAL`

    indication of the position of a mechanism that may move in a vertical direction.
    

    The value for {{block(CompositionState)}} when {{property(subType)}} is `VERTICAL` **MUST** be one of the `VerticalCompositionStateEnum` enumeration.

    `VerticalCompositionStateEnum` Enumeration:


    * `UP` 

        position of the {{block(Composition)}} element is oriented in an upward direction to the point of a positive confirmation.

    * `DOWN` 

        position of the {{block(Composition)}} element is oriented in a downward direction to the point of a positive confirmation.

    * `TRANSITIONING` 

        position of the {{block(Composition)}} element is not oriented in an upward direction to the point of a positive confirmation and is not oriented in a downward direction to the point of a positive confirmation. 
        
        It is in an intermediate position.

### ConnectionStatus

status of the connection between an {{term(adapter)}} and an {{term(agent)}}.




The value of {{property(ConnectionStatus)}} **MUST** be one of the `ConnectionStatusEnum` enumeration. 

`ConnectionStatusEnum` Enumeration:


* `CLOSED` 

    no connection at all.

* `LISTEN` 

    {{term(agent)}} is waiting for a connection request from an {{term(adapter)}}.

* `ESTABLISHED` 

    open connection.
    
    The normal state for the data transfer phase of the connection.

### ControlLimit

set of limits used to indicate whether a process variable is stable and in control.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `ControlLimitResult` keys.

`ControlLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `UPPER_LIMIT` **MUST** be a `float`.


* `UPPER_WARNING` 

    upper boundary indicating increased concern and supervision may be required.
    The value of `UPPER_WARNING` **MUST** be a `float`.


* `NOMINAL` 

    ideal or desired value for a variable.
    The value of `NOMINAL` **MUST** be a `float`.


* `LOWER_WARNING` 

    lower boundary indicating increased concern and supervision may be required.
    The value of `LOWER_WARNING` **MUST** be a `float`.


* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `LOWER_LIMIT` **MUST** be a `float`.


### ControllerMode

current mode of the {{block(Controller)}} component.




The value of {{property(ControllerMode)}} **MUST** be one of the `ControllerModeEnum` enumeration. 

`ControllerModeEnum` Enumeration:


* `AUTOMATIC` 

    {{block(Controller)}} is configured to automatically execute a program.

* `MANUAL` 

    {{block(Controller)}} is not executing an active program. 
    
    It is capable of receiving instructions from an external source – typically an operator. The {{block(Controller)}} executes operations based on the instructions received from the external source.

* `MANUAL_DATA_INPUT` 

    operator can enter a series of operations for the {{block(Controller)}} to perform.
    
    The {{block(Controller)}} will execute this specific series of operations and then stop.

* `SEMI_AUTOMATIC` 

    {{block(Controller)}} is operating in a mode that restricts the active program from processing its next process step without operator intervention.

* `EDIT` 

    {{block(Controller)}} is currently functioning as a programming device and is not capable of executing an active program.

### ControllerModeOverride

setting or operator selection that changes the behavior of a piece of equipment.




The value of {{property(ControllerModeOverride)}} **MUST** be one of the `ControllerModeOverrideEnum` enumeration. 

`ControllerModeOverrideEnum` Enumeration:


* `ON` 

    {{block(ControllerModeOverride)}} is in the `ON` state and the mode override is active.

* `OFF` 

    {{block(ControllerModeOverride)}} is in the `OFF` state and the mode override is inactive.

#### Subtypes of ControllerModeOverride

* `DRY_RUN`

    setting or operator selection used to execute a test mode to confirm the execution of machine functions. 
    
    When `DRY_RUN` is `ON`, the equipment performs all of its normal functions, except no part or product is produced.  If the equipment has a spindle, spindle operation is suspended.
    
* `MACHINE_AXIS_LOCK`

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 
     
    When `MACHINE_AXIS_LOCK` is `ON`, program execution continues normally, but no equipment motion occurs.
    
* `OPTIONAL_STOP`

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 
    
    The program execution is stopped after a specific program block is executed when `OPTIONAL_STOP` is `ON`.    
    
    In the case of a G-Code program, a program block containing a M01 code designates the command for an `OPTIONAL_STOP`. 
    
    {{block(Execution)}} **MUST** change to `OPTIONAL_STOP` after a program block specifying an optional stop is executed and the {{block(ControllerModeOverride)}} `OPTIONAL_STOP` selection is `ON`.
    
* `SINGLE_BLOCK`

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 
    
    Program execution is paused after each block of code is executed when `SINGLE_BLOCK` is `ON`.   
    
    When `SINGLE_BLOCK` is `ON`, {{block(Execution)}} **MUST** change to `INTERRUPTED` after completion of each block of code. 
    
* `TOOL_CHANGE_STOP`

    setting or operator selection that changes the behavior of the controller on a piece of equipment.  
    
    Program execution is paused when a command is executed requesting a cutting tool to be changed. 
    
    {{block(Execution)}} **MUST** change to `INTERRUPTED` after completion of the command requesting a cutting tool to be changed and `TOOL_CHANGE_STOP` is `ON`.
    

### CoupledAxes

set of associated axes.




The value of {{property(CoupledAxes)}} **MUST** be a `string`.

### CycleCount

accumulation of the number of times a cyclic function has attempted to, or is planned to attempt to execute.




The value of {{property(CycleCount)}} **MUST** be a `string`.


#### Subtypes of CycleCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### DateCode

time and date code associated with a material or other physical item.




The value of {{property(DateCode)}} **MUST** be a string that represents timestamp in ISO 8601 format.

#### Subtypes of DateCode

* `EXPIRATION`

    time and date code relating to the expiration or end of useful life for a material or other physical item.
    
* `FIRST_USE`

    time and date code relating the first use of a material or other physical item.
    
* `MANUFACTURE`

    time and date code relating to the production of a material or other physical item.
    

### DeactivationCount

accumulation of the number of times a function has attempted to, or is planned to attempt to, deactivate or cease.




The value of {{property(DeactivationCount)}} **MUST** be a `string`.


#### Subtypes of DeactivationCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### DeviceAdded

{{term(UUID)}} of new device added to an {{term(MTConnect Agent)}}.




The value of {{property(DeviceAdded)}} **MUST** be a `string`.


### DeviceChanged

{{term(UUID)}} of the device whose {{term(metadata)}} has changed.




The value of {{property(DeviceChanged)}} **MUST** be a `string`.


### DeviceRemoved

{{term(UUID)}} of a device removed from an {{term(MTConnect Agent)}}.




The value of {{property(DeviceRemoved)}} **MUST** be a `string`.


### DeviceUuid

identifier of another piece of equipment that is temporarily associated with a component of this piece of equipment to perform a particular function.




The value of {{property(DeviceUuid)}} **MUST** be a `string`.


### Direction

direction of motion.




The value of {{property(Direction)}} **MUST** be a `string`.


#### Subtypes of Direction

* `LINEAR`

    direction of motion of a linear motion.
    

    The value for {{block(Direction)}} when {{property(subType)}} is `LINEAR` **MUST** be one of the `LinearDirectionEnum` enumeration.

    `LinearDirectionEnum` Enumeration:


    * `POSITIVE` 

        linear position is increasing.

    * `NEGATIVE` 

        linear position is decreasing.

    * `NONE` 

        no direction.
* `ROTARY`

    rotational direction of a rotary motion using the right hand rule convention.
    

    The value for {{block(Direction)}} when {{property(subType)}} is `ROTARY` **MUST** be one of the `RotaryDirectionEnum` enumeration.

    `RotaryDirectionEnum` Enumeration:


    * `CLOCKWISE` 

        clockwise rotation using the right-hand rule.

    * `COUNTER_CLOCKWISE` 

        counter-clockwise rotation using the right-hand rule.

    * `NONE` 

        no direction.

### DoorState

operational state of a {{block(Door)}} component or composition element.




The value of {{property(DoorState)}} **MUST** be one of the `DoorStateEnum` enumeration. 

`DoorStateEnum` Enumeration:


* `OPEN` 

    {{block(Door)}} is open to the point of a positive confirmation.

* `CLOSED` 

    {{block(Door)}} is closed to the point of a positive confirmation.

* `UNLATCHED` 

    {{block(Door)}} is not closed to the point of a positive confirmation and not open to the point of a positive confirmation. 
    
    It is in an intermediate position.

### EmergencyStop

state of the emergency stop signal for a piece of equipment, controller path, or any other component or subsystem of a piece of equipment.




The value of {{property(EmergencyStop)}} **MUST** be one of the `EmergencyStopEnum` enumeration. 

`EmergencyStopEnum` Enumeration:


* `ARMED` 

    emergency stop circuit is complete and the piece of equipment, component, or composition is allowed to operate. 

* `TRIGGERED` 

    operation of the piece of equipment, component, or composition is inhibited.

### EndOfBar

indication of whether the end of a piece of bar stock being feed by a bar feeder has been reached.




The value of {{property(EndOfBar)}} **MUST** be one of the `YesNoEnum` enumeration. 

`YesNoEnum` Enumeration:


* `YES` 

    {{block(EndOfBar)}} has been reached.

* `NO` 

    {{block(EndOfBar)}} has not been reached.

#### Subtypes of EndOfBar

* `AUXILIARY`

    when multiple locations on a piece of bar stock are referenced as the indication for the {{block(EndOfBar)}}, the additional location(s) **MUST** be designated as `AUXILIARY` indication(s) for the {{block(EndOfBar)}}.  
    
* `PRIMARY`

    specific applications **MAY** reference one or more locations on a piece of bar stock as the indication for the {{block(EndOfBar)}}. 
    
    The main or most important location **MUST** be designated as the {{block(PRIMARY)}} indication for the {{block(EndOfBar)}}.
    
    If no {{block(subType)}} is specified, {{block(PRIMARY)}} **MUST** be the default {{block(EndOfBar)}} indication.
    

### EquipmentMode

indication that a piece of equipment, or a sub-part of a piece of equipment, is performing specific types of activities.




The value of {{property(EquipmentMode)}} **MUST** be one of the `EquipmentModeEnum` enumeration. 

`EquipmentModeEnum` Enumeration:


* `ON` 

    equipment is functioning in the mode designated by the `subType`.

* `OFF` 

    equipment is not functioning in the mode designated by the `subType`.

#### Subtypes of EquipmentMode

* `DELAY`

    elapsed time of a temporary halt of action.
    
* `LOADED`

    indication that the sub-parts of a piece of equipment are under load.
    
    Example: For traditional machine tools, this is an indication that the cutting tool is assumed to be engaged with the part.
    
* `OPERATING`

    indication that the major sub-parts of a piece of equipment are powered or performing any activity whether producing a part or product or not.
    
    Example: For traditional machine tools, this includes when the piece of equipment is `WORKING` or it is idle.
    
* `POWERED`

    indication that primary power is applied to the piece of equipment and, as a minimum, the controller or logic portion of the piece of equipment is powered and functioning or components that are required to remain on are
    powered.
    
    Example: Heaters for an extrusion machine that required to be powered even when the equipment is turned off.
    
* `WORKING`

    indication that a piece of equipment is performing any activity the equipment is active and performing a function under load or not.
    
    Example: For traditional machine tools, this includes when the piece of equipment is `LOADED`, making rapid moves, executing a tool change, etc.
    

### Execution

execution status of the {{block(Component)}}.




The value of {{property(Execution)}} **MUST** be one of the `ExecutionEnum` enumeration. 

`ExecutionEnum` Enumeration:


* `READY` 

    {{block(Component)}} is ready to execute instructions.
    
    It is currently idle.

* `ACTIVE` 

    {{block(Component)}} is actively executing an instruction.

* `INTERRUPTED` 

    {{block(Component)}} suspends the execution of the program due to an external signal.
    
    Action is required to resume execution.

* `FEED_HOLD` 

    motion of the active axes are commanded to stop at their current position.

* `STOPPED` 

    {{block(Component)}} program is not `READY` to execute.

* `OPTIONAL_STOP` 

    command from the program has intentionally interrupted execution.
    
    The {{block(Component)}} **MAY** have another state that indicates if the execution is interrupted or the execution ignores the interrupt instruction.

* `PROGRAM_STOPPED` 

    command from the program has intentionally interrupted execution.
    
    Action is required to resume execution.

* `PROGRAM_COMPLETED` 

    program completed execution.

* `WAIT` 

    {{block(Component)}} suspends execution while a secondary operation executes.
    
    Execution resumes automatically once the secondary operation completes.

### Firmware

embedded software of a {{block(Component)}}.




The value of {{property(Firmware)}} **MUST** be a `string`.


#### Subtypes of Firmware

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Firmware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Firmware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    
    

### FunctionalMode

current intended production status of the {{block(Component)}}.




The value of {{property(FunctionalMode)}} **MUST** be one of the `FunctionalModeEnum` enumeration. 

`FunctionalModeEnum` Enumeration:


* `PRODUCTION` 

    {{block(Component)}} is currently producing product, ready to produce product, or its current intended use is to be producing product.

* `SETUP` 

    {{block(Component)}} is not currently producing product. 
    
    It is being prepared or modified to begin production of product.

* `TEARDOWN` 

    {{block(Component)}} is not currently producing product.
    
    Typically, it has completed the production of a product and is being modified or returned to a neutral state such that it may then be prepared to begin production of a different product.

* `MAINTENANCE` 

    {{block(Component)}} is not currently producing product.
    
    It is currently being repaired, waiting to be repaired, or has not yet been returned to a normal production status after maintenance has been performed.

* `PROCESS_DEVELOPMENT` 

    {{block(Component)}} is being used to prove-out a new process, testing of equipment or processes, or any other active use that does not result in the production of product.

### Hardness

hardness of a material.




The value of {{property(Hardness)}} **MUST** be a `float`.

#### Subtypes of Hardness

* `BRINELL`

    scale to measure the resistance to deformation of a surface.
    
* `LEEB`

    scale to measure the elasticity of a surface.
    
* `MOHS`

    scale to measure the resistance to scratching of a surface.
    
* `ROCKWELL`

    scale to measure the resistance to deformation of a surface.
    
* `SHORE`

    scale to measure the resistance to deformation of a surface.
    
* `VICKERS`

    scale to measure the resistance to deformation of a surface.
    

### Hardware

hardness of a material.




The value of {{property(Hardware)}} **MUST** be a `string`.


#### Subtypes of Hardware

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Hardware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Hardware)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### Library

software library on a {{block(Component)}}




The value of {{property(Library)}} **MUST** be a `string`.


#### Subtypes of Library

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(Library)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(Library)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### Line

state of the power source.




The value of {{property(Line)}} **MUST** be a `string`.


#### Subtypes of Line

* `MAXIMUM`

    maximum line number of the code being executed.
    
* `MINIMUM`

    minimum line number of the code being executed.
    

### LineLabel

identifier for a {{block(Block)}} of code in a {{block(Program)}}.




The value of {{property(LineLabel)}} **MUST** be a `string`.


### LineNumber

position of a block of program code within a control program.




The value of {{property(LineNumber)}} **MUST** be a `integer`.

#### Subtypes of LineNumber

* `ABSOLUTE`

    position of a block of program code relative to the beginning of the control program.
    
* `INCREMENTAL`

    position of a block of program code relative to the occurrence of the last {{block(LineLabel)}} encountered in the control program.
    

### LoadCount

accumulation of the number of times an operation has attempted to, or is planned to attempt to, load materials, parts, or other items.




The value of {{property(LoadCount)}} **MUST** be a `string`.


#### Subtypes of LoadCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### LockState

state or operating mode of a {{block(Lock)}}.




The value of {{property(LockState)}} **MUST** be one of the `LockStateEnum` enumeration. 

`LockStateEnum` Enumeration:


* `LOCKED` 

    mechanism is engaged and preventing the associated {{block(Component)}} from being opened or operated.

* `UNLOCKED` 

    mechanism is disengaged and the associated {{block(Component)}} is able to be opened or operated.

### MTConnectVersion

reference version of the MTConnect Standard supported by the {{term(adapter)}}.




The value of {{property(MTConnectVersion)}} **MUST** be a `string`.


### Material

identifier of a material used or consumed in the manufacturing process.




The value of {{property(Material)}} **MUST** be a `string`.


### MaterialLayer

identifies the layers of material applied to a part or product as part of an additive manufacturing process.




The value of {{property(MaterialLayer)}} **MUST** be a `integer`.

#### Subtypes of MaterialLayer

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `TARGET`

    goal of the operation or process.
    

### Message

information to be transferred from a piece of equipment to a client software application.




The value of {{property(Message)}} **MUST** be a `string`.


### Network

network details of a {{block(Component)}}.




The value of {{property(Network)}} **MUST** be a `string`.


#### Subtypes of Network

* `GATEWAY`

    Gateway for the component network.
    
* `IPV4_ADDRESS`

    IPV4 network address of the component.
    
* `IPV6_ADDRESS`

    IPV6 network address of the component.
    
* `MAC_ADDRESS`

    Media Access Control Address. 
    
    The unique physical address of the network hardware.
    
* `SUBNET_MASK`

    SubNet mask for the component network.
    
* `VLAN_ID`

    layer2 Virtual Local Network (VLAN) ID for the component network.
    
* `WIRELESS`

    identifies whether the connection type is wireless.
    

    The value for {{block(Network)}} when {{property(subType)}} is `WIRELESS` **MUST** be one of the `YesNoEnum` enumeration.

    `YesNoEnum` Enumeration:


    * `YES` 

        {{block(EndOfBar)}} has been reached.

    * `NO` 

        {{block(EndOfBar)}} has not been reached.

### OperatingMode

state of {{block(Component)}} or {{block(Composition)}} that describes the automatic or manual operation of the entity.




The value of {{property(OperatingMode)}} **MUST** be one of the `OperatingModeEnum` enumeration. 

`OperatingModeEnum` Enumeration:


* `AUTOMATIC` 

    automatically execute instructions from a recipe or program.
    
    > Note: Setpoint comes from a recipe.

* `MANUAL` 

    execute instructions from an external agent or person.
    
    > Note 1 to entry: Valve or switch is manipulated by an agent/person.
    
    > Note 2 to entry: Direct control of the PID output. % of the range: A user manually sets the % output, not the setpoint.

* `SEMI_AUTOMATIC` 

    executes a single instruction from a recipe or program.
    
    > Note 1 to entry: Setpoint is entered and fixed, but the PID is controlling.
    
    > Note 2 to entry: Still goes through the PID control system.
    
    > Note 3 to entry: Manual fixed entry from a recipe.

### OperatingSystem

Operating System (OS) of a {{block(Component)}}.




The value of {{property(OperatingSystem)}} **MUST** be a `string`.


#### Subtypes of OperatingSystem

* `INSTALL_DATE`

    date the hardware or software was installed.
    

    The value of {{block(OperatingSystem)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `LICENSE`

    license code to validate or activate the hardware or software.
    
* `MANUFACTURER`

    corporate identity for the maker of the hardware or software. 
    
* `RELEASE_DATE`

    date the hardware or software was released for general use. 
    

    The value of {{block(OperatingSystem)}} **MUST** be a string that represents timestamp in ISO 8601 format.
* `VERSION`

    version of the hardware or software.
    

### OperatorId

identifier of the person currently responsible for operating the piece of equipment.




The value of {{property(OperatorId)}} **MUST** be a `string`.


### PalletId

identifier for a pallet.




The value of {{property(PalletId)}} **MUST** be a `string`.


### PartCount

aggregate count of parts.




The value of {{property(PartCount)}} **MUST** be a `float`.

#### Subtypes of PartCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions or activities that were attempted, but failed to complete or resulted in an unexpected or unacceptable outcome.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### PartDetect

indication designating whether a part or work piece has been detected or is present.




The value of {{property(PartDetect)}} **MUST** be one of the `PartDetectEnum` enumeration. 

`PartDetectEnum` Enumeration:


* `PRESENT` 

    part or work piece is detected or is present.

* `NOT_PRESENT` 

    part or work piece is not detected or is not present.

### PartGroupId

identifier given to a collection of individual parts. 

If no {{property(subType)}} is specified, `UUID` is default.


The value of {{property(PartGroupId)}} **MUST** be a `string`.


#### Subtypes of PartGroupId

* `BATCH`

    identifier that references a group of parts produced in a batch.
    
* `HEAT_TREAT`

    identifier used to reference a material heat number.
    
* `LOT`

    identifier that references a group of parts tracked as a lot.
    
* `RAW_MATERIAL`

    material that is used to produce parts.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### PartId

identifier of a part in a manufacturing operation.




The value of {{property(PartId)}} **MUST** be a `string`.


### PartKindId

identifier given to link the individual occurrence to a class of parts, typically distinguished by a particular part design.

If no {{property(subType)}} is specified, `UUID` is default.


The value of {{property(PartKindId)}} **MUST** be a `string`.


#### Subtypes of PartKindId

* `PART_FAMILY`

    identifier given to a group of parts having similarities in geometry, manufacturing process, and/or functions.
    
* `PART_NAME`

    word or set of words by which a part is known, addressed, or referred to.
    
* `PART_NUMBER`

    identifier of a particular part design or model.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### PartNumber

particular part design or model.




The value of {{property(PartNumber)}} **MUST** be a `string`.


### PartProcessingState

particular condition of the part occurrence at a specific time.




The value of {{property(PartProcessingState)}} **MUST** be one of the `PartProcessingStateEnum` enumeration. 

`PartProcessingStateEnum` Enumeration:


* `NEEDS_PROCESSING` 

    part occurrence is not actively being processed, but the processing has not ended. 
    
    Processing requirements exist that have not yet been fulfilled. This is the default entry state when the part occurrence is originally received. In some cases, the part occurrence may return to this state while it waits for additional processing to be performed.

* `IN_PROCESS` 

    part occurrence is actively being processed.

* `PROCESSING_ENDED` 

    part occurrence is no longer being processed. 
    
    A general state when the reason for termination is unknown.

* `PROCESSING_ENDED_COMPLETE` 

    part occurrence has completed processing successfully.

* `PROCESSING_ENDED_STOPPED` 

    process has been stopped during the processing. 
    
    The part occurrence will require special treatment.

* `PROCESSING_ENDED_ABORTED` 

    processing of the part occurrence has come to a premature end.

* `PROCESSING_ENDED_LOST` 

    terminal state when the part occurrence has been removed from the equipment by an external entity and it no longer exists at the equipment.

* `PROCESSING_ENDED_SKIPPED` 

    part occurrence has been skipped for processing on the piece of equipment.

* `PROCESSING_ENDED_REJECTED` 

    part occurrence has been processed completely. However, the processing may have a problem.

* `WAITING_FOR_TRANSIT` 

    part occurrence is waiting for transit.

* `IN_TRANSIT` 

    part occurrence is being transported to its destination.

* `TRANSIT_COMPLETE` 

    part occurrence has been placed at its designated destination.

### PartStatus

state or condition of a part.

If unique identifier is given, part status is for that individual. If group identifier is given without a unique identifier, then the status is assumed to be for the whole group.


The value of {{property(PartStatus)}} **MUST** be one of the `PartStatusEnum` enumeration. 

`PartStatusEnum` Enumeration:


* `PASS` 

    part conforms to given requirements.

* `FAIL` 

    part does not conform to some given requirements.

### PartUniqueId

identifier given to a distinguishable, individual part. 

If no {{property(subType)}} is specified, `UUID` is default.


The value of {{property(PartUniqueId)}} **MUST** be a `string`.


#### Subtypes of PartUniqueId

* `RAW_MATERIAL`

    material that is used to produce parts.
    
* `SERIAL_NUMBER`

    serial number that uniquely identifies a specific part.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### PathFeedrateOverride

value of a signal or calculation issued to adjust the feedrate for the axes associated with a {{block(Path)}} component that may represent a single axis or the coordinated movement of multiple axes.




The value of {{property(PathFeedrateOverride)}} **MUST** be a `float`.

#### Subtypes of PathFeedrateOverride

* `JOG`

    feedrate of the axes associated with a `Path` component when the axes, or a single axis, are being operated in a manual mode or method (jogging).
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### PathMode

describes the operational relationship between a {{block(Path)}} entity and another {{block(Path)}} entity for pieces of equipment comprised of multiple logical groupings of controlled axes or other logical operations.




The value of {{property(PathMode)}} **MUST** be one of the `PathModeEnum` enumeration. 

`PathModeEnum` Enumeration:


* `INDEPENDENT` 

    path is operating independently and without the influence of another path.

* `MASTER` 

    path provides information or state values that influences the operation of other {{block(DataItem)}} of similar type.

* `SYNCHRONOUS` 

    physical or logical parts which are not physically connected to each other but are operating together.

* `MIRROR` 

    axes associated with the path are mirroring the motion of the `MASTER` path.

### PowerState

indication of the status of the source of energy for an entity to allow it to perform its intended function or the state of an enabling signal providing permission for the entity to perform its functions.




The value of {{property(PowerState)}} **MUST** be one of the `PowerStateEnum` enumeration. 

`PowerStateEnum` Enumeration:


* `ON` 

    source of energy for an entity or the enabling signal providing permission for the entity to perform its function(s) is present and active.

* `OFF` 

    source of energy for an entity or the enabling signal providing permission for the entity to perform its function(s) is not present or is disconnected.

#### Subtypes of PowerState

* `CONTROL`

    state of the enabling signal or control logic that enables or disables the function or operation of the entity.
    
* `LINE`

    state of the power source for the entity.
    

### PowerStatus

status of the {{block(Component)}}.

**DEPRECATED** in *Version 1.1.0*.




The value of {{property(PowerStatus)}} **MUST** be a `string`.


### ProcessAggregateId

identifier given to link the individual occurrence to a group of related occurrences, such as a process step in a process plan.




The value of {{property(ProcessAggregateId)}} **MUST** be a `string`.


#### Subtypes of ProcessAggregateId

* `ORDER_NUMBER`

    identifier of the authorization of the process occurrence. Synonyms include "job id", "work order".
    
* `PROCESS_PLAN`

    identifier of the process plan that this occurrence belongs to. Synonyms include "routing id", "job id".
    
* `PROCESS_STEP`

    identifier of the step in the process plan that this occurrence corresponds to. Synonyms include "operation id".
    

### ProcessKindId

identifier given to link the individual occurrence to a class of processes or process definition.




The value of {{property(ProcessKindId)}} **MUST** be a `string`.


#### Subtypes of ProcessKindId

* `ISO_STEP_EXECUTABLE`

    reference to a ISO 10303 Executable.
    
* `PROCESS_NAME`

    word or set of words by which a process being executed (process occurrence) by the device is known, addressed, or referred to.
    
* `UUID`

    universally unique identifier as specified in ISO 11578 or RFC 4122.
    

### ProcessOccurrenceId

identifier of a process being executed by the device.




The value of {{property(ProcessOccurrenceId)}} **MUST** be a `string`.


### ProcessState

particular condition of the process occurrence at a specific time.




The value of {{property(ProcessState)}} **MUST** be one of the `ProcessStateEnum` enumeration. 

`ProcessStateEnum` Enumeration:


* `INITIALIZING` 

    device is preparing to execute the process occurrence.

* `READY` 

    process occurrence is ready to be executed.

* `ACTIVE` 

    process occurrence is actively executing.

* `COMPLETE` 

    process occurrence is now finished.

* `INTERRUPTED` 

    process occurrence has been stopped and may be resumed.

* `ABORTED` 

    process occurrence has come to a premature end and cannot be resumed.

### ProcessTime

time and date associated with an activity or event.




The value of {{property(ProcessTime)}} **MUST** be a `string`.


#### Subtypes of ProcessTime

* `COMPLETE`

    time and date associated with the completion of an activity or event.
    
* `START`

    boundary when an activity or an event commences.
    
* `TARGET_COMPLETION`

    projected time and date associated with the end or completion of an activity or event.
    

### Program

name of the logic or motion program being executed by the {{block(Controller)}} component.




The value of {{property(Program)}} **MUST** be a `string`.


### ProgramComment

comment or non-executable statement in the control program.




The value of {{property(ProgramComment)}} **MUST** be a `string`.


### ProgramEdit

indication of the status of the {{block(Controller)}} components program editing mode.

A program may be edited while another is executed.




The value of {{property(ProgramEdit)}} **MUST** be one of the `ProgramEditEnum` enumeration. 

`ProgramEditEnum` Enumeration:


* `ACTIVE` 

    {{block(Controller)}} is in the program edit mode.

* `READY` 

    {{block(Controller)}} is capable of entering the program edit mode and no function is inhibiting a change to that mode.

* `NOT_READY` 

    {{block(Controller)}} is being inhibited by a function from entering the program edit mode.

### ProgramEditName

name of the program being edited. 

This is used in conjunction with {{block(ProgramEdit)}} when in `ACTIVE` state. 




The value of {{property(ProgramEditName)}} **MUST** be a `string`.


### ProgramHeader

non-executable header section of the control program.




The value of {{property(ProgramHeader)}} **MUST** be a `string`.


#### Subtypes of ProgramHeader

* `ACTIVE`

    identity of the logic or motion program currently executing.
    
* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.
    
* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.
    

### ProgramLocation

{{term(URI)}} for the source file associated with {{block(Program)}}.




The value of {{property(ProgramLocation)}} **MUST** be a `string`.


#### Subtypes of ProgramLocation

* `ACTIVE`

    identity of the logic or motion program currently executing.
    
* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.
    
* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.
    

### ProgramLocationType

defines whether the logic or motion program defined by {{block(Program)}} is being executed from the local memory of the controller or from an outside source.




The value of {{property(ProgramLocationType)}} **MUST** be a `string`.


#### Subtypes of ProgramLocationType

* `ACTIVE`

    identity of the logic or motion program currently executing.
    
* `MAIN`

    identity of the primary logic or motion program currently being executed. 
    
    It is the starting nest level in a call structure and may contain calls to sub programs.
    
* `SCHEDULE`

    identity of a control program that is used to specify the order of execution of other programs.
    

### ProgramNestLevel

indication of the nesting level within a control program that is associated with the code or instructions that is currently being executed.

If an initial value is not defined, the nesting level associated with the highest or initial nesting level of the program **MUST** default to zero (0).



The value of {{property(ProgramNestLevel)}} **MUST** be a `integer`.

### RotaryMode

current operating mode for a {{block(Rotary)}} type axis.




The value of {{property(RotaryMode)}} **MUST** be one of the `RotaryModeEnum` enumeration. 

`RotaryModeEnum` Enumeration:


* `SPINDLE` 

    axis is functioning as a spindle.

* `INDEX` 

    axis is configured to index.

* `CONTOUR` 

    position of the axis is being interpolated.

### RotaryVelocityOverride

percentage change to the velocity of the programmed velocity for a {{block(Rotary)}} axis.

This command represents a percentage change to the velocity calculated by a logic or motion program or set by a switch for a {{block(Rotary)}} type axis.


The value of {{property(RotaryVelocityOverride)}} **MUST** be a `float`.

### Rotation

three space angular rotation relative to a coordinate system.




The {{property(units)}} of {{property(Rotation)}} **MUST** be `DEGREE_3D`.

### SensorAttachment

{{term(attachment)}} between a sensor and an entity.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `SensorAttachmentResult` keys.

`SensorAttachmentResult` keys:

* `SENSOR_ID` 

    The identity of a sensor used to observe some measurement of an item.
    The value of `SENSOR_ID` **MUST** be a `string`.


* `result` 

    
    The value of `result` **MUST** be a `string`.


### SerialNumber

serial number that uniquely identifies a specific part.




The value of {{property(SerialNumber)}} **MUST** be a `string`.


### SpecificationLimit

set of limits defining a range of values designating acceptable performance for a variable.




The {{block(Entry)}} {{property(key)}} **MUST** be one or more from the `SpecificationLimitResult` keys.

`SpecificationLimitResult` keys:

* `UPPER_LIMIT` 

    upper conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `UPPER_LIMIT` **MUST** be a `float`.


* `NOMINAL` 

    ideal or desired value for a variable.
    The value of `NOMINAL` **MUST** be a `float`.


* `LOWER_LIMIT` 

    lower conformance boundary for a variable.
    
    > Note: immediate concern or action may be required.
    
    
    The value of `LOWER_LIMIT` **MUST** be a `float`.


### SpindleInterlock

indication of the status of the spindle for a piece of equipment when power has been removed and it is free to rotate.




The value of {{property(SpindleInterlock)}} **MUST** be one of the `SpindleInterlockEnum` enumeration. 

`SpindleInterlockEnum` Enumeration:


* `ACTIVE` 

    power has been removed and the spindle cannot be operated.

* `INACTIVE` 

    spindle has not been deactivated.

### ToolAssetId

identifier of an individual tool asset.




The value of {{property(ToolAssetId)}} **MUST** be a `string`.


### ToolGroup

identifier for the tool group associated with a specific tool. Commonly used to designate spare tools.




The value of {{property(ToolGroup)}} **MUST** be a `string`.


### ToolId

identifier of the tool currently in use for a given `Path`.

**DEPRECATED** in *Version 1.2.0*.   See `TOOL_ASSET_ID`.




The value of {{property(ToolId)}} **MUST** be a `string`.


### ToolNumber

identifier assigned by the {{block(Controller)}} component to a cutting tool when in use by a piece of equipment.




The value of {{property(ToolNumber)}} **MUST** be a `string`.


### ToolOffset

reference to the tool offset variables applied to the active cutting tool associated with a {{block(Path)}} in a {{block(Controller)}} type component.




The value of {{property(ToolOffset)}} **MUST** be a `float`.

#### Subtypes of ToolOffset

* `LENGTH`

    reference to a length type tool offset variable.
    
* `RADIAL`

    reference to a radial type tool offset variable.
    

### TransferCount

accumulation of the number of times an operation has attempted to, or is planned to attempt to, transfer materials, parts, or other items from one location to another.




The value of {{property(TransferCount)}} **MUST** be a `string`.


#### Subtypes of TransferCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### Translation

three space linear translation relative to a coordinate system.




The {{property(units)}} of {{property(Translation)}} **MUST** be `MILLIMETER_3D`.

### UnloadCount

accumulation of the number of times an operation has attempted to, or is planned to attempt to, unload materials, parts, or other items.




The value of {{property(UnloadCount)}} **MUST** be a `string`.


#### Subtypes of UnloadCount

* `ABORTED`

    accumulation of actions or activities that were attempted, but terminated before they could be completed.
    
* `ALL`

    accumulation of all actions, items, or activities being counted independent of the outcome.
    
* `BAD`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `COMPLETE`

    accumulation of actions, items, or activities that have been completed, independent of the outcome.
    
* `FAILED`

    accumulation of actions, items, or activities being counted that do not conform to specification or expectation.
    
* `GOOD`

    accumulation of actions, items, or activities being counted that conform to specification or expectation.
    
* `REMAINING`

    accumulation of actions, items, or activities yet to be counted.
    
* `TARGET`

    goal of the operation or process.
    

### User

identifier of the person currently responsible for operating the piece of equipment.




The value of {{property(User)}} **MUST** be a `string`.


#### Subtypes of User

* `MAINTENANCE`

    identifier of the person currently responsible for performing maintenance on the piece of equipment.
    
* `OPERATOR`

    identifier of the person currently responsible for operating the piece of equipment.
    
* `SET_UP`

    identifier of the person currently responsible for preparing a piece of equipment for production or restoring the piece of equipment to a neutral state after production.
    

### ValveState

state of a valve is one of open, closed, or transitioning between the states.




The value of {{property(ValveState)}} **MUST** be one of the `ValveStateEnum` enumeration. 

`ValveStateEnum` Enumeration:


* `OPEN` 

    {{block(ValveState)}} where flow is allowed and the aperture is static.
    
    > Note: For a binary value, `OPEN` indicates the valve has the maximum possible aperture.

* `OPENING` 

    valve is transitioning from a `CLOSED` state to an `OPEN` state.

* `CLOSED` 

    {{block(ValveState)}} where flow is not possible, the aperture is static, and the valve is completely shut.

* `CLOSING` 

    valve is transitioning from an `OPEN` state to a `CLOSED` state.

#### Subtypes of ValveState

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
    
    

### Variable

data whose meaning may change over time due to changes in the operation of a piece of equipment or the process being executed on that piece of equipment.




The value of {{property(Variable)}} **MUST** be a `string`.


### WaitState

indication of the reason that {{block(Execution)}} is reporting a value of `WAIT`.




The value of {{property(WaitState)}} **MUST** be one of the `WaitStateEnum` enumeration. 

`WaitStateEnum` Enumeration:


* `POWERING_UP` 

    execution is waiting while the equipment is powering up and is not currently available to begin producing parts or products.

* `POWERING_DOWN` 

    execution is waiting while the equipment is powering down but has not fully reached a stopped state.

* `PART_LOAD` 

    execution is waiting while one or more discrete workpieces are being loaded.

* `PART_UNLOAD` 

    execution is waiting while one or more discrete workpieces are being unloaded.

* `TOOL_LOAD` 

    execution is waiting while a tool or tooling is being loaded.

* `TOOL_UNLOAD` 

    execution is waiting while a tool or tooling is being unloaded.

* `MATERIAL_LOAD` 

    execution is waiting while material is being loaded.

* `MATERIAL_UNLOAD` 

    execution is waiting while material is being unloaded.

* `SECONDARY_PROCESS` 

    execution is waiting while another process is completed before the execution can resume.

* `PAUSING` 

    execution is waiting while the equipment is pausing but the piece of equipment has not yet reached a fully paused state.

* `RESUMING` 

    execution is waiting while the equipment is resuming the production cycle but has not yet resumed execution.

### Wire

identifier for the type of wire used as the cutting mechanism in Electrical Discharge Machining or similar processes.




The value of {{property(Wire)}} **MUST** be a `string`.


### WorkOffset

offset variables for a work piece or part associated with a {{block(Path)}} in a {{block(Controller)}} type component.




The value of {{property(WorkOffset)}} **MUST** be a `float`.

### WorkholdingId

identifier for the current workholding or part clamp in use by a piece of equipment.




The value of {{property(WorkholdingId)}} **MUST** be a `string`.




## Sample Types

This section provides semantic information for {{block(Sample)}} types.

### Acceleration

positive rate of change of velocity.




The {{property(units)}} of {{property(Acceleration)}} **MUST** be `MILLIMETER/SECOND^2`.

#### Subtypes of Acceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AccumulatedTime

accumulated time for an activity or event.




The {{property(units)}} of {{property(AccumulatedTime)}} **MUST** be `SECOND`.

### Amperage

strength of electrical current.

**DEPRECATED** in *Version 1.6*. Replaced by `AMPERAGE_AC` and `AMPERAGE_DC`.




The {{property(units)}} of {{property(Amperage)}} **MUST** be `AMPERE`.

#### Subtypes of Amperage

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `ALTERNATING`

    measurement of alternating voltage or current. 
    
    If not specified further in statistic, defaults to RMS voltage. 
    
* `DIRECT`

    measurement of DC current or voltage.
    
* `TARGET`

    goal of the operation or process.
    

### AmperageAC

electrical current that reverses direction at regular short intervals.




The {{property(units)}} of {{property(AmperageAC)}} **MUST** be `AMPERE`.

#### Subtypes of AmperageAC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AmperageDC

electric current flowing in one direction only.




The {{property(units)}} of {{property(AmperageDC)}} **MUST** be `AMPERE`.

#### Subtypes of AmperageDC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### Angle

angular position.




The {{property(units)}} of {{property(Angle)}} **MUST** be `DEGREE`.

#### Subtypes of Angle

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### AngularAcceleration

positive rate of change of angular velocity.




The {{property(units)}} of {{property(AngularAcceleration)}} **MUST** be `DEGREE/SECOND^2`.

#### Subtypes of AngularAcceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AngularDeceleration

negative rate of change of angular velocity.




The {{property(units)}} of {{property(AngularDeceleration)}} **MUST** be `DEGREE/SECOND^2`.

#### Subtypes of AngularDeceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AngularVelocity

rate of change of angular position.




The {{property(units)}} of {{property(AngularVelocity)}} **MUST** be `DEGREE/SECOND`.

### AssetUpdateRate

average rate of change of values for assets in the MTConnect streams. 

The average is computed over a rolling window defined by the implementation.




The {{property(units)}} of {{property(AssetUpdateRate)}} **MUST** be `COUNT/SECOND`.

### AxisFeedrate

feedrate of a linear axis.




The {{property(units)}} of {{property(AxisFeedrate)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of AxisFeedrate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `JOG`

    feedrate specified by a logic or motion program, by a pre-set value, or set by a switch as the feedrate for the {{block(Axis)}}. 
    
* `OVERRIDE`

    operator's overridden value.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### CapacityFluid

fluid capacity of an object or container.




The {{property(units)}} of {{property(CapacityFluid)}} **MUST** be `MILLILITER`.

### CapacitySpatial

geometric capacity of an object or container.




The {{property(units)}} of {{property(CapacitySpatial)}} **MUST** be `CUBIC_MILLIMETER`.

### ClockTime

time provided by a timing device at a specific point in time.




The {{property(units)}} of {{property(ClockTime)}} **MUST** be `yyyy-mm-ddthh:mm:ss.ffff`.

### Concentration

percentage of one component within a mixture of components.




The {{property(units)}} of {{property(Concentration)}} **MUST** be `PERCENT`.

### Conductivity

ability of a material to conduct electricity.




The {{property(units)}} of {{property(Conductivity)}} **MUST** be `SIEMENS/METER`.

### CuttingSpeed

speed difference (relative velocity) between the cutting mechanism and the surface of the workpiece it is operating on.




The {{property(units)}} of {{property(CuttingSpeed)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of CuttingSpeed

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### Deceleration

negative rate of change of velocity.




The {{property(units)}} of {{property(Deceleration)}} **MUST** be `MILLIMETER/SECOND^2`.

#### Subtypes of Deceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### Density

volumetric mass of a material per unit volume of that material.




The {{property(units)}} of {{property(Density)}} **MUST** be `MILLIGRAM/CUBIC_MILLIMETER`.

### DepositionAccelerationVolumetric

rate of change in spatial volume of material deposited in an additive manufacturing process.

The rate of change in spatial volume of material deposited in an additive manufacturing process.


The {{property(units)}} of {{property(DepositionAccelerationVolumetric)}} **MUST** be `CUBIC_MILLIMETER/SECOND^2`.

#### Subtypes of DepositionAccelerationVolumetric

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionDensity

density of the material deposited in an additive manufacturing process per unit of volume.




The {{property(units)}} of {{property(DepositionDensity)}} **MUST** be `MILLIGRAM/CUBIC_MILLIMETER`.

#### Subtypes of DepositionDensity

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionMass

mass of the material deposited in an additive manufacturing process.




The {{property(units)}} of {{property(DepositionMass)}} **MUST** be `MILLIGRAM`.

#### Subtypes of DepositionMass

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionRateVolumetric

rate at which a spatial volume of material is deposited in an additive manufacturing process.




The {{property(units)}} of {{property(DepositionRateVolumetric)}} **MUST** be `CUBIC_MILLIMETER/SECOND`.

#### Subtypes of DepositionRateVolumetric

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionVolume

spatial volume of material to be deposited in an additive manufacturing process.




The {{property(units)}} of {{property(DepositionVolume)}} **MUST** be `CUBIC_MILLIMETER`.

#### Subtypes of DepositionVolume

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### Diameter

dimension of a diameter.




The {{property(units)}} of {{property(Diameter)}} **MUST** be `MILLIMETER`.

### Displacement

change in position of an object.




The {{property(units)}} of {{property(Displacement)}} **MUST** be `MILLIMETER`.

### ElectricalEnergy

{{block(Wattage)}} used or generated by a component over an interval of time.




The {{property(units)}} of {{property(ElectricalEnergy)}} **MUST** be `WATT_SECOND`.

### EquipmentTimer

amount of time a piece of equipment or a sub-part of a piece of equipment has performed specific activities.




The {{property(units)}} of {{property(EquipmentTimer)}} **MUST** be `SECOND`.

#### Subtypes of EquipmentTimer

* `DELAY`

    elapsed time of a temporary halt of action.
    
* `LOADED`

    time that the sub-parts of a piece of equipment are under load.
    
    Example: For traditional machine tools, this is a measurement of the time that the cutting tool is assumed to be engaged with the part.
    
* `OPERATING`

    time that the major sub-parts of a piece of equipment are powered or performing any activity whether producing a part or product or not.
    
    Example: For traditional machine tools, this includes `WORKING`, plus idle time.
    
* `POWERED`

    time that primary power is applied to the piece of equipment and, as a minimum, the controller or logic portion of the piece of equipment is powered and functioning or components that are required to remain on are powered.
    
    Example: Heaters for an extrusion machine that are required to be powered even when the equipment is turned off.
    
* `WORKING`

    time that a piece of equipment is performing any activity the equipment is active and performing a function under load or not.
    
    Example: For traditional machine tools, this includes `LOADED`, plus rapid moves, tool changes, etc.
    

### FillLevel

amount of a substance remaining compared to the planned maximum amount of that substance.




The {{property(units)}} of {{property(FillLevel)}} **MUST** be `PERCENT`.

### Flow

rate of flow of a fluid.




The {{property(units)}} of {{property(Flow)}} **MUST** be `LITER/SECOND`.

### Frequency

number of occurrences of a repeating event per unit time.




The {{property(units)}} of {{property(Frequency)}} **MUST** be `HERTZ`.

### GlobalPosition

**DEPRECATED** in Version 1.1.




The {{property(units)}} of {{property(GlobalPosition)}} **MUST** be `MILLIMETER`.

### HumidityAbsolute

amount of water vapor expressed in grams per cubic meter.




The {{property(units)}} of {{property(HumidityAbsolute)}} **MUST** be `GRAM/CUBIC_METER`.

#### Subtypes of HumidityAbsolute

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### HumidityRelative

amount of water vapor present expressed as a percent to reach saturation at the same temperature.




The {{property(units)}} of {{property(HumidityRelative)}} **MUST** be `PERCENT`.

#### Subtypes of HumidityRelative

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### HumiditySpecific

ratio of the water vapor present over the total weight of the water vapor and air present expressed as a percent.




The {{property(units)}} of {{property(HumiditySpecific)}} **MUST** be `PERCENT`.

#### Subtypes of HumiditySpecific

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### Length

reference to a length type tool offset variable.




The {{property(units)}} of {{property(Length)}} **MUST** be `MILLIMETER`.

#### Subtypes of Length

* `REMAINING`

    remaining total length of an object.
    
* `STANDARD`

    standard or original length of an object.
    
* `USEABLE`

    remaining usable length of an object.
    

### Level

level of a resource.

**DEPRECATED** in *Version 1.2*.  See `FILL_LEVEL`.




The {{property(units)}} of {{property(Level)}} **MUST** be `PERCENT`.

### LinearForce

{{term(force)}} applied to a mass in one direction only.




The {{property(units)}} of {{property(LinearForce)}} **MUST** be `NEWTON`.

### Load

actual versus the standard rating of a piece of equipment.




The {{property(units)}} of {{property(Load)}} **MUST** be `PERCENT`.

### Mass

mass of an object(s) or an amount of material.




The {{property(units)}} of {{property(Mass)}} **MUST** be `KILOGRAM`.

### ObservationUpdateRate

average rate of change of values for data items in the MTConnect streams. The average is computed over a rolling window defined by the implementation.




The {{property(units)}} of {{property(ObservationUpdateRate)}} **MUST** be `COUNT/SECOND`.

### Orientation

measured or calculated orientation of a plane or vector relative to a cartesian coordinate system.




The {{property(units)}} of {{property(Orientation)}} **MUST** be `DEGREE_3D`.

#### Subtypes of Orientation

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### PH

acidity or alkalinity of a solution.




The {{property(units)}} of {{property(PH)}} **MUST** be `PH`.

### PathFeedrate

feedrate for the axes, or a single axis, associated with a {{block(Path)}} component.




The {{property(units)}} of {{property(PathFeedrate)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of PathFeedrate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `JOG`

    feedrate specified by a logic or motion program, by a pre-set value, or set by
    a switch as the feedrate for the axes, or a single axis, associated with a `Path`
    when operating in a manual state or method (jogging).
    
* `OVERRIDE`

    operator's overridden value.
    
    **DEPRECATED** in *Version 1.3*.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### PathFeedratePerRevolution

feedrate for the axes, or a single axis.




The {{property(units)}} of {{property(PathFeedratePerRevolution)}} **MUST** be `MILLIMETER/REVOLUTION`.

#### Subtypes of PathFeedratePerRevolution

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### PathPosition

measured or calculated position of a control point associated with a {{block(Controller)}} entity, or {{block(Path)}} entity if provided, of a piece of equipment.




The {{property(units)}} of {{property(PathPosition)}} **MUST** be `MILLIMETER_3D`.

#### Subtypes of PathPosition

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROBE`

    position provided by a measurement probe.
    
    **DEPRECATION WARNING**: May be deprecated in the future.
    
* `TARGET`

    goal of the operation or process.
    

### Position

measured or calculated position of a {{block(Component)}} element as reported by a piece of equipment.




The {{property(units)}} of {{property(Position)}} **MUST** be `MILLIMETER`.

#### Subtypes of Position

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    
* `TARGET`

    goal of the operation or process.
    

### PowerFactor

ratio of real power flowing to a load to the apparent power in that AC circuit.




The {{property(units)}} of {{property(PowerFactor)}} **MUST** be `PERCENT`.

### Pressure

force per unit area measured relative to atmospheric pressure. 

Commonly referred to as gauge pressure.




The {{property(units)}} of {{property(Pressure)}} **MUST** be `PASCAL`.

### PressureAbsolute

force per unit area measured relative to a vacuum.

The force per unit area measured relative to a vacuum.


The {{property(units)}} of {{property(PressureAbsolute)}} **MUST** be `PASCAL`.

### PressurizationRate

change of pressure per unit time.




The {{property(units)}} of {{property(PressurizationRate)}} **MUST** be `PASCAL/SECOND`.

#### Subtypes of PressurizationRate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### ProcessTimer

amount of time a piece of equipment has performed different types of activities associated with the process being performed at that piece of equipment.




The {{property(units)}} of {{property(ProcessTimer)}} **MUST** be `SECOND`.

#### Subtypes of ProcessTimer

* `DELAY`

    elapsed time of a temporary halt of action.
    
* `PROCESS`

    time from the beginning of production of a part or product on a piece of equipment until the time that production is complete for that part or product on
    that piece of equipment.
    
    This includes the time that the piece of equipment is running, producing parts or products, or in the process of producing parts.
    

### Resistance

degree to which a substance opposes the passage of an electric current.




The {{property(units)}} of {{property(Resistance)}} **MUST** be `OHM`.

### RotaryVelocity

rotational speed of a rotary axis.




The {{property(units)}} of {{property(RotaryVelocity)}} **MUST** be `REVOLUTION/MINUTE`.

#### Subtypes of RotaryVelocity

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `OVERRIDE`

    The operators overridden value.
    
    
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### SoundLevel

sound level or sound pressure level relative to atmospheric pressure.




The {{property(units)}} of {{property(SoundLevel)}} **MUST** be `DECIBEL`.

#### Subtypes of SoundLevel

* `A_SCALE`

    A Scale weighting factor.   This is the default weighting factor if no factor is specified
    
* `B_SCALE`

    B Scale weighting factor
    
* `C_SCALE`

    C Scale weighting factor
    
* `D_SCALE`

    D Scale weighting factor
    
* `NO_SCALE`

    No weighting factor on the frequency scale
    

### SpindleSpeed

rotational speed of the rotary axis.

**DEPRECATED** in *Version 1.2*.  Replaced by `ROTARY_VELOCITY`.




The {{property(units)}} of {{property(SpindleSpeed)}} **MUST** be `REVOLUTION/MINUTE`.

#### Subtypes of SpindleSpeed

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `OVERRIDE`

    operator's overridden value.
    
    **DEPRECATED** in *Version 1.3*.
    

### Strain

amount of deformation per unit length of an object when a load is applied.




The {{property(units)}} of {{property(Strain)}} **MUST** be `PERCENT`.

### Temperature

degree of hotness or coldness measured on a definite scale.




The {{property(units)}} of {{property(Temperature)}} **MUST** be `CELSIUS`.

### Tension

force that stretches or elongates an object.




The {{property(units)}} of {{property(Tension)}} **MUST** be `NEWTON`.

### Tilt

angular displacement.




The {{property(units)}} of {{property(Tilt)}} **MUST** be `MICRO_RADIAN`.

### Torque

turning force exerted on an object or by an object.




The {{property(units)}} of {{property(Torque)}} **MUST** be `NEWTON_METER`.

### ValvePosition

percentage open of a value where 100% is fully open and 0% is fully closed.

Correlation with {{block(ValveState)}}:

* If the value is in a fixed state and is not 0%, then it is `OPEN`.
* If the valve is transitioning from `OPEN` to `CLOSED`, then it is `CLOSING`.
* If the valve is transitioning from `CLOSED` to `OPEN`, then it is `OPENING`.
* If the valve is in a fixed state and is 0%, then it is `CLOSED`.


The {{property(units)}} of {{property(ValvePosition)}} **MUST** be `PERCENT`.

### Velocity

rate of change of position of a {{block(Component)}}.




The {{property(units)}} of {{property(Velocity)}} **MUST** be `MILLIMETER/SECOND`.

### Viscosity

fluid's resistance to flow.




The {{property(units)}} of {{property(Viscosity)}} **MUST** be `PASCAL_SECOND`.

### VoltAmpere

apparent power in an electrical circuit, equal to the product of root-mean-square (RMS) voltage and RMS current (commonly referred to as VA).




The {{property(units)}} of {{property(VoltAmpere)}} **MUST** be `VOLT_AMPERE`.

### VoltAmpereReactive

reactive power in an AC electrical circuit (commonly referred to as VAR).




The {{property(units)}} of {{property(VoltAmpereReactive)}} **MUST** be `VOLT_AMPERE_REACTIVE`.

### Voltage

electrical potential between two points.

**DEPRECATED** in *Version 1.6*. Replaced by `VOLTAGE_AC` and `VOLTAGE_DC`.




The {{property(units)}} of {{property(Voltage)}} **MUST** be `VOLT`.

#### Subtypes of Voltage

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `ALTERNATING`

    alternating voltage or current. 
    
    If not specified further in statistic, defaults to RMS voltage. 
    
* `DIRECT`

    DC current or voltage.
    
* `TARGET`

    goal of the operation or process.
    

### VoltageAC

electrical potential between two points in an electrical circuit in which the current periodically reverses direction.




The {{property(units)}} of {{property(VoltageAC)}} **MUST** be `VOLT`.

#### Subtypes of VoltageAC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### VoltageDC

electrical potential between two points in an electrical circuit in which the current is unidirectional.




The {{property(units)}} of {{property(VoltageDC)}} **MUST** be `VOLT`.

#### Subtypes of VoltageDC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### VolumeFluid

fluid volume of an object or container.




The {{property(units)}} of {{property(VolumeFluid)}} **MUST** be `MILLILITER`.

#### Subtypes of VolumeFluid

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `CONSUMED`

    reported or measured value of the amount used in the manufacturing process.
    
* `ENDED`

    boundary when an activity or an event terminates.
    
* `PART`

    reported or measured value of amount included in the {{term(part)}}.
    
* `START`

    boundary when an activity or an event commences.
    
* `WASTE`

    reported or measured value of the amount discarded.
    

### VolumeSpatial

geometric volume of an object or container.




The {{property(units)}} of {{property(VolumeSpatial)}} **MUST** be `CUBIC_MILLIMETER`.

#### Subtypes of VolumeSpatial

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `CONSUMED`

    reported or measured value of the amount used in the manufacturing process.
    
* `ENDED`

    boundary when an activity or an event terminates.
    
* `PART`

    reported or measured value of amount included in the {{term(part)}}.
    
* `START`

    boundary when an activity or an event commences.
    
* `WASTE`

    reported or measured value of the amount discarded
    

### Wattage

power flowing through or dissipated by an electrical circuit or piece of equipment.




The {{property(units)}} of {{property(Wattage)}} **MUST** be `WATT`.

#### Subtypes of Wattage

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
* `TARGET`

    goal of the operation or process.
    

### XDimension

dimension of an entity relative to the X direction of the referenced coordinate system.




The {{property(units)}} of {{property(XDimension)}} **MUST** be `MILLIMETER`.

### YDimension

dimension of an entity relative to the Y direction of the referenced coordinate system.




The {{property(units)}} of {{property(YDimension)}} **MUST** be `MILLIMETER`.

### ZDimension

dimension of an entity relative to the Z direction of the referenced coordinate system.




The {{property(units)}} of {{property(ZDimension)}} **MUST** be `MILLIMETER`.




# MTConnect Profile

MTConnect Profile is a {{term(profile)}} that extends the {{term(SysML)}} metamodel for the MTConnect domain using additional data types and {{termplural(stereotype)}}.

## Data Types

![Data Types](figures/Data%20Types.png "Data Types")

### boolean

primitive type.


### ID

string that represents an {{term(ID)}}.


### string

primitive type.


### float

primitive type.


### dateTime

string that represents timestamp in ISO 8601 format.


### integer

primitive type.


### xlinktype

string that represents the type of an XLink element. See {{url(https://www.w3.org/TR/xlink11/)}}.


### xslang

string that represents a language tag. See {{url(http://www.ietf.org/rfc/rfc4646.txt)}}.


### IDREF

string that represents a reference to an `ID`.


### xlinkhref

string that represents the locator attribute of an XLink element. See {{url(https://www.w3.org/TR/xlink11/)}}.


### x509

string that represents an `x509` data block. {{cite(ISO/IEC 9594-8:2020)}}.


### int32

32-bit integer.


### int64

64-bit integer.


### version

series of four numeric values, separated by a decimal point, representing a {{term(major)}}, {{term(minor)}}, and {{term(revision)}} number of the MTConnect Standard and the revision number of a specific {{term(schema)}}.


### uInt32

32-bit unsigned integer.


### uInt64

64-bit unsigned integer.


## Stereotypes

![Stereotypes](figures/Stereotypes.png "Stereotypes")

### deprecated

element that has been deprecated.


### extensible

enumeration that can be extended.


### organizer

element that {{termplural(organize)}} other elements of a type.



{{appendix()}}
{{section*{Appendices}()}}
{{addcontentsline{toc}{section}{Appendices}()}}
{{renewcommand{\thesubsection}{\Alph{subsection}}()}}

## Bibliography

Engineering Industries Association. EIA Standard - EIA-274-D, Interchangeable Variable, Block Data Format for Positioning, Contouring, and Contouring/Positioning Numerically Controlled Machines. Washington, D.C. 1979.

ISO TC 184/SC4/WG3 N1089. ISO/DIS 10303-238: Industrial automation systems and integration  Product data representation and exchange  Part 238: Application Protocols: Application interpreted model for computerized numerical controllers. Geneva, Switzerland, 2004.

International Organization for Standardization. ISO 14649: Industrial automation systems and integration – Physical device control – Data model for computerized numerical controllers – Part 10: General process data. Geneva, Switzerland, 2004.

International Organization for Standardization. ISO 14649: Industrial automation systems and integration – Physical device control – Data model for computerized numerical controllers – Part 11: Process data for milling. Geneva, Switzerland, 2000.

International Organization for Standardization. ISO 6983/1 – Numerical Control of machines – Program format and definition of address words – Part 1: Data format for positioning, line and contouring control systems. Geneva, Switzerland, 1982.

Electronic Industries Association. ANSI/EIA-494-B-1992, 32 Bit Binary CL (BCL) and 7 Bit ASCII CL (ACL) Exchange Input Format for Numerically Controlled Machines. Washington, D.C. 1992.

National Aerospace Standard. Uniform Cutting Tests - NAS Series: Metal Cutting Equipment Specifications. Washington, D.C. 1969.

International Organization for Standardization. ISO 10303-11: 1994, Industrial automation systems and integration  Product data representation and exchange  Part 11: Description methods: The EXPRESS language reference manual. Geneva, Switzerland, 1994.

International Organization for Standardization. ISO 10303-21: 1996, Industrial automation systems and integration -- Product data representation and exchange -- Part 21: Implementation methods: Clear text encoding of the exchange structure. Geneva, Switzerland, 1996.

H.L. Horton, F.D. Jones, and E. Oberg. Machinery's Handbook. Industrial Press, Inc. New York, 1984.

International Organization for Standardization. ISO 841-2001: Industrial automation systems and integration - Numerical control of machines - Coordinate systems and motion nomenclature. Geneva, Switzerland, 2001.

ASME B5.57: Methods for Performance Evaluation of Computer Numerically Controlled Lathes and Turning Centers, 1998.

ASME/ANSI B5.54: Methods for Performance Evaluation of Computer Numerically Controlled Machining Centers. 2005.

OPC Foundation. OPC Unified Architecture Specification, Part 1: Concepts Version 1.00. July 28, 2006.

IEEE STD 1451.0-2007, Standard for a Smart Transducer Interface for Sensors and Actuators – Common Functions, Communication Protocols, and Transducer Electronic Data Sheet (TEDS) Formats, IEEE Instrumentation and Measurement Society, TC-9, The Institute of Electrical and Electronics Engineers, Inc., New York, N.Y. 10016, SH99684, October 5, 2007.

IEEE STD 1451.4-1994, Standard for a Smart Transducer Interface for Sensors and Actuators – Mixed-Mode Communication Protocols and Transducer Electronic Data Sheet (TEDS) Formats, IEEE Instrumentation and Measurement Society, TC-9, The Institute of Electrical and Electronics Engineers, Inc., New York, N.Y. 10016, SH95225, December 15, 2004. {{newpage()}} 

## XML Schema Diagrams

### Observations Schema Diagrams

![Streams Schema](figures/Streams%20Schema.png "Streams Schema"){: width="0.8"}

![DeviceStream Schema](figures/DeviceStream%20Schema.png "DeviceStream Schema"){: width="0.8"}

![ComponentStream Schema](figures/ComponentStream%20Schema.png "ComponentStream Schema"){: width="0.8"}

![Sample Schema](figures/Sample%20Schema.png "Sample Schema"){: width="0.8"}

![Event Schema](figures/Event%20Schema.png "Event Schema"){: width="0.8"}

![Condition Schema](figures/Condition%20Schema.png "Condition Schema"){: width="0.8"}

### Representation Schema Diagrams

![AbsTimeSeries Schema](figures/AbsTimeSeries%20Schema.png "AbsTimeSeries Schema"){: width="0.8"}

![DataSet Schema](figures/DataSet%20Schema.png "DataSet Schema"){: width="0.8"}

![Entry Schema](figures/Entry%20Schema.png "Entry Schema"){: width="0.8"}

![Table Schema](figures/Table%20Schema.png "Table Schema"){: width="0.8"}

## XML Examples

### DeviceStream Example

~~~~xml
<Streams>
  <DeviceStream name="M12346" uuid="M8010W4194N">
    <ComponentStream component="Device" name="M12346" componentId="d1">
      <Events>
        <Availability dataItemId="avail" sequence="156" timestamp="2021-10-01T14:26:38.668505Z">AVAILABLE</Availability>
        <AssetChanged assetType="CuttingTool" dataItemId="d1_asset_chg" sequence="75570" timestamp="2021-10-07T05:08:53.870206Z">M8010W4194N1.120</AssetChanged>
        <AssetRemoved assetType="CuttingTool" dataItemId="d1_asset_rem" sequence="140" timestamp="2021-10-01T11:40:08.101461Z">UNAVAILABLE</AssetRemoved>
      </Events>
    </ComponentStream>
    <ComponentStream component="Controller" name="controller" componentId="cont">
      <Events>
        <EmergencyStop dataItemId="estop" sequence="159" timestamp="2021-10-01T14:26:38.66869Z">ARMED</EmergencyStop>
      </Events>
      <Samples>
        <AccumulatedTime dataItemId="cut_time" sequence="75437" timestamp="2021-10-07T05:08:28.221704Z">1763070.0</AccumulatedTime>
      </Samples>
      <Condition>
        <Unavailable dataItemId="cont_system" sequence="72" timestamp="2021-10-11T21:04:03.251999Z" type="SYSTEM"/>
        <Warning dataItemId="cont_system" nativecode="313" nativeSeverity="50" sequence="75573" timestamp="2021-10-07T05:08:58.518317Z" type="LOGIC_PROGRAM">PALLET ARM DOWN RS. MALF.</Warning>
      </Condition>
    </ComponentStream>
    <ComponentStream component="Path" name="path" componentId="path1">
      <Events>
        <Execution dataItemId="execution" name="execution" sequence="222623" timestamp="2021-10-12T06:04:32.761198Z">INTERRUPTED</Execution>
        <VariableDataSet count="2" dataItemId="cvars" sequence="126513" timestamp="2021-10-12T03:57:31.106559Z">
          <Entry key="100">66.3314</Entry>
          <Entry key="101">167.2</Entry>
        </VariableDataSet>
        <WorkOffsetTable count="2" dataItemId="woffset" sequence="222101" timestamp="2021-10-12T06:04:11.990531Z">
          <Entry key="G53.1">
            <Cell key="X">1</Cell>
            <Cell key="Y">2</Cell>
            <Cell key="Z">3</Cell>
          </Entry>
          <Entry key="G53.2">
            <Cell key="X">4</Cell>
            <Cell key="Y">5</Cell>
            <Cell key="Z">6</Cell>
          </Entry>
        </WorkOffsetTable>
      </Events>
      <Samples>
        <CuttingSpeed dataItemId="cspeed" sequence="112" timestamp="2021-10-07T05:08:28.221704Z" subType="ACTUAL">UNAVAILABLE</CuttingSpeed>
      </Samples>
      <Condition>
        <Normal dataItemId="path_system" sequence="153" timestamp="2021-10-11T21:04:03.262845Z" type="SYSTEM"/>
      </Condition>
    </ComponentStream>
  </DeviceStream>
</Streams>
~~~~
{: caption="DeviceStream Example"}

### Observations made for DataItem Example

~~~~xml
<Components>
  <Controller id="cont" name="controller">
      <DataItems>
      <DataItem category="EVENT" id="estop" name="estop" type="EMERGENCY_STOP"/>
    </DataItems>
  </Controller>
</Components>
~~~~
{: caption="MTConnectDevices Response Document"}

~~~~xml
<ComponentStream component="Controller" name="controller" componentId="cont">
  <Events>
    <EmergencyStop dataItemId="estop" sequence="159" timestamp="2021-10-01T14:26:38.66869Z">ARMED</EmergencyStop>
  </Events>
</ComponentStream>
~~~~
{: caption="MTConnectStreams Response Document"}

### Sample Example

~~~~xml
<Samples>
  <AccumulatedTime dataItemId="cut_time" sequence="75437" timestamp="2021-10-07T05:08:28.221704Z">1763070.0</AccumulatedTime>
  <CuttingSpeed dataItemId="cspeed" sequence="112" timestamp="2021-10-07T05:08:28.221704Z" subType="ACTUAL">UNAVAILABLE</CuttingSpeed>
</Samples>
~~~~
{: caption="Sample Example"}

### Event Example

~~~~xml
<Events>
  <Availability dataItemId="avail" sequence="156" timestamp="2021-10-01T14:26:38.668505Z">AVAILABLE</Availability>
  <AssetRemoved assetType="CuttingTool" dataItemId="d1_asset_rem" sequence="140" timestamp="2021-10-01T11:40:08.101461Z">UNAVAILABLE</AssetRemoved>
</Events>
~~~~
{: caption="Event Example"}

### Condition Example

{{block(Condition)}} types are represented differently in {{term(XML)}} when compared to {{block(Sample)}} and {{block(Event)}} types. The element name is the {{term(condition state)}} of the {{block(Condition)}} type in Pascal Case. The name of the {{block(Condition)}} type is represented by the attribute `type`.

If the {{term(condition state)}} is unavailable then the element name is represented by `Unavailable`.

~~~~xml
<Condition>
  <Unavailable dataItemId="cont_system" sequence="72" timestamp="2021-10-11T21:04:03.251999Z" type="SYSTEM"/>
  <Normal dataItemId="path_system" sequence="153" timestamp="2021-10-11T21:04:03.262845Z" type="SYSTEM"/>
  <Warning dataItemId="cont_system" nativecode="313" nativeSeverity="50" sequence="75573" timestamp="2021-10-07T05:08:58.518317Z" type="LOGIC_PROGRAM">PALLET ARM DOWN RS. MALF.</Warning>
</Condition>
~~~~
{: caption="Condition Example"}

### DataSet Example

~~~~xml
<Events>
  <VariableDataSet count="2" dataItemId="cvars" sequence="126513" timestamp="2021-10-12T03:57:31.106559Z">
    <Entry key="100">66.3314</Entry>
    <Entry key="101">167.2</Entry>
  </VariableDataSet>
</Events>
~~~~
{: caption="DataSet Example"}

### Table Example

~~~~xml
<Events>
  <WorkOffsetTable count="2" dataItemId="woffset" sequence="222101" timestamp="2021-10-12T06:04:11.990531Z">
    <Entry key="G53.1">
      <Cell key="X">1</Cell>
      <Cell key="Y">2</Cell>
      <Cell key="Z">3</Cell>
    </Entry>
    <Entry key="G53.2">
      <Cell key="X">4</Cell>
      <Cell key="Y">5</Cell>
      <Cell key="Z">6</Cell>
    </Entry>
  </WorkOffsetTable>
</Events>
~~~~
{: caption="Table Example"}