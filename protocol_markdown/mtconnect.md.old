# MTConnect Standard 
 {#mtconnect-standard}

The MTConnect Standard is organized in a series of documents (also referred to as MTConnect Documents) that each address a specific set of requirements defined by the Standard.   Each MTConnect Document will be referred to as a Part of the Standard; e.g., {{latex(\citetitle{MTCPart1})}}.  Together, these documents describe the {{term(base functional structure)}} specified in the MTConnect Standard.  

Implementation of any manufacturing data management system may utilize information from any number of these documents.  However, it is not necessary to realize all information contained in these documents for any one specific implementation.

## MTConnect Documents Organization

The MTConnect specification is organized into the following documents:

{{latex(\citetitle{MTCPart1})}}:  Provides an overview of the MTConnect Standard and defines the terminology and structure used throughout all documents associated with the Standard.  Additionally, {{cite(MTCPart1)}} describes the functions provided by an {{term(agent)}} and the protocol used to communicate with an {{term(agent)}}.

{{latex(\citetitle{MTCPart2})}}:  Defines the {{term(semantic data model)}} that describes the data that can be supplied by a piece of equipment.  This model details the {{term(xml)}} elements used to describe the structural and logical configuration for a piece of equipment.  It also describes each type of data that may be supplied by a piece of equipment in a manufacturing operation.

{{latex(\citetitle{MTCPart3})}}:  Defines the {{term(semantic data model)}} that organizes the data that is collected from a piece of equipment and transferred to a client software application from an {{term(agent)}}.

{{latex(\citetitle{MTCPart40})}}:  Provides an overview of {{termplural(mtconnect asset)}} and the functions provided by an {{term(agent)}} to communicate information relating to {{termplural(asset)}}.   The various {{termplural(semantic data model)}} describing each type of {{term(mtconnect asset)}} are defined in sub-Part documents (Part 4.x) of the MTConnect Standard.

{{latex(\citetitle{MTCPart5})}}:  Defines the MTConnect implementation of the {{term(interaction model)}} used to coordinate actions between pieces of equipment used in manufacturing systems.   

## MTConnect Document Versioning

The MTConnect Standard will be periodically updated with new and expanded functionality.  Each new release of the Standard will include additional content adding new functionality and/or extensions to the {{termplural(semantic data model)}} defined in the Standard.

The MTConnect Standard uses a three-digit version numbering system to identify each release of the Standard that indicates the progression of enhancements to the Standard.  The format used to identify the documents in a specific version of the MTConnect Standard is:

{{term(major)}}.{{term(minor)}}.{{term(revision)}}

{{term(major)}} --  Identifier representing a consistent set of functionalities defined by the MTConnect Standard. This functionality includes the protocol(s) used to communicate data to a client software application, the {{termplural(semantic data model)}} defining how that data is organized into {{termplural(response document)}}, and the encoding of those {{termplural(response document)}}.  This set of functionalities is referred to as the {{term(base functional structure)}}.

When a release of the MTConnect Standard removes or modifies any of the protocol(s), {{termplural(semantic data model)}}, or encoding of the {{termplural(response document)}} included in the {{term(base functional structure)}} in such a way that it breaks backward compatibility and a client software application can no longer communicate with an {{term(agent)}} or cannot interpret the information provided by an {{term(agent)}}, the {{term(major)}} version identifier for the Documents in the release is revised to a successively higher number.

See {{latex(\sect{Backwards Compatibility})}} for details regarding the interaction between a client software application and versions of the MTConnect Standard.

{{term(minor)}} -- Identifier representing a specific set of functionalities defined by the MTConnect Standard.  Each release of the Standard (with a common {{term(major)}} version identifier) includes new and/or expanded functionality -- protocol extensions, new or extended {{termplural(semantic data model)}}, and/or new programming languages.  Each of these releases of the Standard is indicated by a successively higher {{term(minor)}} version identifier.   

If a new {{term(major)}} version of the MTConnect Standard is released, the {{term(minor)}} version identifier will be reset to 0.

{{term(revision)}} -- A supplemental identifier representing only organizational or editorial changes to a {{term(minor)}} version document with no changes in the functionality described in that document.

New releases of a specific document are indicated by a successively higher revision version identifier.

If a new {{term(minor)}} version of a document is released, the {{term(revision)}} identifier will be reset to 0.
                                                                                                                     
An example of the version identifier for a specific document would be: 

{{latex(\centerline{Version M.N.R})}}

### Document Releases

A {{term(major)}} revision change represents a substantial change to the MTConnect Standard.  At the time of a {{term(major)}} revision change, all documents representing the MTConnect Standard will be updated and released together.

A {{term(minor)}} revision change represents some level of extended functionality supported by the MTConnect Standard.  At the time of a {{term(minor)}} version release, MTConnect Documents representing the changes or enhancements to the Standard will be updated as required. However, all documents, whether updated or not, will be released together with a new {{term(minor)}} version number.  Providing all documents at a common {{term(major)}} and {{term(minor)}} version makes it easier for implementers to manage the compatibility and upgrade of the different software tools incorporated into a manufacturing software system.

Since a {{term(revision)}} represents no functional changes to the MTConnect Standard and includes only editorial or descriptive changes that enhance the understanding of the functionality supported by the Standard, individual documents within the Standard may be released at any time with a new {{term(revision)}} and that release does not impact any other documents associated with the MTConnect Standard.

The latest released version of each document provided for the MTConnect Standard, and historical releases of those documents, are provided at http://www.mtconnect.org.

{{latex(\newpage)}}

## MTConnect Document Naming Conventions

MTConnect Documents are identified as follows:

### Document Title

Each MTConnect Document {{latex(\MUST)}} be identified as follows:

{{latex(\newline)}} {{latex(\centerline{\large{\textbf{\mtconnectregistered Standard})}}}}
{{latex(\newline)}} {{latex(\centerline{Part \#.\# - \textit{Title})}}}
{{latex(\newline)}} {{latex(\centerline{Version M.N.R.})}}

The following keys are used to distinguish different Parts of the MTConnect Standard and the version of the MTConnect Document:

{{latex(\tab)}}	\#.\# -- Identifier of the specific Part and sub-Part of the MTConnect Standard 
	
{{latex(\tab)}}	Title -- Description of the type of information contained in the MTConnect Document
	
{{latex(\tab)}}	M -- Indicator of the {{term(major)}} version of the MTConnect Document
	
{{latex(\tab)}}	N-- Indicator of the {{term(minor)}} version of the MTConnect Document
	
{{latex(\tab)}}	R -- Indicator of the revision of the MTConnect Document

For example, a release of {{latex(\citetitle{MTCPart2})}} would be:

MTConnect Standard
{:.center}
Part 2 *{{term(device information model)}}*
{:.center}
Version 1.2.0
{:.center}

### Electronic Document File Naming

Electronic versions of the MTConnect Documents will be provided in PDF format and follow this naming convention:

```
  MTC\_Part\#-\#\_Title\_M-N-R.pdf 
```

The electronic version of the same release of {{latex(\citetitle{MTCPart2})}} would be:

```
  MTC\_Part\_2-0\_Devices\_Information\_Model\_1-2-0.pdf
```

## Document Conventions

Additional information regarding specific content in the MTConnect Standard is provided in the sections below.

### Use of MUST, SHOULD, and MAY

These words convey specific meaning in the MTConnect Standard when presented in capital letters, Times New Roman font, and a Bold font style. 

* The word **MUST** indicates content that is mandatory to be provided in an implementation where indicated.
* The word {{latex(\SHOULD)}} indicates content that is recommended, but the exclusion of which will not invalidate an implementation.
* The word **MAY** indicates content that is optional.  It is up to the implementer to decide if the content is relevant to an implementation.
* The word {{latex(\NOT)}} may be added to the words **MUST** or {{latex(\SHOULD)}} to negate the requirement.

### Text Conventions

The following conventions will be used throughout the MTConnect Documents to provide a clear and consistent understanding of the use of each type of information used to define the MTConnect Standard.

These conventions are:

* Standard text is provided in Times New Roman font.
* References to documents, sections or sub-sections of a document, or figures within a document are *italicized*; e.g., {{latex(\citetitle{MTCPart2})}}.
* Terms with a specific meaning in the MTConnect Standard will be *italicized*; e.g., {{term(major)}} indicating a version of the Standard.
* When these same terms are used within the text without specific reference to their function within the MTConnect Standard, they will be provided as non-italicized font; e.g., major indicating a descriptor of another term.
* Terms representing content of an MTConnect {{term(semantic data model)}} or the protocol used in MTConnect will be provided in fixed size, Courier New font; e.g., {{term(component componentstream)}}, {{term(probe httprequest)}}, {{term(current httprequest)}}.
  When these same terms are used within the text without specific reference to their function within the MTConnect Standard, they will be provided as Times New Roman font.
* All {{termplural(valid data value)}} that are restricted to a limited or controlled vocabulary will be provided in upper case Courier New font with an {{latex(\textunderscore)}}  (underscore) separating words.  For example: {{term(on value)}}, {{term(off value)}}, {{term(actual subtype)}}, {{term(counterclockwise value)}}, etc.
* All descriptive attributes associated with each piece of data defined in a {{term(response document)}} will be provided in Courier New font and camel case font style.  For example: {{term(nativeunits)}}.

### Code Line Syntax and Conventions

The following conventions will be used throughout the MTConnect Documents to describe examples of software code produced by an {{term(agent)}} or commands provided to an {{term(agent)}} from a client software application.

All examples are provided in fixed size Courier New font with line numbers.

These conventions are:

*  {{term(xml)}} Code examples:

~~~~xml
<MTConnectStreams xmlns:m="urn:mtconnect.com:
    MTConnectStreams:1.1" xmlns:xsi=
    "http://www.w3.org/2001/XMLSchema-instance"
    xmlns="urn:mtconnect.com:MTConnectStreams:1.1"
~~~~
{: caption="XML Code Examples" label="lst:xml-code-examples" start="last" }


* HTTP URL examples:

* `http://<authority>/<path>[?<query>] ` When a portion of a URL is enclosed in angle brackets ("<" and ">"), that section of the URL is a place holder for specific information that will replace the term between the angle brackets. 
  > Note:  The angle brackets in a URL do not relate to the angle brackets used as the `tag` elements in an {{term(xml)}} example

* A portion of a URL that is enclosed in square brackets "`[`" and "`]`" indicates that the enclosed content is optional. 

* All other characters in the URL are literal.

### Semantic Data Model Content

For each of the {{termplural(semantic data model)}} defined in the MTConnect Standard, there are tables describing pieces of information provided in the data models.  Each table has a column labeled {{term(occurrence)}}. {{term(occurrence)}} defines the number of times the content defined in the tables **MAY** be provided in the usage case specified.

* If the {{term(occurrence)}} is 1, the content **MUST** be provided.
* If the {{term(occurrence)}} is 0..1, the content **MAY** be provided and if provided, at most, only one occurrence of the content **MUST** be provided.
* If the {{term(occurrence)}} is 0..*, the content **MAY** be provided and any number of occurrences of the content **MAY** be provided.
* If the {{term(occurrence)}} is 1..*, one or more occurrences of the content **MUST** be provided.
* If the {{term(occurrence)}} is a number, e.g., 2, exactly that number of occurrences of the content **MUST** be provided.

{{latex(\begin{note})}}
Note: "*" indicates multiple number of occurrences and is represented by ${{latex(\infty)}}$ in the figures.

{{latex(\end{note})}}

### Referenced Standards and Specifications

Other standards and specifications may be used to describe aspects of the protocol, {{term(data dictionary)}}, or {{termplural(semantic data model)}} defined in the MTConnect Standard.  When a specific standard or specification is referenced in the MTConnect Standard, the name of the standard or specification will be provided in *italicized* font.  

See {{latex(\sect{Terminology and Conventions})}}:  Bibliography for a complete listing of standards and specifications used or referenced in the MTConnect Standard. 

### Deprecation and Deprecation Warnings

When the MTConnect Institute adds new functionality to the MTConnect Standard, the new content may supersede some of the functionality of existing content or significantly enhance one of the {{termplural(semantic data model)}}.  When this occurs, existing content may no longer be valid for use in the new version of the Standard.

#### Deprecation{{latex(\mbox)}}{}

In cases when new content supersedes the functionality of the existing content, the original content **MUST** no longer be included in future implementations -- only the new content should be used.

The superseded content is identified by striking through the original content ({{latex(\deprecated{original content})}}) and marking the content with the words "{{latex(\DEPRECATED)}} in *Version M.N*".

The deprecated content must remain in all future {{term(minor)}} versions of the document.  The content may be removed when a {{term(major)}} version update is released.  This provides implementers guidance on how to interpret data that may be provided from equipment utilizing an older version of the Standard.  This content provides the information required for implementers to develop software applications that support backwards compatibility with older versions of the standard.

A software application may be designed to be compliant with any specific {{term(minor)}} version of the standard.  That software application may be collecting data from many different pieces of equipment.  Each of these pieces of equipment may be providing data defined by the current version or any of the previous {{term(minor)}} versions of the standard.  To maintain compatibility with existing pieces of equipment, software applications should be implemented to interpret data defined in the current release of the MTConnect Standard, as well as all deprecated content associated with earlier versions of the Standard.

#### Deprecation Warning

When new content provides improved alternatives for defining the {{termplural(semantic data model)}}, the MTConnect Institute may determine that the original content could possibly be deprecated in the future.  When this occurs, a content will be marked with the words "{{latex(\DEPRECATIONWARNING)}}" to identify the content that may be deprecated in the future.  This provides advanced notice to implementers that they should choose to utilize the improved alternatives when developing new products or software systems to avoid the possibility that the original content may be deprecated in a future version of the Standard. 

%## Document Version Management 

## Backwards Compatibility
 {#sec:Backwards Compatibility}

MTConnect Documents with a different {{term(major)}} version identifier represent a significant change in the {{term(base functional structure)}} of the MTConnect Standard.  This means that the schema or protocol defined by the Standard may have changed in ways that will require software applications to change how they request and/or interpret data received from an {{term(agent)}}.  Software applications should be fully version aware since no assumption of backwards compatibility should be assumed at the time of a {{term(major)}} revision change to the MTConnect Standard.

The MTConnect Institute strives to maintain version compatibility through all {{term(minor)}} revisions of the MTConnect Standard.  New {{term(minor)}} versions may introduce extensions to existing {{termplural(semantic data model)}}, extend the protocol used to communicate to the {{term(agent)}}, and/or add new {{termplural(semantic data model)}} to extend the functionality of the Standard.  Client software applications may be designed to be compliant with any specific {{term(minor)}} version of the MTConnect Standard.  Additionally, software applications should be capable of interpreting information from an {{term(agent)}} providing data based upon a lower {{term(minor)}} version identifier.  It should also be capable of interpreting information from an {{term(agent)}} providing data based upon a higher {{term(minor)}} version identifier of the MTConnect Standard than the version supported by the client, even though the client may ignore or not be capable of interpreting the extended content provided by the {{term(agent)}}.

A {{term(revision)}} version of any MTConnect Document provides only editorial changes requiring no changes to an {{term(agent)}} or a client application.

# MTConnect Fundamentals

The MTConnect Standard defines the functionality of an {{term(agent)}}.  In an MTConnect installation, pieces of equipment publish information to an {{term(agent)}}.  Client software applications request information from the {{term(agent)}} using a communications protocol.  Based on the specific information that the client software application has requested from the {{term(agent)}}, the {{term(agent)}} forms a {{term(response document)}} based upon one of the {{termplural(semantic data model)}} defined in the MTConnect Standard and then transmits that document to the client software application.  

![Illustrates the architecture of a typical MTConnect installation.](figures/mtconnect-architecture-model.png "mtconnect-architecture-model")

> Note: In each implementation of a communication system based on the MTConnect Standard, there **MUST** be a schema defined that encodes the rules and terminology defined for each of the {{termplural(semantic data model)}}.  These schemas **MAY** be used by client software applications to validate the content and structure of the {{termplural(response document)}} published by an {{term(agent)}}.

## Agent

An {{term(agent)}} is the centerpiece of an MTConnect implementation.  It provides two primary functions:

* Organizes and manages individual pieces of information published by one or more pieces of equipment.
* Publishes that information in the form of a {{term(response document)}} to client software applications.

The MTConnect Standard addresses the behavior of an {{term(agent)}} and the structure and meaning of the data published by an {{term(agent)}}.  It is the responsibility of the implementer of an {{term(agent)}} to determine the means by which the behavior is achieved for a specific {{term(agent)}}.

An {{term(agent)}} is software that may be installed as part of a piece of equipment or it may be installed separately.  When installed separately, an {{term(agent)}} may receive information from one or more pieces of equipment.

Some pieces of equipment may be able to communicate directly to an {{term(agent)}}.  Other pieces of equipment may require an {{term(adapter)}} to transform the information provided by the equipment into a form that can be sent to an {{term(agent)}}.  In either case, the method of transmitting information from the piece of equipment to an {{term(agent)}} is implementation dependent and is not addressed as part of the MTConnect Standard.

One function of an {{term(agent)}} is to store information that it receives from a piece of equipment in an organized manner.  A second function of an {{term(agent)}} is to receive {{termplural(request)}} for information from one or many client software applications and then respond to those {{termplural(request)}} by publishing a {{term(response document)}} that contains the requested information.

There are three types of information stored by an {{term(agent)}} that **MAY** be published in a {{term(response document)}}.  These are as follows:

* {{term(equipment metadata)}} defines the {{termplural(structural element)}} that represent the physical and logical parts and sub-parts of each piece of equipment that can publish data to the {{term(agent)}}, the relationships between those parts and sub-parts, and the {{termplural(data entity)}} associated with each of those {{termplural(structural element)}}.  This {{term(equipment metadata)}} is provided in an {{term(mtconnectdevices response document)}}. See {{latex(\citetitle{MTCPart2})}} for more information on {{term(equipment metadata)}}.
* {{term(streaming data)}} provides the values published by pieces of equipment for the {{termplural(data entity)}} defined by the {{term(equipment metadata)}}.  {{term(streaming data)}} is provided in an {{term(mtconnectstreams response document)}}.  See {{latex(\citetitle{MTCPart2})}} for more information on {{term(streaming data)}}.
* {{termplural(mtconnect asset)}} represent information used in a manufacturing operation that is commonly shared amongst multiple pieces of equipment and/or software applications.  {{termplural(mtconnect asset)}} are provided in an {{term(mtconnectassets response document)}}.  See {{latex(\citetitle{MTCPart40})}} for more information on {{termplural(mtconnect asset)}}.

The exchange between an {{term(agent)}} and a client software application is a {{term(request)}} and {{term(response)}} information exchange mechanism.  See {{latex(\sect{Request/Response Information Exchange})}} for details on this {{term(requestresponse)}} information exchange mechanism.

### Instance of an Agent
 {#sec:Instance of an Agent}

As described above, an {{term(agent)}} collects and organizes values published by pieces of equipment.  As with any piece of software, an {{term(agent)}} may be periodically restarted.  When an {{term(agent)}} restarts, it **MUST** indicate to client software applications whether the information available in the {{term(buffer)}} represents a completely new set of data or if the {{term(buffer)}} includes data that had been collected prior to the restart of the {{term(agent)}}.

Any time an {{term(agent)}} is restarted and begins to collect a completely new set of {{term(streaming data)}}, that set of data is referred to as an {{term(instance)}} of the {{term(agent)}}.  The {{term(agent)}} **MUST** maintain a piece of information called {{term(instanceid)}} that represents the specific {{term(instance)}} of the {{term(agent)}}.

{{term(instanceid)}} is represented by a 64-bit integer.  The {{term(instanceid)}} **MAY** be implemented using any mechanism that will guarantee that the value for {{term(instanceid)}} will be unique each time the {{term(agent)}} begins collecting a new set of data.

When an {{term(agent)}} is restarted and it provides a method to recover all, or some portion, of the data that was stored in the {{term(buffer)}} before it stopped operating, the {{term(agent)}} **MUST** use the same {{term(instanceid)}} that was defined prior to the restart. 

### Storage of Equipment Metadata for a Piece of Equipment

An {{term(agent)}} **MUST** be capable of publishing {{term(equipment metadata)}} for each piece of equipment that publishes information through the {{term(agent)}}.  {{term(equipment metadata)}} is typically a static file defining the {{termplural(structural element)}} associated with each piece of equipment reporting information through the {{term(agent)}} and the {{termplural(data entity)}} that can be associated with each of these {{termplural(structural element)}}.  See details on {{termplural(structural element)}} and {{termplural(data entity)}} in {{latex(\citetitle{MTCPart2})}}.

The MTConnect Standard does not define the mechanism to be used by an {{term(agent)}} to acquire, maintain, or store the {{term(equipment metadata)}}.  This mechanism **MUST** be defined as part of the implementation of a specific {{term(agent)}}.

### Storage of Streaming Data

{{term(streaming data)}} that is published from a piece(s) of equipment to an {{term(agent)}} is stored by the {{term(agent)}} based upon the sequence upon which each piece of data is received.  As described below, the order in which data is stored by the {{term(agent)}} is one of the factors that determines the data that may be included in a specific {{term(mtconnectstreams response document)}}. 

#### Management of Streaming Data Storage
 {#sec:Management of Streaming Data Storage}

An {{term(agent)}} stores a fixed amount of data.  The amount of data stored by an {{term(agent)}} is dependent upon the implementation of a specific {{term(agent)}}.  The examples below demonstrate how discrete pieces of data received from pieces of equipment are stored.

The method for storing {{term(streaming data)}} in an {{term(agent)}} can be thought of as a tube that can hold a finite set of balls.  Each ball represents the occurrence of a {{term(data entity)}} published by a piece of equipment.  This data is pushed in one end of the tube until there is no more room for additional balls.  At that point, any new data inserted will push the oldest data out the back of the tube.  The data in the tube will continue to shift in this manner as new data is received.

This tube is referred to as a {{term(buffer)}} in an {{term(agent)}}.

![Data Storage in Buffer](figures/data-storage-in-buffer.png "data-storage-in-buffer")

In {{figure(first-in-first-out-buffer-management)}}, the maximum number of {{termplural(data entity)}} that can be stored in the {{term(buffer)}} of the {{term(agent)}} is 8.  The maximum number of {{termplural(data entity)}} that can be stored in the {{term(buffer)}} is represented by a value called {{term(buffersize)}}.  This example illustrates that when the {{term(buffer)}} fills up, the oldest piece of data falls out the other end.

![First In First Out Buffer Management](figures/first-in-first-out-buffer-management.png "first-in-first-out-buffer-management")

This process constrains the memory storage requirements for an {{term(agent)}} to a fixed maximum size since the MTConnect Standard only requires an {{term(agent)}} to store a finite number of pieces of data.

As an implementation guideline, the {{term(buffer)}} {{latex(\SHOULD)}} be sized large enough to provide storage for a reasonable amount of information received from all pieces of equipment that are publishing information to that {{term(agent)}}.  The implementer should also consider the impact of a temporary loss of communications between a client software application and an {{term(agent)}} when determining the size for the {{term(buffer)}}.  A larger {{term(buffer)}} will allow a client software application more time to reconnect to an {{term(agent)}} without losing data.

#### Sequence Numbers{{latex(\mbox)}}{}

In an {{term(agent)}}, each occurrence of a {{term(data entity)}} in the {{term(buffer)}} will be assigned a monotonically increasing {{term(sequence number)}} as it is inserted into the {{term(buffer)}}.  The {{term(sequence number)}} is a 64-bit integer and the values assigned as {{termplural(sequence number)}} will never wrap around or be exhausted; at least within the next 100,000 years based on the size of a 64-bit number.

{{term(sequence number)}} is the primary key identifier used to manage and locate a specific piece of data in an {{term(agent)}}.  The {{term(sequence number)}} associated with each {{term(data entity)}} reported by an {{term(agent)}} is identified with an attribute called {{term(sequence)}}.

The {{term(sequence number)}} for each piece of data **MUST** be unique for an instance of an {{term(agent)}} (see {{latex(\sect{Instance of an Agent})}} for information on {{termplural(instance)}} of an {{term(agent)}}).  If data is received from more than one piece of equipment, the {{termplural(sequence number)}} are based on the order in which the data is received regardless of which piece of equipment produced that data.  The {{term(sequence number)}} **MUST** be a monotonically increasing number that spans all pieces of equipment publishing data to an {{term(agent)}}.  This allows for multiple pieces of equipment to publish data through a single {{term(agent)}} with no {{term(sequence number)}} collisions and unnecessary protocol complexity.

The {{term(sequence number)}} **MUST** be reset to one (1) each time an {{term(agent)}} is restarted and begins to collect a fresh set of data; i.e., each time {{term(instanceid)}} is changed.

{{figure(instanceid-and-sequence)}} demonstrates the relationship between {{term(instanceid)}} and sequence when an {{term(agent)}} stops and restarts and begins collecting a new set of data.  In this case, the {{term(instanceid)}} is changed to a new value and value for {{term(sequence)}} resets to one (1):

![instanceId and sequence](figures/instanceid-and-sequence.png "instanceid-and-sequence")

{{figure(identifying-the-range-of-data-with-firstsequence-and-lastsequence)}} also shows two additional pieces of information defined for an {{term(agent)}}:

* {{term(firstsequence)}} -- the oldest piece of data contained in the {{term(buffer)}}; i.e., the next piece of data to be moved out of the {{term(buffer)}}
* {{term(lastsequence)}} -- the newest data added to the {{term(buffer)}}

{{term(firstsequence)}} and {{term(lastsequence)}} provide guidance to a software application identifying the range of data avail
able that may be requested from an {{term(agent)}}. 

![Indentifying the range of data with firstSequence and lastSequence](figures/identifying-the-range-of-data-with-firstsequence-and-lastsequence.png "identifying-the-range-of-data-with-firstsequence-and-lastsequence")

When a client software application requests data from an {{term(agent)}}, it can specify both the {{term(sequence number)}} of the first piece of data ({{term(from query)}}) that **MUST** be included in the {{term(response document)}} and the total number ({{term(count model)}}) of pieces of data that {{latex(\SHOULD)}} be included in that document.

In {{figure(identifying-the-range-of-data-with-from-and-count)}}, the request specifies that the data to be returned starts at {{term(sequence number)}} 15 ({{term(from query)}}) and includes a total of three items ({{term(count model)}}).  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/identifying-the-range-of-data-with-from-and-count.png}
  {{latex(\caption{Identifying the range of data with from and count})}}
   {#fig:identifying-the-range-of-data-with-from-and-count}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}


Once a {{term(response)}} to a {{term(request)}} has been completed, the value of {{term(nextsequence)}} will be established.  {{term(nextsequence)}} is the {{term(sequence number)}} of the next piece of data available in the {{term(buffer)}}.  In the example in {{figure(identifying-the-range-of-data-with-from-and-count)}}, the next {{term(sequence number)}} ({{term(nextsequence)}}) will be 18.

As shown in {{figure(identifying-the-range-of-data-with-nextsequence-and-lastsequence)}}, the combination of {{term(from query)}} and {{term(count model)}} defined by the {{term(request)}} indicates a {{term(sequence number)}} for data that is beyond that which is currently in the {{term(buffer)}}.  In this case, {{term(nextsequence)}} is set to a value of {{term(lastsequence)}} + 1.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/identifying-the-range-of-data-with-nextsequence-and-lastsequence.png}
  {{latex(\caption{Indentifying the range of data with nextSequence and lastSequence})}}
   {#fig:identifying-the-range-of-data-with-nextsequence-and-lastsequence}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Buffer Data Structure{{latex(\mbox)}}{}

The information in the {{term(buffer)}} of an {{term(agent)}} can be thought of as a four-column table of data.  Each column in the table represents:

{{latex(\begin{itemize})}}
* The first column is the {{term(sequence number)}} associated with each {{term(data entity)}} - {{term(sequence)}}.

* The second column is the time that the data was published by a piece of equipment.  This time is defined as the {{term(timestamp)}} associated with that {{term(data entity)}}.  See {{latex(\sect{Time Stamp})}} for details on {{term(timestamp)}}.

* The third column, {{term(dataitemid)}}, refers to the identity of {{termplural(data entity)}} as they will appear in the {{term(mtconnectstreams response document)}}.  See *Section 5* of {{latex(\citetitle{MTCPart3})}} for details on {{term(dataitemid)}} for a {{term(data entity)}} and how that identify relates to the {{term(id)}} attribute of the corresponding {{term(data entity)}} in the {{termplural(device information model)}}.

* The fourth column is the value associated with each {{term(data entity)}}.
{{latex(\end{itemize})}}

{{figure(data-storage-concept)}} is an example demonstrating the concept of how data may be stored in an {{term(agent)}}:

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/data-storage-concept.png}
  {{latex(\caption{Data Storage Concept})}}
   {#fig:data-storage-concept}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}


The storage mechanism for the data, the internal representation of the data, and the implementation of the {{term(agent)}} itself is not part of the MTConnect Standard.  The implementer can choose both the amount of data to be stored in the {{term(agent)}} and the mechanism for how the data is stored.  The only requirement is that an {{term(agent)}} publish the {{termplural(response document)}} in the required format.  

#### Time Stamp{{latex(\mbox)}}{}
 {#sec:Time Stamp}

Each piece of equipment that publishes information to an {{term(agent)}} {{latex(\SHOULD)}} provide a time stamp indicating when each piece of information was measured or determined.  If no time stamp is provided, the {{term(agent)}} **MUST** provide a time stamp for the information based upon when that information was received at the {{term(agent)}}.

The {{term(timestamp)}} associated with each piece of information is reported by an {{term(agent)}} as {{term(timestamp)}}.  {{term(timestamp)}} **MUST** be reported in UTC (Coordinated Universal Time) format; e.g., "2010-04-01T21:22:43Z".

{{latex(\begin{note})}}
Note:  Z refers to UTC/GMT time, not local time.

{{latex(\end{note})}}

Client software applications should use the value of {{term(timestamp)}} reported for each piece of information as the means for ordering when pieces of information were generated as opposed to using {{term(sequence)}} for this purpose.

{{latex(\begin{note})}}
Note: It is assumed that {{term(timestamp)}} provides the best available estimate of the time that the value(s) for the published information was measured or determined.

{{latex(\end{note})}}

If two pieces of information are measured or determined at the exact same time, they **MUST** be reported with the same value for {{term(timestamp)}}.  Likewise, all information that is recorded in the {{term(buffer)}} with the same value for {{term(timestamp)}} should be interpreted as having been recorded at the same point in time; even if that data was published by more than one piece of equipment. 

#### Recording Occurrences of Streaming Data{{latex(\mbox)}}{}

An {{term(agent)}} **MUST** record data in the {{term(buffer)}} each time the value for that specific piece of data changes.  If a piece of equipment publishes multiple occurrences of a piece of data with the same value, the {{term(agent)}} {{latex(\MUSTNOT)}} record multiple occurrence for that {{term(data entity)}}.

{{latex(\begin{note})}}
Note:	There is one exception to this rule.  Some {{termplural(data entity)}} may be defined with a {{term(representation)}} attribute value of {{term(discrete representation)}} (See *Section 7.2.2.12* of {{latex(\citetitle{MTCPart2})}} for details on {{term(representation)}}.)  In this case, each occurrence of the data represents a new and unique piece of information.  The {{term(agent)}} **MUST** then record each occurrence of the {{term(data entity)}} that is published by a piece of equipment.

{{latex(\end{note})}}

The value for each piece of information reported by an {{term(agent)}} must be considered by a client software application to be valid until such a time that another occurrence of that piece of information is published by the {{term(agent)}}.

#### Maintaining Last Value for Data Entities{{latex(\mbox)}}{}

An {{term(agent)}} **MUST** retain a copy of the last available value associated with each {{term(data entity)}} known to the {{term(agent)}}; even if an occurrence of that {{term(data entity)}} is no longer in the {{term(buffer)}}.  This function allows an {{term(agent)}} to provide a software application a view of the last known value for each {{term(data entity)}} associated with a piece of equipment.

The {{term(agent)}} **MUST** also retain a copy of the last value associated with each {{term(data entity)}} that has flowed out of the {{term(buffer)}}.  This function allows an {{term(agent)}} to provide a software application a view of the last known value for each {{term(data entity)}} associated with a {{term(current request)}} with an {{term(at query)}} parameter in the {{term(query http request)}} portion of its {{term(http request line)}} (See {{latex(\sect{Current Request Implemented Using HTTP})}} for details on {{term(current request)}}).

{{latex(\newpage)}}

#### Unavailability of Data{{latex(\mbox)}}{}

An {{term(agent)}} **MUST** maintain a list of {{termplural(data entity)}} that **MAY** be published by each piece of equipment providing information to the {{term(agent)}}.   This list of {{termplural(data entity)}} is derived from the {{term(equipment metadata)}} stored in the {{term(agent)}} for each piece of equipment.

Each time an {{term(agent)}} is restarted, the {{term(agent)}} **MUST** place an occurrence of every {{term(data entity)}} in the {{term(buffer)}}.  The value reported for each of these {{termplural(data entity)}} **MUST** be set to {{term(unavailable value)}} and the {{term(timestamp)}} for each **MUST** be set to the time that the last piece of data was collected by the {{term(agent)}} prior to the restart.

If at any time an {{term(agent)}} loses communications with a piece of equipment, or the {{term(agent)}} is unable to determine a valid value for all, or any portion, of the {{termplural(data entity)}} published by a piece of equipment, the {{term(agent)}} **MUST** place an occurrence of each of these {{termplural(data entity)}} in the {{term(buffer)}} with its value set to {{term(unavailable value)}}.  This signifies that the value is currently indeterminate and no assumptions of a valid value for the data is possible.

Since an {{term(agent)}} may receive information from multiple pieces of equipment, it **MUST** consider the validity of the data from each of these pieces of equipment independently.

There is one exception to the rules above.  Any {{term(data entity)}} that is constrained to a constant data value **MUST** be reported with the constant value and the {{term(agent)}} {{latex(\MUSTNOT)}} set the value of that {{term(data entity)}} to {{term(unavailable value)}}.

{{latex(\begin{note})}}
Note:	The schema for the {{termplural(device information model)}} (defined in {{latex(\citetitle{MTCPart2})}}) defines how the value reported for an individual piece of data may be constrained to one or more specific values.

{{latex(\end{note})}}

#### Persistence and Recovery

The implementer of an {{term(agent)}} must decide on a strategy regarding the storage of {{term(streaming data)}} in the {{term(buffer)}} of the {{term(agent)}}.

In the simplest form, an {{term(agent)}} can hold the {{term(buffer)}} information in volatile memory where no data is persisted when the {{term(agent)}} is stopped.  In this case, the {{term(agent)}} **MUST** update the value for {{term(instanceid)}} when the {{term(agent)}} restarts to indicate that the {{term(agent)}} has begun to collect a new set of data.

If the implementation of an {{term(agent)}} provides a method of persisting and restoring all or a portion of the information in the {{term(buffer)}} of the {{term(agent)}} ({{termplural(sequence number)}}, {{termplural(time stamp)}}, identify, and values), the {{term(agent)}} {{latex(\MUSTNOT)}} change the value of the {{term(instanceid)}} when the {{term(agent)}} restarts.  This will indicate to a client software application that it does not need to reset the value for {{term(nextsequence)}} when it requests the next set of data from the {{term(agent)}}.

When an implementer chooses to provide a method to persist the information in an {{term(agent)}}, they may choose to store as much data as is practical in a recoverable storage system.  Such a method may also include the ability to store historical information that has previously been pushed out of the {{term(buffer)}}.

#### Heartbeat

An {{term(agent)}} **MUST** provide a function that indicates to a client application that the HTTP connection is still viable during times when there is no new data available to report in a {{term(response document)}}.  This function is defined as {{term(heartbeat)}}.

{{term(heartbeat)}} represents the amount of time after a {{term(response document)}} has been published until a new {{term(response document)}} **MUST** be published, even when no new data is available.

See {{latex(\sect{Query Portion of the HTTP Request Line for a Sample Request})}} for more details on configuring the {{term(heartbeat)}} function.

#### Data Sets
 {#sec:Data Sets}

See {{latex(\citetitle{MTCPart3})}} *Section Part 3: DataItem with representation of DATA\textunderscore SET* for management of {{termplural(data set)}}.


### Storage of Documents for MTConnect Assets

An {{term(agent)}} also stores information associated with {{termplural(mtconnect asset)}}.

When a piece of equipment publishes a document that represents information associated with an {{term(mtconnect asset)}}, an {{term(agent)}} stores that document in a {{term(buffer)}}.  This {{term(buffer)}} is called the {{termplural(asset buffer)}}.  The document is called an {{term(asset document)}}.

The {{termplural(asset buffer)}} **MUST** be a separate {{term(buffer)}} from the one where the {{term(streaming data)}} is stored.

The {{term(asset document)}} that is published by the piece of equipment **MUST** be organized based upon one of the applicable {{termplural(asset information model)}} defined in one of the Parts 4.x of the MTConnect Standard.

An {{term(agent)}} will only retain a limited number of {{termplural(asset document)}} in the {{termplural(asset buffer)}}.  The {{termplural(asset buffer)}} functions similar to the {{term(buffer)}} for {{term(streaming data)}}; i.e., when the {{termplural(asset buffer)}} is full, the oldest {{term(asset document)}} is pushed from the {{term(buffer)}}.

{{figure(first-in-first-out-asset-buffer-management)}} demonstrates the oldest {{term(asset document)}} being pushed from the {{termplural(asset buffer)}} when a new {{term(asset document)}} is added and the {{termplural(asset buffer)}} is full:

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/first-in-first-out-asset-buffer-management.png}
  {{latex(\caption{First In First Out Asset Buffer Management})}}
   {#fig:first-in-first-out-asset-buffer-management}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

Within an {{term(agent)}}, the management of {{termplural(asset document)}} behave like a key/value storage in a database.  In the case of {{termplural(mtconnect asset)}}, the key is an identifier for an Asset (see details on {{term(assetid)}} in {{latex(\citetitle{MTCPart40})}}) and the value is the {{term(asset document)}} that was published by the piece of equipment. 

{{figure(relationship-between-assetid-and-stored-asset-documents)}} demonstrates the relationship between the key ({{term(assetid)}}) and the stored {{termplural(asset document)}}:

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.3{{latex(\textwidth)}}]{figures/relationship-between-assetid-and-stored-asset-documents.png}
  {{latex(\caption{Relationship between assetId and stored Asset documents})}}
   {#fig:relationship-between-assetid-and-stored-asset-documents}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

{{latex(\begin{note})}}
Note:  The key ({{term(assetid)}}) is independent of the order of the {{termplural(asset document)}} stored in the {{termplural(asset buffer)}}.

{{latex(\end{note})}}

When an {{term(agent)}} receives a new {{term(asset document)}} representing an {{term(mtconnect asset)}}, it must determine whether this document represents an {{term(mtconnect asset)}} that is not currently represented in the {{termplural(asset buffer)}} or if the document represents new information for an {{term(mtconnect asset)}} that is already represented in the {{termplural(asset buffer)}}.  When a new {{term(asset document)}} is received, one of the following **MUST** occur:

{{latex(\begin{itemize})}}

* If the {{term(asset document)}} represents an {{term(mtconnect asset)}} that is not currently represented in the {{termplural(asset buffer)}}, the {{term(agent)}} **MUST** add the new document to the front of the {{termplural(asset buffer)}}.  If the {{termplural(asset buffer)}} is full, the oldest {{term(asset document)}} will be removed from the {{termplural(asset buffer)}}.

* If the {{term(asset document)}} represents an {{term(mtconnect asset)}} that is already represented in the {{termplural(asset buffer)}}, the {{term(agent)}} **MUST** remove the existing {{term(asset document)}} representing that {{term(mtconnect asset)}} from the {{termplural(asset buffer)}} and add the new {{term(asset document)}} to the front of the {{termplural(asset buffer)}}.  

{{latex(\end{itemize})}}

The MTConnect Standard does not specify the maximum number of {{termplural(asset document)}} that may be stored in the {{termplural(asset buffer)}}; that limit is determined by the implementation of a specific {{term(agent)}}.  The number of {{termplural(asset document)}} that may be stored in an {{term(agent)}} is defined by the value for {{term(assetbuffersize)}} (See {{latex(\sect{Document Header})}} for more information on {{term(assetbuffersize)}}.).  A value of 4,294,967,296 or $2^{32}$ can be provided for {{term(assetbuffersize)}} to indicate unlimited storage.

There is no requirement for an {{term(agent)}} to provide persistence for the {{termplural(asset document)}} stored in the {{termplural(asset buffer)}}.  If an {{term(agent)}} should fail, all {{termplural(asset document)}} stored in the {{termplural(asset buffer)}} **MAY** be lost.  It is the responsibility of the implementer to determine if {{termplural(asset document)}} stored in an {{term(agent)}} may be restored or if those {{termplural(asset document)}} are retained by some other software application.

Additional details on how an {{term(agent)}} organizes and manages information associated with {{termplural(mtconnect asset)}} are provided in {{latex(\citetitle{MTCPart40})}}. 

## Response Documents

{{termplural(response document)}} are electronic documents generated and published by an {{term(agent)}} in response to a {{term(request)}} for data. 

The {{termplural(response document)}} defined in the MTConnect Standard are:

{{latex(\begin{itemize})}}

* {{term(mtconnectdevices response document)}}:  An electronic document that contains the information published by an {{term(agent)}} describing the data that can be published by one or more piece(s) of equipment.  The structure of the {{term(mtconnectdevices response document)}} document is based upon the requirements defined by the {{termplural(device information model)}}.  See {{latex(\citetitle{MTCPart2})}} for details on this information model.

* {{term(mtconnectstreams response document)}}:  An electronic document that contains the information published by an {{term(agent)}} that contains the data that is published by one or more piece(s) of equipment.  The structure of the {{term(mtconnectstreams response document)}} document is based upon the requirements defined by the {{term(streams information model)}}.  See {{latex(\citetitle{MTCPart3})}} for details on this information model.

* {{term(mtconnectassets response document)}}:  An electronic document that contains the information published by an {{term(agent)}} that **MAY** include one or more {{termplural(asset document)}}.  The structure of the {{term(mtconnectassets response document)}} document is based upon the requirements defined by the {{termplural(asset information model)}}.  See {{latex(\citetitle{MTCPart40})}} for details on this information model.

* {{term(mtconnecterrors response document)}}:  An electronic document that contains the information provided by an {{term(agent)}} when an error has occurred when trying to respond to a {{term(request)}} for data.  The structure of the {{term(mtconnecterrors response document)}} is based upon the requirements defined by the {{term(error information model)}}.  See {{latex(\sect{Error Information Model})}} of this document for details on this information model.

{{latex(\end{itemize})}}

{{termplural(response document)}} may be represented by any document format supported by an {{term(agent)}}.  No matter what document format is used to structure these documents, the requirements for representing the data and other information contained in those documents **MUST** adhere to the requirements defined in the {{termplural(information model)}} associated with each document.

### XML Documents
 {#sec:XML Documents}

{{term(xml)}} is currently the only document format supported by the MTConnect Standard for encoding {{termplural(response document)}}.  Other document formats may be supported in the future.   

Since {{term(xml)}} is the document format supported by the MTConnect Standard for encoding documents, all examples demonstrating the structure of the {{termplural(response document)}} provided throughout the MTConnect Standard are based on {{term(xml)}}.  These documents will be referred to as {{termplural(mtconnect xml document)}} or {{termplural(xml document)}}.

{{latex(\sect{XML Representation of Response Documents})}} defines how each document is structured as an {{term(xml document)}}.

## Semantic Data Models

A {{term(semantic data model)}} is a software engineering method for representing data where the context and the meaning of the data is constrained and fully defined.

Each of the {{termplural(semantic data model)}} defined by the MTConnect Standard include:

{{latex(\begin{itemize})}}
* The types of information that may be published by a piece of equipment,

* The meaning of that information and units of measure, if applicable,

* Structural information that defines how different pieces of information relate to each other, and

* Structural information that defines how the information relates to where the information was measured or generated by the piece of equipment.
{{latex(\end{itemize})}}

As described previously, the content of the {{termplural(response document)}} provided by an {{term(agent)}} are each defined by a specific {{term(semantic data model)}}.  The details for the {{term(semantic data model)}} used to define each of the {{termplural(response document)}} are detail as follows:

{{latex(\begin{itemize})}}
* {{term(mtconnectdevices response document)}}:  {{latex(\citetitle{MTCPart2})}}. 

* {{term(mtconnectstreams response document)}}:  {{latex(\citetitle{MTCPart3})}}.

* {{term(mtconnectassets response document)}}:  {{latex(\citetitle{MTCPart40})}} and its sub-Parts.

* {{term(mtconnecterrors response document)}}:  {{latex(\citetitle{MTCPart1})}}, {{latex(\sect{Error Information Model})}}.
{{latex(\end{itemize})}}

Without semantics, a single piece of data does not convey any relevant meaning to a person or a client software application.  However, when that piece of data is paired with some semantic context, the data inherits significantly more meaning.  The data can then be more completely interpreted by a client software application without human intervention.

The MTConnect {{termplural(semantic data model)}} allows the information published by a piece of equipment to be transmitted to client software application with a full definition of the meaning of that information and in full context defining how that information relates to the piece of equipment that measured or generated the information.

## Request/Response Information Exchange
 {#sec:Request/Response Information Exchange}

The transfer of information between an {{term(agent)}} and a client software application is based on a {{term(requestresponse)}} information exchange approach.   A client software application requests specific information from an {{term(agent)}}.  An {{term(agent)}} responds to the {{term(request)}} by publishing a {{term(response document)}}.

In normal operation, there are four types of {{termplural(mtconnect request)}} that can be issued by a client software application that will result in different {{termplural(response)}} by an {{term(agent)}}.  These {{termplural(request)}} are:

{{latex(\begin{itemize})}}
* {{term(probe request)}}-- A client software application requests the {{term(equipment metadata)}} for each piece of equipment that **MAY** publish information through an {{term(agent)}}.  The {{term(agent)}} publishes a {{term(mtconnectdevices response document)}} that contains the requested information.  A {{term(probe request)}} is represented by the term {{term(probe httprequest)}} in a {{term(request)}} from a client software application.

* {{term(current request)}} -- A client software application requests the current value for each of the data types that have been published from a piece(s) of equipment to an {{term(agent)}}.  The {{term(agent)}} publishes a {{term(mtconnectstreams response document)}} that contains the requested information.  A {{term(current request)}} is represented by the term {{term(current httprequest)}} in a {{term(request)}} from a client software application.

* {{term(sample request)}} -- A client software application requests a series of data values from the {{term(buffer)}} in an {{term(agent)}} by specifying a range of {{termplural(sequence number)}} representing that data.  The {{term(agent)}} publishes a {{term(mtconnectstreams response document)}} that contains the requested information.  A {{term(sample request)}} is represented by the term {{term(sample httprequest)}} in a {{term(request)}} from a client software application.

* {{term(asset request)}} -- A client software application requests information related to {{termplural(mtconnect asset)}} that has been published to an {{term(agent)}}.  The {{term(agent)}} publishes an {{term(mtconnectassets response document)}} that contains the requested information.  An {{term(asset request)}} is represented by the term {{term(asset httprequest)}} in a {{term(request)}} from a client software application.

{{latex(\begin{note})}}
Note: If an {{term(agent)}} is unable to respond to the request for information or the request includes invalid information, the {{term(agent)}} will publish an {{term(mtconnecterrors response document)}}. See {{latex(\sect{Error Information Model})}} for information regarding {{term(error information model)}}

{{latex(\end{note})}}

{{latex(\end{itemize})}}

The specific format for the {{term(request)}} for information from an {{term(agent)}} will depend on the {{term(protocol)}} implemented as part of the {{term(requestresponse)}} information exchange mechanism deployed in a specific implementation.  See {{latex(\sect{Protocol and Messaging})}}, {{term(protocol)}} for details on implementing the {{term(requestresponse)}} information exchange.

Also, the specific format for the {{termplural(response document)}} may also be implementation dependent.   See {{latex(\sect{XML Representation of Response Documents})}} for details on the format for the {{termplural(response document)}} encoded with {{term(xml)}}.

## Accessing Information from an Agent

Each of the {{termplural(request)}} defined for the {{term(requestresponse)}} information exchange requires an {{term(agent)}} to respond with a specific view of the information stored by the {{term(agent)}}.  The following describes the relationships between the information stored by an {{term(agent)}} and the contents of the {{termplural(response document)}}.

### Accessing Equipment Metadata from an Agent

The {{term(equipment metadata)}} associated with each piece of equipment that publishes information to an {{term(agent)}} is typically static information that is maintained by the {{term(agent)}}.  The MTConnect Standard does not define how the {{term(agent)}} captures or maintains that information.  The only requirement that the MTConnect Standard places on an {{term(agent)}} regarding this {{term(equipment metadata)}} is that the {{term(agent)}} properly store this information and then configure and publish a {{term(mtconnectdevices response document)}} in response to a {{term(probe request)}}.

All issues associated with the capture and maintenance of the {{term(equipment metadata)}} is the responsibility of the implementer of a specific {{term(agent)}}.

### Accessing Streaming Data from the Buffer of an Agent

There are two {{termplural(request)}} defined for the {{term(requestresponse)}} information exchange that require an {{term(agent)}} to provide different views of the information stored in the {{term(buffer)}} of the {{term(agent)}}.  These {{termplural(request)}} are {{term(current httprequest)}} and {{term(sample httprequest)}}.

The example in {{figure(example-buffer)}} demonstrates how an {{term(agent)}} interprets the information stored in the {{term(buffer)}} to provide the content that is published in different versions of the {{term(mtconnectstreams response document)}} based on the specific {{term(request)}} that is issued by a client software application.

In this example, an {{term(agent)}} with a {{term(buffer)}} that can hold up to eight (8) {{termplural(data entity)}}; i.e., the value for {{term(buffersize)}} is 8.  This {{term(agent)}} is collecting information for two pieces of data -- {{latex(\cfont{Pos})}} representing a position and {{latex(\cfont{Line})}} representing a line of logic or commands in a control program.  

In this {{term(buffer)}}, the value for {{term(firstsequence)}} is 12 and the value for {{term(lastsequence)}} is 19.  There are five (5) different values for {{latex(\cfont{Pos})}} and three (3) different values for {{latex(\cfont{Line})}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/example-buffer.png}
  {{latex(\caption{Example Buffer})}}
   {#fig:example-buffer}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

If an {{term(agent)}} receives a {{term(sample request)}} from a client software application, the {{term(agent)}} **MUST** publish an {{term(mtconnectstreams response document)}} that contains a range of data values.  The range of values are defined by the {{term(from query)}} and {{term(count model)}} parameters that must be included as part of the {{term(sample request)}}.  If the value of {{term(from query)}} is 14 and the value of {{term(count model)}} is 5, the {{term(agent)}} **MUST** publish an {{term(mtconnectstreams response document)}} that includes five (5) pieces of data represented by {{termplural(sequence number)}} 14, 15, 16, 17, and 18 -- three (3) occurrences of {{latex(\cfont{Line})}} and two (2) occurrences of {{latex(\cfont{Pos})}}.  In this case, {{term(nextsequence)}} will also be returned with a value of 19.

Likewise, if the same {{term(agent)}} receives a {{term(current request)}} from a client software application, the {{term(agent)}} **MUST** publish an {{term(mtconnectstreams response document)}} that contains the most current information available for each of the types of data that is being published to the {{term(agent)}}.  In this case, the specific data that **MUST** be represented in the {{term(mtconnectstreams response document)}} is {{latex(\cfont{Pos})}} with a value of 22 and a {{term(sequence number)}} of 19 and {{latex(\cfont{Line})}} with a value of 227 and a {{term(sequence number)}} of 18.

There is also a derivation of the {{term(current request)}} that will cause an {{term(agent)}} to publish an {{term(mtconnectstreams response document)}} that contains a set of data relative to a specific sequence number.  The {{term(current request)}} **MAY** include an additional parameter called {{term(at query)}}.  When the {{term(at query)}} parameter, along with an {{term(instanceid)}}, is included as part of a {{term(current request)}}, an {{term(agent)}} **MUST** publish an {{term(mtconnectstreams response document)}} that contains the most current information available for each of the types of {{termplural(data entity)}} that are being published to the {{term(agent)}} that occur immediately at or before the {{term(sequence number)}} specified with the {{term(at query)}} parameter.

For example, if the {{term(request)}} is {{latex(\cfont{current?at=15})}}, an {{term(agent)}} **MUST** publish a {{term(mtconnectstreams response document)}} that contains the most current information available for each of the {{termplural(data entity)}} that are stored in the {{term(buffer)}} of the {{term(agent)}} with a {{term(sequence number)}} of 15 or lower.  In this case, the specific data that **MUST** be represented in the {{term(mtconnectstreams response document)}} is {{latex(\cfont{Pos})}} with a value of 10 and a {{term(sequence number)}} of 13 and {{latex(\cfont{Line})}} with a value of 220 and a {{term(sequence number)}} of 15.

If a {{term(current httprequest)}} {{term(request)}} is received for a {{term(sequence number)}} of 11 or lower, an {{term(agent)}} **MUST** return an {{term(outofrange value)}} {{term(mtconnecterrors response document)}}.  The same {{term(http error message)}} **MUST** be given if a {{term(sequence number)}} is requested that is greater than the end of the {{term(buffer)}}.  See {{latex(\sect{Error Information Model})}} for more information on {{term(mtconnecterrors response document)}}.

### Accessing MTConnect Assets Information from an Agent

When an {{term(agent)}} receives an {{term(asset request)}}, the {{term(agent)}} **MUST** publish an {{term(mtconnectassets)}} document that contains information regarding the {{termplural(asset document)}} that are stored in the {{term(agent)}}.

See {{latex(\citetitle{MTCPart40})}} for details on {{termplural(mtconnect asset)}}, {{termplural(asset request)}}, and the {{term(mtconnectassets response document)}}.

# XML Representation of Response Documents
 {#sec:XML Representation of Response Documents}

As defined in {{latex(\sect{XML Documents})}}, {{term(xml)}} is currently the only language supported by the MTConnect Standard for encoding {{termplural(response document)}}.

{{termplural(response document)}} must be valid and conform to the {{term(schema)}} defined in the {{term(semantic data model)}} defined for that document.  The {{term(schema)}} for each {{term(response document)}} **MUST** be updated to correlate to a specific version of the MTConnect Standard.  Versions, within a {{term(major)}} version, of the MTConnect Standard will be defined in such a way to best maintain backwards compatibility of the {{termplural(semantic data model)}} through all {{term(minor)}} revisions of the Standard.  However, new {{term(minor)}} versions may introduce extensions or enhancements to existing {{termplural(semantic data model)}}.

To be valid, a {{term(response document)}} must be well-formed; meaning that, amongst other things, each element has the required {{term(xml)}} *start-tag* and *end-tag* and that the document does not contain any illegal characters.  The validation of the document may also include a determination that required elements and attributes are present, they only occur in the appropriate location in the document, and they appear only the correct number of times.  If the document is not well-formed, it may be rejected by a client software application.  The {{term(semantic data model)}} defined for each {{term(response document)}} also specifies the elements and {{termplural(child element)}} that may appear in a document.  {{term(xml)}} elements may contain {{termplural(child element)}}, {{term(cdata)}}, or both.  The {{term(semantic data model)}} also defines the number of times each element and {{term(child element)}} may appear in the document.

Each {{term(response document)}} encoded using {{term(xml)}} consists of the following primary sections:

{{latex(\begin{itemize})}}
* {{term(xml)}} Declaration

* Root Element

* Schema and Namespace Declaration

* Document Header

* Document Body
{{latex(\end{itemize})}}

The following will provide details defining how each of the {{termplural(response document)}} are encoded using {{term(xml)}}.

{{latex(\begin{note})}}
Note: See {{latex(\sect{Terminology and Conventions})}} for the definition of {{term(xml)}} related terms used in the MTConnect Standard.

{{latex(\end{note})}}

## Fundamentals of Using XML to Encode Response Documents

The MTConnect Standard follows industry conventions for formatting the elements and attributes included in an {{term(xml)}} document.  The general guidelines are as follows: 

{{latex(\begin{itemize})}}
* All element names **MUST** be specified in Pascal case (first letter of each word is capitalized). For example: {{latex(\cfont{<PowerSupply/>})}}.

* The name for an attribute **MUST** be Camel case; similar to Pascal case, but the first letter will be lower case.  For example: {{latex(\cfont{<MyElement nativeName="bob"/>})}} where {{latex(\cfont{MyElement})}} is the {{term(element name)}} and {{term(nativename)}} is an attribute.

* All {{term(cdata)}} values that are defined with a limited or controlled vocabulary **MUST** be in upper case with an \_ (underscore) separating words.  For example: {{term(on value)}}, {{term(off value)}}, {{term(actual subtype)}}, and {{term(counterclockwise value)}}.

* The values provided for a date and/or a time **MUST** follow the W3C ISO 8601 format with an arbitrary number of decimals representing fractions of a second.  Refer to the following specification for details on the format for dates and times:  http://www.w3.org/TR/NOTE-datetime.

The format for the value describing a date and a time will be\\ YYYY-MM-DDThh:mm:ss.ffff. An example would be: 2017-01-13T13:01.213415Z.  

{{latex(\begin{note})}}
Note:  Z refers to UTC/GMT time, not local time.

{{latex(\end{note})}}

The accuracy and number of decimals representing fractions of a second for a {{term(timestamp)}} **MUST** be determined by the capabilities of the piece of equipment publishing information to an {{term(agent)}}.  All time values **MUST** be provided in UTC (GMT).

* {{term(xml)}} element names **MUST** be spelled out and abbreviations are not permitted.   See the exclusion below regarding the use of the suffix {{latex(\cfont{Ref})}}.

* {{term(xml)}} attribute names {{latex(\SHOULD)}} be spelled out and abbreviations {{latex(\SHOULD)}} be avoided.  The exception to this rule is the use of {{term(id)}} when associated with an identifier.  See the exclusion below regarding the use of the suffix {{latex(\cfont{Ref})}}.

* The abbreviation {{latex(\cfont{Ref})}} for {{term(reference)}} is permitted as a suffix to element names of either a {{term(structural element)}} or a {{term(data entity)}} to provide an efficient method to associate information defined in another location in a {{term(data model)}} without duplicating that original data or structure.  See *Section 4.8* in {{latex(\citetitle{MTCPart2})}} for more information on {{term(reference)}}.
{{latex(\end{itemize})}}

## XML Declaration

The first section of a {{term(response document)}} encoded with {{term(xml)}} {{latex(\SHOULD)}} be the {{term(xml declaration)}}.  The declaration is a single element.

An example of an {{term(xml declaration)}} would be:  

{{latex(\begin{lstlisting})}}[firstnumber=1,escapechar=|,%
caption={Example of xml declaration}, label={lst:xml-declaration}]
<?xml version="1.0" encoding="UTF-8"?>
{{latex(\end{lstlisting})}}

This element provides information regarding how the {{term(xml)}} document is encoded and the character type used for that encoding.  See the W3C website for more details on the {{term(xml)}} declaration. 

## Root Element

Every {{term(response document)}} **MUST** contain only one root element.  The MTConnect Standard defines {{term(mtconnectdevices)}}, {{term(mtconnectstreams)}}, {{term(mtconnectassets)}}, and {{term(mtconnecterror)}} as {{termplural(root element)}}. 

The {{term(root element)}} specifies a specific {{term(response document)}} and appears at the top of the document immediately following the {{term(xml declaration)}}.

### MTConnectDevices Root Element

{{term(mtconnectdevices)}} is the {{term(root element)}} for the {{term(mtconnectdevices response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.7{{latex(\textwidth)}}]{figures/mtconnectdevices-structure.png}
  {{latex(\caption{MTConnectDevices Structure})}}
   {#fig:mtconnectdevices-structure}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

{{term(mtconnectdevices)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(devices)}}.  Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(devices)}} is an {{term(xml)}} container that represents the {{term(document body)}} for an {{term(mtconnectdevices response document)}} -- see {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(devices)}} are defined in {{latex(\citetitle{MTCPart2})}}.

{{term(mtconnectdevices)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

#### MTConnectDevices Elements

An {{term(mtconnectdevices)}} element **MUST** contain a {{term(header)}} and a {{term(devices)}} element.

| Element | Description | Occurrence |
|---------|-------------|------------|
| {{term(header)}} |An {{term(xml)}} container in an {{term(mtconnect response document)}} that provides information from an {term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}. | 1 | 
| {{term(devices)}} | The {{term(xml)}} container in an {{term(mtconnect response document)}} that provides the {{term(equipment metadata)}} for each of the pieces of equipment associated with an {{term(agent)}}. | 1 |

### MTConnectStreams Root Element

{{term(mtconnectstreams)}} is the {{term(root element)}} for the {{term(mtconnectstreams response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.7{{latex(\textwidth)}}]{figures/mtconnectstreams-structure.png}
  {{latex(\caption{MTConnectStreams Structure})}}
   {#fig:mtconnectstreams-structure}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

{{term(mtconnectstreams)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(streams)}}.  

Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(streams)}} is an {{term(xml)}} container that represents the {{term(document body)}} for a {{term(mtconnectstreams response document)}} -- see {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(streams)}} are defined in {{latex(\citetitle{MTCPart3})}}.

{{term(mtconnectstreams)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

{{latex(\newpage)}}

#### MTConnectStreams Elements{{latex(\mbox)}}{}

An {{term(mtconnectstreams)}} element **MUST** contain a {{term(header)}} and a {{term(streams)}} element.

{{latex(input

### MTConnectAssets Root Element

{{term(mtconnectassets)}} is the {{term(root element)}} for the {{term(mtconnectassets response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.7{{latex(\textwidth)}}]{figures/mtconnectassets-structure.png}
  {{latex(\caption{MTConnectAssets Structure})}}
   {#fig:mtconnectassets-structure}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

{{latex(\newpage)}} 

{{term(mtconnectassets)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(assets mtconnectassets)}}.

Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(assets mtconnectassets)}} is an {{term(xml)}} container that represents the {{term(document body)}} for an {{term(mtconnectassets response document)}} -- see {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(assets mtconnectassets)}} are defined in {{latex(\citetitle{MTCPart40})}}.

{{term(mtconnectassets)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

#### MTConnectAssets Elements{{latex(\mbox)}}{}

An {{term(mtconnectassets)}} element **MUST** contain a {{term(header)}} and an {{term(assets mtconnectassets)}} element.

{{latex(input

### MTConnectError Root Element

{{term(mtconnecterror)}} is the {{term(root element)}} for the {{term(mtconnecterrors response document)}}.

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.7{{latex(\textwidth)}}]{figures/mtconnecterror-structure.png}
  {{latex(\caption{MTConnectError Structure})}}
   {#fig:mtconnecterror-structure}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

{{term(mtconnecterror)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(errors)}}. 

{{latex(\begin{note})}}
Note:	When compatibility with *Version 1.0.1* and earlier of the MTConnect Standard is required for an implementation, the {{term(mtconnecterrors response document)}} contains only a single {{term(error)}} {{term(data entity)}} and the {{term(errors)}} {{term(child element)}} {{latex(\MUSTNOT)}} appear in the document. 

{{latex(\end{note})}}

Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(errors)}} is an {{term(xml)}} container that represents the {{term(document body)}} for an {{term(mtconnecterrors response document)}} -- See {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(errors)}} are defined in {{latex(\sect{Error Information Model})}}.

{{term(mtconnecterror)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

#### MTConnectError Elements{{latex(\mbox)}}{}

An {{term(mtconnecterror)}} element **MUST** contain a {{term(header)}} and an {{term(errors)}} element.

{{latex(input

## Schema and Namespace Declaration
 {#sec:Schema and Namespace Declaration}

{{term(xml)}} provides standard methods for declaring the {{term(schema)}} and {{term(namespace)}} associated with a document encoded by {{term(xml)}}.  The declaration of the {{term(schema)}} and {{term(namespace)}} for MTConnect {{termplural(response document)}} **MUST** be structured as attributes in the {{term(root element)}} of the document.  {{term(xml)}} defines these attributes as pseudo-attributes since they provide additional information for the entire document and not just specifically for the {{term(root element)}} itself.  

{{latex(\begin{note})}}
Note:	If a {{term(response document)}} contains sections that utilize different {{termplural(schema)}} and/or {{termplural(namespace)}}, additional pseudo-attributes should appear in the document as declared using standard conventions as defined be W3C.

{{latex(\end{note})}}

For further information on declarations refer to {{latex(\apx{Schema and Namespace Declaration Information})}}.

## Document Header
 {#sec:Document Header}

The {{term(document header)}} is an {{term(xml)}} container in an {{term(mtconnect response document)}} that provides information from an {{term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}.  This {{term(xml)}} element is called {{term(header)}}.

{{term(header)}} **MUST** be the first {{term(xml)}} element following the {{term(root element)}} of any {{term(response document)}}.  The {{term(header)}} {{term(xml)}} element {{latex(\MUSTNOT)}} contain any {{termplural(child element)}}.  

The content of the {{term(header)}} element will be different for each type of {{term(response document)}}.

### Header for MTConnectDevices

The {{term(header)}} element for an {{term(mtconnectdevices response document)}} defines information regarding the creation of the document and the data storage capability of the {{term(agent)}} that generated the document.  

#### XML Schema Structure for Header for MTConnectDevices{{latex(\mbox)}}{}

The {{term(xml schema)}} in {{figure(header-schema-diagram-for-mtconnectdevices)}} represents the structure of the {{term(header)}} {{term(xml)}} element that **MUST** be provided for an {{term(mtconnectdevices response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.6{{latex(\textwidth)}}]{figures/header-schema-diagram-for-mtconnectdevices.png}
  {{latex(\caption{Header Schema Diagram for MTConnectDevices})}}
   {#fig:header-schema-diagram-for-mtconnectdevices}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Attributes for Header for MTConnectDevices{{latex(\mbox)}}{}

{{latex(\tbl{attributes-for-header-mtconnectdevices})}} defines the attributes that may be used to provide additional information in the {{term(header)}} element for an {{term(mtconnectdevices response document)}}. 

{{latex(input

{{latex(\lst{header-xml-element-for-mtconnectdevices})}} is an example of a {{term(header)}} {{term(xml)}} element for an {{term(mtconnectdevices response document)}}:

{{latex(\begin{lstlisting})}}[firstnumber=1,escapechar=|,%
caption={Example of Header XML Element for MTConnectDevices}, label={lst:header-xml-element-for-mtconnectdevices}]
<Header creationTime="2017-02-16T16:44:27Z"
  sender="MyAgent" instanceId="1268463594"
  bufferSize="131072" version="1.4.0.10"
  assetCount="54" assetBufferSize="1024"/>
{{latex(\end{lstlisting})}}

### Header for MTConnectStreams

The {{term(header)}} element for an {{term(mtconnectstreams response document)}} defines information regarding the creation of the document and additional information necessary for an application to interact and retrieve data from the {{term(agent)}}.

#### XML Schema Structure for Header for MTConnectStreams{{latex(\mbox)}}{}

The {{term(xml schema)}} in {{figure(header-schema-diagram-for-mtconnectstreams)}} represents the structure of the {{term(header)}} {{term(xml)}} element that **MUST** be provided for an {{term(mtconnectstreams response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.6{{latex(\textwidth)}}]{figures/header-schema-diagram-for-mtconnectstreams.png}
  {{latex(\caption{Header Schema Diagram for MTConnectStreams})}}
   {#fig:header-schema-diagram-for-mtconnectstreams}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Attributes for MTConnectStreams Header{{latex(\mbox)}}{}

{{latex(\tbl{attributes-for-header-mtconnectstreams})}} defines the attributes that may be used to provide additional information in the {{term(header)}} element for an {{term(mtconnectstreams response document)}}.

{{latex(input

{{latex(\lst{header-xml-element-for-mtconnectstreams})}} is an example of a {{term(header)}} {{term(xml)}} element for an {{term(mtconnectstreams response document)}}:

{{latex(\begin{lstlisting})}}[firstnumber=1,escapechar=|,%
caption={Example of Header XML Element for MTConnectStreams}, label={lst:header-xml-element-for-mtconnectstreams}]
<Header lastSequence="5430495" firstSequence="5299424"
  nextSequence="5430496" bufferSize="131072"
  version="1.4.0.12" instanceId="1579788747"
  sender="myagent" creationTime="2020-03-24T13:23:32Z"/>
{{latex(\end{lstlisting})}}

### Header for MTConnectAssets

The {{term(header)}} element for an {{term(mtconnectassets response document)}} defines information regarding the creation of the document and the storage of {{termplural(asset document)}} in the {{term(agent)}} that generated the document.  

#### XML Schema Structure for Header for MTConnectAssets{{latex(\mbox)}}{}

The {{term(xml schema)}} in {{figure(header-schema-diagram-for-mtconnectassets)}} represents the structure of the {{term(header)}} {{term(xml)}} element that **MUST** be provided for an {{term(mtconnectassets response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.6{{latex(\textwidth)}}]{figures/header-schema-diagram-for-mtconnectassets.png}
  {{latex(\caption{Header Schema Diagram for MTConnectAssets})}}
   {#fig:header-schema-diagram-for-mtconnectassets}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Attributes for Header for MTConnectAssets{{latex(\mbox)}}{}

{{latex(\tbl{attributes-for-header-mtconnectassets})}} defines the attributes that may be used to provide additional information in the {{term(header)}} element for an {{term(mtconnectassets response document)}}.

{{latex(input

{{latex(\lst{header-xml-element-for-mtconnectassets})}} is an example of a {{term(header)}} {{term(xml)}} element for an {{term(mtconnectassets response document)}}:

{{latex(\begin{lstlisting})}}[firstnumber=1,escapechar=|,%
caption={Example of Header XML Element for MTConnectAssets}, label={lst:header-xml-element-for-mtconnectassets}]
<Header creationTime="2017-02-16T16:44:27Z"
  sender="MyAgent" instanceId="1268463594"
  version="1.4.0.10" assetCount="54"
  assetBufferSize="1024"/>
{{latex(\end{lstlisting})}}

### Header for MTConnectError
 {#sec:Header for MTConnectError}

The {{term(header)}} element for an {{term(mtconnecterrors response document)}} defines information regarding the creation of the document and the data storage capability of the {{term(agent)}} that generated the document.  

#### XML Schema Structure for Header for MTConnectError{{latex(\mbox)}}{}

The {{term(xml schema)}} in {{figure(header-schema-diagram-for-mtconnecterror)}} represents the structure of the {{term(header)}} {{term(xml)}} element that **MUST** be provided for an {{term(mtconnecterrors response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.6{{latex(\textwidth)}}]{figures/header-schema-diagram-for-mtconnecterror.png}
  {{latex(\caption{Header Schema Diagram for MTConnectError})}}
   {#fig:header-schema-diagram-for-mtconnecterror}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Attributes for Header for MTConnectError{{latex(\mbox)}}{}

{{latex(\tbl{attributes-for-header-mtconnecterror})}} defines the attributes that may be used to provide additional information in the {{term(header)}} element for an {{term(mtconnecterrors response document)}}. 

{{latex(input

{{latex(\lst{header-xml-element-for-mtconnecterror})}} is an example of a {{term(header)}} {{term(xml)}} element for an {{term(mtconnecterrors response document)}}:

{{latex(\begin{lstlisting})}}[firstnumber=1,escapechar=|,%
caption={Example of Header XML Element for MTConnectError}, label={lst:header-xml-element-for-mtconnecterror}]
<Header creationTime="2017-02-16T16:44:27Z" 
  sender="MyAgent" instanceId="1268463594"
  bufferSize="131072" version="1.4.0.10"/>
{{latex(\end{lstlisting})}}

## Document Body
 {#sec:Document Body}

The {{term(document body)}} contains the information that is published by an {{term(agent)}} in response to a {{term(request)}} from a client software application.  Each {{term(response document)}} has a different {{term(xml)}} element that represents the {{term(document body)}}.

The structure of the content of the {{term(xml)}} element representing the {{term(document body)}} is defined by the {{termplural(semantic data model)}} defined for each {{term(response document)}}.

{{latex(\tbl{responsedocument-documentbody-semanticdatamodel})}} defines the relationship between each of the {{termplural(response document)}}, the {{term(xml)}} element that represents the {{term(document body)}} for each document, and the {{term(semantic data model)}} that defines the structure for the content of each of the {{termplural(response document)}}:

{{latex(input

## Extensibility
 {#sec:Extensibility}

MTConnect is an extensible standard, which means that implementers **MAY** extend the {{termplural(data model)}} defined in the various sections of the MTConnect Standard to include information required for a specific implementation.  When these {{termplural(data model)}} are encoded using {{term(xml)}}, the methods for extending these {{termplural(data model)}} are defined by the rules established for extending any {{term(xml)}} schema (see the W3C website for more details on extending {{term(xml)}} data models).

The following are typical extensions that **MAY** be considered in the MTConnect {{termplural(data model)}}:

{{latex(\begin{itemize})}}

* Additional {{term(type)}} and {{term(subtype)}} values for {{termplural(data entity)}}.

* Additional {{termplural(structural element)}} as containers.

* Additional Composition elements.

* New {{term(asset)}} types that are sub-typed from the abstract {{term(asset)}} type.

* {{termplural(child element)}} that may be added to specific {{term(xml)}} elements contained within the {{termplural(mtconnect information model)}}.  These extended elements **MUST** be identified in a separate {{term(namespace)}}.

{{latex(\end{itemize})}}

When extending an MTConnect {{term(data model)}}, there are some basic rules restricting changes to the MTConnect {{termplural(data model)}}.

When extending an MTConnect {{term(data model)}}, an implementer:

{{latex(\begin{itemize})}}

* {{latex(\MUSTNOT)}} add new value for category for {{termplural(data entity)}},

* {{latex(\MUSTNOT)}} add new {{termplural(root element)}},

* {{latex(\SHOULDNOT)}} add new {{term(top level)}} {{termplural(component term)}}, and

* {{latex(\MUSTNOT)}} add any new attributes or include any sub-elements to {{term(composition)}}.

{{latex(\begin{note})}}
Note:  Throughout the documents additional information is provided where extensibility may be acceptable or unacceptable to maintain compliance with the MTConnect Standard.

{{latex(\end{note})}}

{{latex(\end{itemize})}}

When a {{term(schema)}} representing a {{term(data model)}} is extended, the {{term(schema)}} and {{term(namespace)}} declaration at the beginning of the corresponding {{term(response document)}} **MUST** be updated to reflect the new {{term(schema)}} and {{term(namespace)}} so that a client software application can properly validate the {{term(response document)}}.

An {{term(xml)}} example of a {{term(schema)}} and {{term(namespace)}} declaration, including an extended {{term(schema)}} and {{term(namespace)}}, is shown in {{latex(\lst{extended-schema-and-namespace-declaration})}}:

{{latex(\begin{lstlisting})}}[firstnumber=1,escapechar=|,%
caption={Example of extended schema and namespace in declaration}, label={lst:extended-schema-and-namespace-declaration}]
<?xml version="1.0" encoding="UTF-8"?>
  <MTConnectDevices
   xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
   xmlns="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:m="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:x="urn:MyLocation:MyFile:MyVersion"
   xsi:schemaLocation="urn:MyLocation:MyFile:MyVersion
     /schemas/MyFileName.xsd" />
{{latex(\end{lstlisting})}}

In this example:

{{latex(\begin{itemize})}}

* {{latex(\cfont{xmlns:x})}} is added in Line 6 to identify the {{term(xml schema)}} instance for the extended {{term(schema)}}.   {{termplural(element name)}} identified with an "{{latex(\cfont{x})}}" prefix are associated with this specific {{term(xml schema)}} instance.

{{latex(\begin{note})}}
Note: The "{{latex(\cfont{x})}}" prefix **MAY** be replaced with any prefix that the implementer chooses for identifying the extended {{term(schema)}} and {{term(namespace)}}.

{{latex(\end{note})}}

* {{latex(\cfont{xsi:schemaLocation})}} is modified in Line 7 to associate the {{term(namespace)}} URN with the URL specifying the location of {{term(schema)}} file.

* {{latex(\cfont{MyLocation})}}, {{latex(\cfont{MyFile})}}, {{latex(\cfont{MyVersion})}}, and {{latex(\cfont{MyFileName})}} in Lines 6 and 7 **MUST** be replaced by the actual name, version, and location of the extended {{term(schema)}}.

{{latex(\end{itemize})}}

When an extended {{term(schema)}} is implemented, each {{term(structural element)}}, {{term(data entity)}}, and {{term(mtconnect asset)}} defined in the extended {{term(schema)}} **MUST** be identified in each respective {{term(response document)}} by adding a prefix to the {{term(xml)}} {{term(element name)}} associated with that {{term(structural element)}}, {{term(data entity)}}, or {{term(mtconnect asset)}}.  The prefix identifies the {{term(schema)}} and {{term(namespace)}} where that {{term(xml)}} Element is defined. 

# Protocol and Messaging
 {#sec:Protocol and Messaging}

An {{term(agent)}} performs two {{term(major)}} communications tasks.  It collects information from pieces of equipment and it publishes MTConnect {{termplural(response document)}} in response to {{termplural(request)}} from client software applications.

The MTConnect Standard does not address the method used by an {{term(agent)}} to collect information from a piece of equipment.  The relationship between the {{term(agent)}} and a piece of equipment is implementation dependent.  The {{term(agent)}} may be fully integrated into the piece of equipment or the {{term(agent)}} may be independent of the piece of equipment.  Implementation of the relationship between a piece of equipment and an {{term(agent)}} is the responsibility of the supplier of the piece of equipment and/or the implementer of the {{term(agent)}}.

The communications mechanism between an {{term(agent)}} and a client software application requires the following primary components:

{{latex(\begin{itemize})}}
* {{term(physical connection)}}:  The network transmission technologies that physically interconnect an {{term(agent)}} and a client software application.  Examples of a {{term(physical connection)}} would be an Ethernet network or a wireless connection.

* Transport Protocol:  A set of capabilities that provide the rules and procedures used to transport information between an {{term(agent)}} and a client software application through a {{term(physical connection)}}.

* {{term(application programming interface)}}:  The {{term(request)}} and {{term(response)}} interactions that occur between an {{term(agent)}} and a client software application.

* {{term(message term)}}:  The content of the information that is exchanged.  The {{term(message term)}} includes both the content of the MTConnect {{term(response document)}} and any additional information required for the client software application to interpret the {{term(response document)}}.

{{latex(\begin{note})}}
Note: The {{termplural(physical connection)}}, {{termplural(transport protocol)}}, and {{term(application programming interface)}} supported by an {{term(agent)}} are independent of the {{term(message term)}} itself; i.e., the information contained in the MTConnect {{termplural(response document)}} is not changed based on the methods used to transport those documents to a client software application.

{{latex(\end{note})}}
{{latex(\end{itemize})}}

An {{term(agent)}} **MAY** support multiple methods for communicating with client software applications.  The MTConnect Standard specifies one methodology for communicating that **MUST** be supported by every {{term(agent)}}.  This methodology is a {{term(rest)}}, which defines a stateless, client-server communications architecture.  This REST interface is the architectural pattern that specifies the exchange of information between an {{term(agent)}} and a client software application.  REST dictates that a server has no responsibility for tracking or coordinating with a client software application regarding which information or how much information the client software application may request from a server.  This removes the burden for a server to keep track of client sessions.  An {{term(agent)}} **MUST** be implemented as a server supporting the RESTful interface. 

# HTTP Messaging Supported by an Agent

This section describes the application of {{term(http messaging)}} applied to a REST interface that **MUST** be supported by an {{term(agent)}} to realize the MTConnect {{term(requestresponse)}} information exchange functionality.

## REST Interface

An {{term(agent)}} **MUST** provide a REST interface that supports HTTP version 1.0 to communicate with client applications.  This interface **MUST** support HTTP (RFC7230) and use URIs (RFC3986) to identify specific information requested from an {{term(agent)}}.  HTTP is most often implemented on top of the Transmission Control Protocol (TCP) that provides an ordered byte stream of data and the Internet Protocol (IP) that provides unified addressing and routing between computers.  However, additional interfaces to an {{term(agent)}} may be implemented in conjunction with any other communications technologies.

The REST interface supports an {{term(application programming interface)}} (API) that adheres to the architectural principles of a stateless, uniform interface to retrieve data and other information related to either pieces of equipment or {{termplural(mtconnect asset)}}.  The API allows for access, but not modification of data stored within the {{term(agent)}} and is nullipotent, meaning it will not produce any side effects on the information stored in an {{term(agent)}} or the function of the {{term(agent)}} itself.

{{term(http messaging)}} is comprised of two basic functions -- an {{term(http request)}} and an {{term(http response)}}.  A client software application forms a {{term(request)}} for information from an {{term(agent)}} by specifying a specific set of information using an {{term(http request)}}.  In response, an {{term(agent)}} provides either an {{term(http response)}} or replies with an {{term(http error message)}} as defined below. 

## HTTP Request

The MTConnect Standard defines that an {{term(agent)}} **MUST** support the {{latex(\cfont{HTTP GET})}} verb -- no other HTTP methods are required to be supported.

An {{term(http request)}} **MAY** include three sections:

{{latex(\begin{itemize})}}
* an {{term(http request line)}}

* {{termplural(http header field)}}

* an {{term(http body)}}
{{latex(\end{itemize})}}

The MTConnect Standard defines that an {{term(http request)}} issued by a client application {{latex(\SHOULD)}} only have two sections:

{{latex(\begin{itemize})}}
* an {{term(http request line)}}

* {{termplural(http header field)}}
{{latex(\end{itemize})}}

The {{term(http request line)}} identifies the specific information being requested by the client software application.  If an {{term(agent)}} receives any information in an {{term(http request)}} that is not specified in the MTConnect Standard, the {{term(agent)}} **MAY** ignore it.  

The structure of an {{term(http request line)}} consists of the following portions:

{{latex(\begin{itemize})}}
* {{term(http request method)}}: {{latex(\cfont{GET})}}

* {{term(http request url)}}:  {{latex(\cfont{http://<authority>/<path>[?<query>]})}}

* {{term(http version)}}: {{latex(\cfont{HTTP/1.0})}}
{{latex(\end{itemize})}}

For the following discussion, the {{term(http request url)}} will only be considered since the Method will always be {{latex(\cfont{GET})}} and the MTConnect Standard only requires {{latex(\cfont{HTTP/1.0})}}.

### authority Portion of an HTTP Request Line

The {{term(authority http request)}} portion consists of the DNS name or IP address associated with an {{term(agent)}} and an optional TCP port number [:{{term(port http request)}}] that the {{term(agent)}} is listening to for incoming {{termplural(request)}} from client software applications.  If the port number is the default Port 80, {{term(port http request)}} is not required.

Example forms for {{term(authority http request)}} are:

{{latex(\begin{itemize})}}
* {{latex(\cfont{http://machine/ })}}

* {{latex(\cfont{http://machine:5000/ })}}

* {{latex(\cfont{http://192.168.1.2:5000/})}}
{{latex(\end{itemize})}}

### path Portion of an HTTP Request Line

The {{latex(\cfont{<Path>})}} portion of the {{term(http request line)}} has the follow segments:

{{latex(\begin{itemize})}}
* {{latex(\cfont{/<name or uuid>/<request>})}}
{{latex(\end{itemize})}}

In this portion of the {{term(http request line)}}, name or uuid designates that the information to be returned in a {{term(response document)}} is associated with a specific piece of equipment that has published data to the {{term(agent)}}.  See Part 2 - {{termplural(device information model)}} for details on name or uuid for a piece of equipment.

{{latex(\begin{note})}}
Note:  If {{term(name)}} or {{term(uuid)}} are not specified in the {{term(http request line)}}, an {{term(agent)}} **MUST** return the information for all pieces of equipment that have published data to the {{term(agent)}} in the {{term(response document)}}.

{{latex(\end{note})}}

In the {{latex(\cfont{<Path>})}} portion of the {{term(http request line)}}, {{latex(\cfont{<request>})}} designates one of the {{termplural(request)}} defined in {{latex(\sect{Request/Response Information Exchange})}}.  The value for {{latex(\cfont{<request>})}} **MUST** be {{term(probe httprequest)}}, {{term(current httprequest)}}, {{term(sample httprequest)}}, or {{term(asset httprequest)}}(s) representing the {{term(probe request)}}, {{term(current request)}}, {{term(sample request)}}, and {{term(asset request)}} respectively.  

### query Portion of an HTTP Request Line

The [{{latex(\cfont{?<query>})}}] portion of the {{term(http request line)}} designates an HTTP {{term(query)}}.  {{term(query)}} is a string of parameters that define filters used to refine the content of a {{term(response document)}} published in response to an {{term(http request)}}. 

## MTConnect Request/Response Information Exchange Implemented with HTTP

An {{term(agent)}} **MUST** support {{termplural(probe request)}}, {{termplural(current request)}}, {{termplural(sample request)}}, and {{termplural(asset request)}}.

The following sections define how the {{term(http request line)}} is structured to support each of these types of {{termplural(request)}} and the information that an {{term(agent)}} **MUST** provide in response to these {{termplural(request)}}.

### Probe Request Implemented Using HTTP

An {{term(agent)}} responds to a {{term(probe request)}} with an {{term(mtconnectdevices response document)}} that contains the {{term(equipment metadata)}} for pieces of equipment that are requested and currently represented in the {{term(agent)}}.  

There are two forms of the {{term(probe request)}}:

{{latex(\begin{itemize})}}
* The first form includes an {{term(http request line)}} that does not specify a specific path portion ({{term(name)}} or {{term(uuid)}}).  In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectdevices response document)}} with information for all pieces of equipment represented in the {{term(agent)}}.

{{latex(\cfont{1.	http://<authority>/probe})}}

* The second form includes an {{term(http request line)}} that specifies a specific path portion that defines either a {{term(name)}} or {{term(uuid)}}.  In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectdevices response document)}} with information for only the one piece of equipment associated with that {{term(name)}} or {{term(uuid)}}.

{{latex(\cfont{1.	http://<authority>/<name or uuid>/probe})}}
{{latex(\end{itemize})}}

#### Path Portion of the HTTP Request Line for a Probe Request{{latex(\mbox)}}{}

The following segments of {{term(path query)}} **MUST** be supported in an {{term(http request line)}} for a {{term(probe request)}}: 

{{latex(input

#### Query Portion of the HTTP Request Line for a Probe Request{{latex(\mbox)}}{}

The {{term(http request line)}} for a {{term(probe request)}} {{latex(\SHOULDNOT)}} contain a {{term(query http request)}}.  If the {{term(request)}} does contain a {{term(query http request)}}, the {{term(agent)}} **MUST** ignore the {{term(query http request)}}.  

#### Response to a Probe Request{{latex(\mbox)}}{}

The {{term(response)}} to a {{term(probe request)}} {{latex(\SHOULD)}} be an {{term(mtconnectdevices response document)}} for one or more pieces of equipment as designated by the {{term(path query)}} portion of the {{term(request)}}.

The {{term(response document)}} returned in response to a {{term(probe request)}} **MUST** always provide the most recent information available to an {{term(agent)}}.

The {{term(response)}} **MUST** also include an {{term(http status code)}}.   If problems are encountered by an {{term(agent)}} while responding to a {{term(probe request)}}, the {{term(agent)}} **MUST** also publish an {{term(mtconnecterrors response document)}}.

#### HTTP Status Codes for a Probe Request{{latex(\mbox)}}{}

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(probe request)}}:

{{latex(input

{{latex(\pagebreak)}}

### Current Request Implemented Using HTTP
 {#sec:Current Request Implemented Using HTTP}

An {{term(agent)}} responds to a {{term(current request)}} with an {{term(mtconnectstreams response document)}} that contains the current value of {{termplural(data entity)}} associated with each piece of {{term(streaming data)}} available from the {{term(agent)}}, subject to any filtering defined in the {{term(request)}}.

There are two forms of the {{term(current request)}}:

{{latex(\begin{itemize})}}
* The first form is given without a specific path portion ({{term(name)}} or {{term(uuid)}}).  In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectstreams response document)}} with information for all pieces of equipment represented in the {{term(buffer)}} of the {{term(agent)}}.

{{latex(\cfont{1.	http://<authority>/current[?query]})}}

* The second form includes a specific path portion that defines either a {{term(name)}} or {{term(uuid)}}.  In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectstreams response document)}} with information for only the one piece of equipment associated with the {{term(name)}} or {{term(uuid)}} defined in the {{term(request)}}.

{{latex(\cfont{1.	http://<authority>/<name or uuid>/current[?query]})}}
{{latex(\end{itemize})}}

#### Path Portion of the HTTP Request Line for a Current Request{{latex(\mbox)}}{}

The following segments of path **MUST** be supported for an {{term(http request line)}} for a {{term(current request)}}:

{{latex(input

#### Query Portion of the HTTP Request Line for a Current Request{{latex(\mbox)}}{}

A {{term(query)}} may be used to more precisely define the specific information to be included in a {{term(response document)}}.   Multiple parameters may be used in a {{term(query)}} to further refine the information to be included.   When multiple parameters are provided, each parameter is separated by an ampersand (\&) character and each parameter appears only once in the {{term(query)}}.  The parameters within the {{term(query)}} may appear in any sequence.

The following {{term(query http request)}} parameters **MUST** be supported in an {{term(http request line)}} for a {{term(current request)}}:

{{latex(input

#### Response to a Current Request{{latex(\mbox)}}{}

The {{term(response)}} to a {{term(current request)}} {{latex(\SHOULD)}} be an {{term(mtconnectstreams response document)}} for one or more pieces of equipment designated by the {{term(path query)}} portion of the {{term(request)}}.

The {{term(response)}} to a {{term(current request)}} **MUST** always provide the most recent information available to an {{term(agent)}} or, when the {{term(at query)}} parameter is specified, the value of the data at the given {{term(sequence number)}}.

The {{termplural(data entity)}} provided in the {{term(mtconnectstreams response document)}} will be limited to those specified in the combination of the {{term(path query)}} segment of the {{term(current request)}} and the value of the {{term(xpath)}} defined for the {{term(path query)}} attribute provided in the {{term(query http request)}} segment of that {{term(request)}}. 

#### HTTP Status Codes for a Current Request{{latex(\mbox)}}{}

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(current request)}}:

{{latex(input

### Sample Request Implemented Using HTTP

An {{term(agent)}} responds to a {{term(sample request)}} with an {{term(mtconnectstreams response document)}} that contains a set of values for {{termplural(data entity)}} currently available for {{term(streaming data)}} from the {{term(agent)}}, subject to any filtering defined in the {{term(request)}}.

There are two forms to the {{term(sample request)}}:

{{latex(\begin{itemize})}}
* The first form is given without a specific {{term(path query)}} portion ({{term(name)}} or {{term(uuid)}}).  In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectstreams response document)}} with information for all pieces of equipment represented in the {{term(agent)}}.

{{latex(\cfont{1.	http://<authority>/sample[?query]})}}

* The second form includes a specific {{term(path query)}} portion that defines either a {{term(name)}} or {{term(uuid)}}.

In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectstreams response document)}} with information for only the one piece of equipment associated with the {{term(name)}} or {{term(uuid)}} defined in the {{term(request)}}.

{{latex(\cfont{1.	http://<authority>/<name or uuid>/sample?query})}}
{{latex(\end{itemize})}}

#### Path Portion of the HTTP Request Line for a Sample Request{{latex(\mbox)}}{}

The following segments of {{term(path query)}} **MUST** be supported in the {{term(http request line)}} for a {{term(sample request)}}:

{{latex(input

#### Query Portion of the HTTP Request Line for a Sample Request{{latex(\mbox)}}{}
 {#sec:Query Portion of the HTTP Request Line for a Sample Request}

A {{term(query)}} may be used to more precisely define the specific information to be included in a {{term(response document)}}.   Multiple parameters may be used in a {{term(query)}} to further refine the information to be included.   When multiple parameters are provided, each parameter is separated by an \& character and each parameter appears only once in the {{term(query)}}.  The parameters within the {{term(query)}} may appear in any sequence.

The following {{term(query http request)}} parameters **MUST** be supported in an {{term(http request line)}} for a {{term(sample request)}}:

{{latex(input

#### Response to a Sample Request{{latex(\mbox)}}{}

The {{term(response)}} to a {{term(sample request)}} {{latex(\SHOULD)}} be an {{term(mtconnectstreams response document)}} for one or more pieces of equipment designated by the {{term(path query)}} portion of the {{term(request)}}.

The {{term(response)}} to a {{term(sample request)}} **MUST** always provide the most recent information available to an {{term(agent)}} or, when the {{term(at query)}} parameter is specified, the value of the data at the given {{term(sequence number)}}.

The {{termplural(data entity)}} provided in the {{term(mtconnectstreams response document)}} will be limited to those specified in the combination of the {{term(path query)}} segment of the {{term(sample request)}} and the value of the {{term(xpath)}} defined for the {{term(path query)}} attribute provided in the {{term(query http request)}} segment of that {{term(request)}}.

When the value of {{term(from query)}} references the value of the next {{term(sequence number)}} ({{term(nextsequence)}}) and there are no additional {{termplural(data entity)}} available in the buffer, the response document will have an empty {{latex(\cfont{<Streams/>})}} element in the {{term(mtconnectstreams)}} document to indicate no data is available at the point in time that the {{term(agent)}} published the {{term(response document)}}.

#### HTTP Status Codes for a Sample Request{{latex(\mbox)}}{}

The following {{termplural(http status code)}} **MUST** be supported as possible responses to a {{term(sample request)}}:

{{latex(input

### Asset Request Implemented Using HTTP

An {{term(agent)}} responds to an {{term(asset request)}} with an {{term(mtconnectassets response document)}} that contains information for {{termplural(mtconnect asset)}} from the {{term(agent)}}, subject to any filtering defined in the {{term(request)}}.

There are multiple forms to the {{term(asset request)}}:

{{latex(\begin{itemize})}}
* The first form is given without a specific {{term(path query)}} portion ({{term(name)}} or {{term(uuid)}}).  In response to this {{term(request)}}, the {{term(agent)}} returns an {{term(mtconnectassets response document)}} that contains information for all {{term(asset document)}} represented in the {{term(agent)}}.

{{latex(\cfont{1.	http://<authority>/assets})}}

* The second form includes a specific {{term(path query)}} portion that defines the identity ({{term(assetid path)}}) for one or more specific {{termplural(asset document)}}.  In response to this {{term(request)}}, the {{term(agent)}} returns an{{term(mtconnectassets response document)}} that contains information for the specific Assets represented in the {{term(agent)}} and defined by each of the {{term(assetid path)}} values provided in the {{term(request)}}.  Each {{term(assetid path)}} is separated by a ";".

{{latex(\cfont{1.	http://<authority>/asset/asset\_id;asset\_id;asset\_id....})}}
{{latex(\end{itemize})}}

{{latex(\begin{note})}}
Note: An {{term(http request line)}} may include combinations of {{term(path query)}} and {{term(query http request)}} to achieve the desired set of {{termplural(asset document)}} to be included in a specific {{term(mtconnectassets response document)}}.

{{latex(\end{note})}}

#### Path Portion of the HTTP Request Line for an Asset Request{{latex(\mbox)}}{}

The following segments of path **MUST** be supported in the {{term(http request line)}} for an {{term(asset request)}}:

{{latex(input

#### Query Portion of the HTTP Request Line for an Asset Request{{latex(\mbox)}}{}

A {{term(query)}} may be used to more precisely define the specific information to be included in a {{term(response document)}}.   Multiple parameters may be used in a {{term(query)}} to further refine the information to be included.  When multiple parameters are provided, each parameter is separated by an \& character and each parameter appears only once in the {{term(query)}}.  The parameters within the {{term(query)}} may appear in any sequence.

The following {{term(query http request)}} parameters **MUST** be supported in an {{term(http request line)}} for an {{term(asset request)}}:

{{latex(input

#### Response to an Asset Request{{latex(\mbox)}}{}

The {{term(response)}} to an {{term(asset request)}} {{latex(\SHOULD)}} be an {{term(mtconnectassets response document)}} containing information for one or more {{termplural(asset document)}} designated by the {{term(request)}}.  
The {{term(response)}} to an {{term(asset request)}} **MUST** always provide the most recent information available to an {{term(agent)}}.

The {{termplural(asset document)}} provided in the {{term(mtconnectassets response document)}} will be limited to those specified in the combination of the {{term(path query)}} segment of the {{term(asset request)}} and the parameters provided in the {{term(query http request)}} segment of that {{term(request)}}.

If the {{term(removed)}} query parameter is not provided with a value of {{term(true removed)}}, {{termplural(asset document)}} for {{termplural(asset)}} that have been marked as removed will not be provided in the response. 

#### HTTP Status Codes for a Asset Request{{latex(\mbox)}}{}

The following {{termplural(http status code)}} **MUST** be supported as possible responses to an {{term(asset request)}}:

{{latex(input

### HTTP Errors

When an {{term(agent)}} receives an {{term(http request)}} that is incorrectly formatted or is not supported by the {{term(agent)}}, the {{term(agent)}} **MUST** publish an {{term(http error message)}} which includes a specific status code from the tables above indicating that the {{term(request)}} could not be handled by the {{term(agent)}}.

Also, if the {{term(agent)}} experiences an internal error and is unable to provide the requested {{term(response document)}}, it **MUST** publish an {{term(http error message)}} that includes a specific status code from the table above.

When an {{term(agent)}} encounters an error in interpreting or responding to an {{term(http request)}}, the {{term(agent)}} **MUST** also publish an {{term(mtconnecterrors response document)}} that provides additional details about the error.  See {{latex(\sect{Error Information Model})}} for details on the {{term(mtconnecterrors response document)}}.  

### Streaming Data
 {#sec:Streaming Data}

HTTP {{term(data streaming)}} is a method for a server to provide a continuous stream of information in response to a single {{term(request)}} from a client software application.  {{term(data streaming)}} is a version of a {{term(publishsubscribe)}} method of communications.

When an {{term(http request)}} includes an {{term(interval query)}} <{{term(query http request)}}> parameter, an {{term(agent)}} **MUST** provide data with a minimum delay between the end of one data transmission and the beginning of the next data transmission defined by the value (in milliseconds) provided for {{term(interval query)}} parameter.  A value of zero (0) for the {{term(interval query)}} parameter indicates that the {{term(agent)}} should deliver data at the highest rate possible.

The format of the response **MUST** use a MIME encoded message with each section separated by a MIME boundary.  Each section **MUST** contain an entire {{term(mtconnectstreams response document)}}. 

If there are no available {{termplural(data entity)}} to be published after the {{term(interval query)}} time has elapsed, an {{term(agent)}} **MUST** wait until additional information is available to be published.  If no new no new information is available to be published within the time defined by the {{term(heartbeat query)}} parameter, the {{term(agent)}} **MUST** then send a new section to ensure the receiver that the {{term(agent)}} is functioning correctly.  In this case, the content of the {{term(mtconnectstreams)}} document **MUST** be empty since no data is available.

For more information on MIME see IETF RFC 1521 and RFC 822.  

An example of the format for a {{term(http request)}} that  includes an {{term(interval query)}} parameter is:

```
http://localhost:5000/sample?interval=1000
```
{: caption="Example for HTTP Request with interval parameter" label="example-for-http-request-with-interval-parameter"}

HTTP Response Header:

```
HTTP/1.1 200 OK
Connection: close
Date: Sat, 13 Mar 2010 08:33:37 UTC
Status: 200 OK
Content-Disposition: inline
X-Runtime: 144ms
Content-Type: multipart/x-mixed-replace;boundary=
a8e12eced4fb871ac096a99bf9728425
Transfer-Encoding: chunked
```
{: caption="HTTP Response header" label="http-response-header"}

Lines 1-9 in {{latex(\lst{http-response-header})}} represent a standard header for a MIME {{latex(\cfont{multipart/x-mixed-replace})}} message.  The boundary is a separator for each section of the stream. Lines 7-8 indicate this is a multipart MIME message and the boundary between sections. 

With streaming protocols, the {{latex(\cfont{Content-length})}} **MUST** be omitted and {{latex(\cfont{Transfer-Encoding})}} **MUST** be set to {{latex(\cfont{chunked})}} (line 9). See IETF RFC 7230 for a full description of the HTTP protocol and chunked encoding.
{{latex(\begin{lstlisting})}}[firstnumber=10,escapechar=|,%
    caption={HTTP Response header 2},label={lst:http-response-header-2}]
--a8e12eced4fb871ac096a99bf9728425
Content-type: text/xml
Content-length: 887

<?xml version="1.0" ecoding="UTF-8"?>
<MTConnectStreams ...>...
{{latex(\end{lstlisting})}}

Each section of the document begins with a boundary preceded by two hyphens ({{latex(\cfont{--})}}). The {{latex(\cfont{Content-type})}} and {{latex(\cfont{Content-length})}} MIME header fields **MUST** be provided for each section and **MUST** be followed by {{latex(\cfont{<CR><LF><CR><LF>})}} (ASCII code for {{latex(\cfont{<CR>})}} is 13 and {{latex(\cfont{<LF>})}} is 10) before the {{term(xml)}} document. The header and the {{latex(\cfont{<CR><LF><CR><LF>})}} {{latex(\MUSTNOT)}} be included in the computation of the content length.

An {{term(agent)}} **MUST** continue to stream results until the client closes the connection.  The {{term(agent)}} {{latex(\MUSTNOT)}} stop the streaming for any other reason other than the {{term(agent)}} process shutting down or the client application becoming unresponsive and not receiving data (as indicated by not consuming data and the write operation blocking).

#### Heartbeat{{latex(\mbox)}}{}

When {{term(streaming data)}} is requested from a {{term(sample request)}}, an {{term(agent)}} **MUST** support a {{term(heartbeat)}} to indicate to a client application that the HTTP connection is still viable during times when there is no new data available to be published.  The {{term(heartbeat)}} is indicated by an {{term(agent)}} by sending an MTConnect {{term(response document)}} with an empty Steams container (See {{latex(\citetitle{MTCPart3})}}, *Section 4.1 Streams* for more details on the {{term(streams)}} container) to the client software application.

The {{term(heartbeat)}} **MUST** occur on a periodic basis given by the optional {{term(heartbeat query)}} query parameter and **MUST** default to 10 seconds.  An {{term(agent)}} **MUST** maintain a separate {{term(heartbeat)}} for each client application for which the {{term(agent)}} is responding to a {{term(data streaming)}} {{term(request)}}.

An {{term(agent)}} **MUST** begin calculating the interval for the time-period of the {{term(heartbeat)}} for each client application immediately after a {{term(response document)}} is published to that specific client application.

The {{term(heartbeat)}} remains in effect for each client software application until the {{term(data streaming)}} {{term(request)}} is terminated by either the {{term(agent)}} or the client application.


### References
 {#sec:References}

A {{term(structural element)}} **MAY** include a set of {{termplural(reference term)}} of the following types that **MAY** alter the content of the {{termplural(mtconnectstreams response document)}} published in response to a {{term(current request)}} or a {{term(sample request)}} as specified:

{{latex(\begin{itemize})}}
* A {{term(component term)}} {{term(reference term)}} ({{term(componentref)}}) modifies the set of resulting {{termplural(data entity)}}, limited by a path query parameter of a {{term(current request)}} or {{term(sample request)}}, to include the {{termplural(data entity)}} associated with the {{term(structural element)}} whose value for its {{term(id)}} attribute matches the value provided for the {{term(idref)}} attribute of the {{term(componentref)}} element. Additionally, {{termplural(data entity)}} defined for any {{term(lower level)}} {{term(structural element)}}(s) associated with the identified {{term(structural element)}} **MUST** also be returned. The result is equivalent to appending {{latex(\cfont{//[@id=<"idRef">]})}} to the path query parameters of the {{term(current request)}} or {{term(sample request)}}. See {{latex(\sect{Current Request Implemented Using HTTP})}} for more details on path queries.

* A {{term(data item)}} {{term(reference term)}} ({{term(dataitemref)}}) modifies the set of resulting {{termplural(data entity)}}, limited by a path query parameter of a {{term(current request)}} or {{term(sample request)}}, to include the {{term(data entity)}} whose value for its {{term(id)}} attribute matches the value provided for the {{term(idref)}} attribute of the {{term(dataitemref)}} element. The result is equivalent to appending {{latex(\cfont{//[@id=<"idRef">]})}} to the path query parameters of the {{term(current request)}} or {{term(sample request)}}. See {{latex(\sect{Current Request Implemented Using HTTP})}} for more details on path queries.
{{latex(\end{itemize})}}

# Error Information Model
 {#sec:Error Information Model}

The {{term(error information model)}} establishes the rules and terminology that describes the {{term(response document)}} returned by an {{term(agent)}} when it encounters an error while interpreting a {{term(request)}} for information from a client software application or when an {{term(agent)}} experiences an error while publishing the {{term(response)}} to a {{term(request)}} for information.      

An {{term(agent)}} provides the information regarding errors encountered when processing a {{term(request)}} for information by publishing an {{term(mtconnecterrors response document)}} to the client software application that made the {{term(request)}} for information.

## MTConnectError Response Document

The {{term(mtconnecterrors response document)}} is comprised of two sections: {{term(header)}} and {{term(errors)}}.

The {{term(header)}} section contains information defining the creation of the document and the data storage capability of the {{term(agent)}} that generated the document.  (See {{latex(\sect{Header for MTConnectError})}})

The {{term(errors)}} section of the {{term(mtconnecterrors response document)}} is a {{term(structural element)}} that organizes {{termplural(data entity)}} describing each of the errors reported by an {{term(agent)}}.   

### Structural Element for MTConnectError

{{termplural(structural element)}} are {{term(xml)}} elements that form the logical structure for an {{term(xml)}} document.  The {{term(mtconnecterrors response document)}} has only one {{term(structural element)}}.  This {{term(structural element)}} is {{term(errors)}}.   {{term(errors)}} is an {{term(xml)}} container element that organizes the information and data associated with all errors relevant to a specific {{term(request)}} for information.

The following {{term(xml schema)}} represents the structure of the {{term(errors)}} {{term(xml)}} element.

![Errors Schema Diagram](figures/errors-schema-diagram.png "errors-schema-diagram")


{{latex(input

> Note:	When compatibility with Version 1.0.1 and earlier of the MTConnect Standard is required for an implementation, the {{term(mtconnecterrors response document)}} contains only a single {{term(error)}} {{term(data entity)}} and the {{term(errors)}} {{term(structural element)}} {{latex(\MUSTNOT)}} appear in the document. 

{{latex(\clearpage)}}

### Error Data Entity

When an {{term(agent)}} encounters an error when responding to a {{term(request)}} for information from a client software application, the information describing the error(s) is reported as a {{term(data entity)}} in an {{term(mtconnecterrors response document)}}.   {{termplural(data entity)}} are organized in the {{term(errors)}} {{term(xml)}} container.

There is only one type of {{term(data entity)}} defined for an {{term(mtconnecterrors response document)}}.  That {{term(data entity)}} is called {{term(error)}}.

The following is an illustration of the structure of an {{term(xml)}} document demonstrating how {{term(error)}} {{termplural(data entity)}} are reported in an {{term(mtconnecterrors response document)}}:

~~~~xml
<MTConnectError}>
  <Header/>
  <Errors>
    <Error/>
    <Error/>
    <Error/>
  </Errors>
</MTConnectError}>    
~~~~
{: caption="Example of Error in MTConnectError" label="error-in mtconnecterror" }

The {{term(errors)}} element **MUST** contain at least one {{term(data entity)}}.  Each {{term(data entity)}} describes the details for a specific error reported by an {{term(agent)}} and is represented by the {{term(xml)}} element named {{term(error)}}.

{{term(error)}} {{term(xml)}} elements **MAY** contain both attributes and {{term(cdata)}} that provide details further defining a specific error.  The {{term(cdata)}} **MAY** provide the complete text provided by an {{term(agent)}} for the specific error.  

#### XML Schema Structure for Error{{latex(\mbox)}}{}

The {{term(xml schema)}} in {{figure(error-schema-diagram)}} represents the structure of an {{term(error)}} {{term(xml)}} element showing the attributes defined for {{term(error)}}.

![Error Schema Diagram](figures/error-schema-diagram.png "error-schema-diagram")

#### Attributes for Error{{latex(\mbox)}}{}

{{term(error)}} has one attribute.  {{latex(\tbl{attributes-for-error})}} defines this attribute that provides additional information for an {{term(error)}} {{term(xml)}} element.   

{{latex(input

#### Values for errorCode

There is a limited vocabulary defined for {{term(errorcode)}}.  The value returned for {{term(errorcode)}} **MUST** be one of the following:

{{latex(\newpage)}}

{{latex(input

#### CDATA for Error{{latex(\mbox)}}{}

The {{term(cdata)}} for {{term(error)}} contains a textual description of the error and any additional information an {{term(agent)}} is capable of providing regarding a specific error.  The {{term(valid data value)}} returned for {{term(error)}} **MAY** be any text string.

### Examples for MTConnectError

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
  <MTConnectError
  xmlns="urn:mtconnect.org:MTConnectError:1.4"
  xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
  xsi:schemaLocation="urn:mtconnect.org:MTConnectError
    :1.4/schemas/MTConnectError_1.4.xsd">
  <Header creationTime="2010-03-12T12:33:01Z"
    sender="MyAgent" version="1.4.1.10" 
    bufferSize="131000" instanceId="1383839" />
  <Errors>
    <Error errorCode="OUT_OF_RANGE" >Argument was 
      out of range</Error>
    <Error errorCode="INVALID_XPATH" >Bad 
      path</Error>
  </Errors>
</MTConnectError>
~~~~
{: caption="Example of structure for MTConnectError" label="structure-for-mtconnecterror"}

{{latex(\lst{structure-for-mtconnecterror-when-backward-compatibility-is-required})}} is an example demonstrating the structure of an {{term(mtconnecterrors response document)}} when backward compatibility with Version 1.0.1 and earlier of the MTConnect Standard is required.  In this case, the {{term(document body)}} contains only a single {{term(error)}} {{term(data entity)}} and the {{term(errors)}} {{term(structural element)}} {{latex(\MUSTNOT)}} appear in the document. 

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<MTConnectError
  xmlns="urn:mtconnect.org:MTConnectError:1.1"
  xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
  xsi:schemaLocation="urn:mtconnect.org:MTConnectError
    :1.1/schemas/MTConnectError_1.1.xsd">
  <Header creationTime="2010-03-12T12:33:01Z"
    sender="MyAgent" version="1.1.0.10" 
    bufferSize="131000" instanceId="1383839" />
  <Error errorCode="OUT_OF_RANGE" >Argument was out 
    of range</Error>
</MTConnectError>
~~~~
{: caption="Example of structure for MTConnectError when backward compatibility is required" label="structure-for-mtconnecterror-when-backward-compatibility-is-required"}

