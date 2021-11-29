## Schema and Namespace Declaration

{{term(xml)}} provides standard methods for declaring the {{term(schema)}} and {{term(namespace)}} associated with a document encoded by {{term(xml)}}.  The declaration of the {{term(schema)}} and {{term(namespace)}} for MTConnect {{termplural(response document)}} **MUST** be structured as attributes in the {{term(root element)}} of the document.  {{term(xml)}} defines these attributes as pseudo-attributes since they provide additional information for the entire document and not just specifically for the {{term(root element)}} itself.  

{{latex(\begin{note})}}
Note:	If a {{term(response document)}} contains sections that utilize different {{termplural(schema)}} and/or {{termplural(namespace)}}, additional pseudo-attributes should appear in the document as declared using standard conventions as defined be W3C.

{{latex(\end{note})}}

For further information on declarations refer to {{latex(\apx{Schema and Namespace Declaration Information})}}.

## Document Header

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

#### Attributes for Header for MTConnectAssets

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

The {{term(header)}} element for an {{term(mtconnecterrors response document)}} defines information regarding the creation of the document and the data storage capability of the {{term(agent)}} that generated the document.  

#### XML Schema Structure for Header for MTConnectError

The {{term(xml schema)}} in {{figure(header-schema-diagram-for-mtconnecterror)}} represents the structure of the {{term(header)}} {{term(xml)}} element that **MUST** be provided for an {{term(mtconnecterrors response document)}}.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.6{{latex(\textwidth)}}]{figures/header-schema-diagram-for-mtconnecterror.png}
  {{latex(\caption{Header Schema Diagram for MTConnectError})}}
   {#fig:header-schema-diagram-for-mtconnecterror}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Attributes for Header for MTConnectError

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

The {{term(document body)}} contains the information that is published by an {{term(agent)}} in response to a {{term(request)}} from a client software application.  Each {{term(response document)}} has a different {{term(xml)}} element that represents the {{term(document body)}}.

The structure of the content of the {{term(xml)}} element representing the {{term(document body)}} is defined by the {{termplural(semantic data model)}} defined for each {{term(response document)}}.

{{latex(\tbl{responsedocument-documentbody-semanticdatamodel})}} defines the relationship between each of the {{termplural(response document)}}, the {{term(xml)}} element that represents the {{term(document body)}} for each document, and the {{term(semantic data model)}} that defines the structure for the content of each of the {{termplural(response document)}}:

{{latex(input

## Extensibility

MTConnect is an extensible standard, which means that implementers **MAY** extend the {{termplural(data model)}} defined in the various sections of the MTConnect Standard to include information required for a specific implementation.  When these {{termplural(data model)}} are encoded using {{term(xml)}}, the methods for extending these {{termplural(data model)}} are defined by the rules established for extending any {{term(xml)}} schema (see the W3C website for more details on extending {{term(xml)}} data models).

The following are typical extensions that **MAY** be considered in the MTConnect {{termplural(data model)}}:

* Additional {{term(type)}} and {{term(subtype)}} values for {{termplural(data entity)}}.

* Additional {{termplural(structural element)}} as containers.

* Additional Composition elements.

* New {{term(asset)}} types that are sub-typed from the abstract {{term(asset)}} type.

* {{termplural(child element)}} that may be added to specific {{term(xml)}} elements contained within the {{termplural(mtconnect information model)}}.  These extended elements **MUST** be identified in a separate {{term(namespace)}}.

When extending an MTConnect {{term(data model)}}, there are some basic rules restricting changes to the MTConnect {{termplural(data model)}}.

When extending an MTConnect {{term(data model)}}, an implementer:

* {{latex(\MUSTNOT)}} add new value for category for {{termplural(data entity)}},

* {{latex(\MUSTNOT)}} add new {{termplural(root element)}},

* {{latex(\SHOULDNOT)}} add new {{term(top level)}} {{termplural(component term)}}, and

* {{latex(\MUSTNOT)}} add any new attributes or include any sub-elements to {{term(composition)}}.

  Note:  Throughout the documents additional information is provided where extensibility may be acceptable or unacceptable to maintain compliance with the MTConnect Standard.

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

