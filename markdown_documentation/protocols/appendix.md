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

## Fundamentals of Using XML to Encode Response Documents

The MTConnect Standard specifies the structures and constructs that are used to encode {{termplural(response document)}}.  When these {{termplural(response document)}} are encoded using XML, there are additional rules defined by the XML standard that apply for creating an XML compliant document.  An implementer should refer to the W3C website for additional information on XML documentation and implementation details - http://www.w3.org/XML.

The following provides specific terms and guidelines referenced in the MTConnect Standard for forming {{termplural(response document)}} with XML:  


* `tag`:  A `tag` is an XML construct that forms the foundation for an XML expression.  It defines the scope (beginning and end) of an XML expression.  The main types of tags are: 

* `start-tag`:  Designates the beginning on an XML element; e.g., <{{term(element name)}}> 

* `end-tag`:  Designates the end on an XML element; e.g., </{{term(element name)}}>. 


> Note: If an element has no {{termplural(child element)}} or {{term(CDATA)}}, the `end-tag` may be shortened to />.


* `Element`:  An element is an XML statement that is the primary building block for a document encoded using XML.  An element begins with a `start-tag` and ends with a matching `end-tag`.  The characters between the `start-tag` and the `end-tag` are the element's content.  The content may contain attributes, {{term(CDATA)}}, and/or other elements.  If the content contains additional elements, these elements are called {{termplural(child element)}}.

An example would be:  <{{term(element name)}}>Content of the Element</{{term(element name)}}>.

* {{term(child element)}}:  An XML element that is contained within a higher-level {{term(parent element)}}.  A {{term(child element)}} is also known as a sub-element.  XML allows an unlimited hierarchy of {{term(parent element)}}-{{term(child element)}} relationships that establishes the structure that defines how the various pieces of information in the document relate to each other.  A {{term(parent element)}} may have multiple associated {{termplural(child element)}}.

* {{term(element name)}}:  A descriptive identifier contained in both the `start-tag` and `end-tag` that provides the name of an XML element.

* `Attribute`:  A construct consisting of a name–value pair that provides additional information about that XML element.  The format for an attribute is `name="value"; where the value for the attribute is enclosed in a set of quotation (“) marks.  An XML attribute **MUST** only have a single value and each attribute can appear at most once in each element.  Also, each attribute **MUST** be defined in a {{term(schema)}} to either be required or optional.   

* An example of attributes for an XML element is {{lst(example-of-attributes-for-an-element)}}:

~~~~xml
<DataItem category="SAMPLE" id="S1load"
  nativeUnits="PERCENT"  type="LOAD"
  units="PERCENT"/>
~~~~
{: caption="Example of attributes for an element"}

In this example, {{block(DataItem)}} is the {{term(element name)}}.  {{property(category)}}, {{property(id)}}, {{property(nativeUnits)}}, {{property(type)}}, and {{property(units)}} are the names of the attributes.  “`SAMPLE`", “`S1load`", “`PERCENT`", “`LOAD`", and “`PERCENT`" are the values for each of the respective attributes.

* {{term(CDATA)}}:  {{term(CDATA)}} is an XML term representing *Character Data*. *Character Data* contains a value(s) or text that is associated with an XML element.  {{term(CDATA)}} can be restricted to certain formats, patterns, or words.  

An example of {{term(CDATA)}} associated with an XML element would be {{lst(example-of-cdata-associated-with-element)}}:

~~~~xml
<Message id="M1">This is some text</Message>
~~~~
{: caption="Example of cdata associated with element"}

In this example, `Message` is the {{term(element name)}} and `This is some text` is the {{term(CDATA)}}.

* {{term(namespace)}}:  An XML {{term(namespace)}} defines a unique vocabulary for named elements and attributes in an XML document.  An XML document may contain content that is associated with multiple {{termplural(namespace)}}.  Each {{term(namespace)}} has its own unique identifier. 

Elements and attributes are associated with a specific {{term(namespace)}} by placing a prefix on the name of the element or attribute that associates that name to a specific {{term(namespace)}}; e.g., `x:MyTarget` associates the element name `MyTarget` with the {{term(namespace)}} designated by `x:` (the prefix).

{{termplural(namespace)}} are used to avoid naming conflicts within an XML document.  The naming convention used for elements and attributes may be associated with either the default {{term(namespace)}} specified in the {{term(header term)}} of an XML document or they may be associated with one or more alternate {{termplural(namespace)}}.  All elements or attributes associated with a {{term(namespace)}} that is not the default {{term(namespace)}}, must include a prefix (e.g., x:) as part of the name of the element or attribute to associate it with the proper {{term(namespace)}}.  See {{sect(Schema and Namespace Declaration Information)}} for details on the structure for XML {{termplural(header term)}}.

The names of the elements and attributes declared in a {{term(namespace)}} may be identified with a different prefix than the prefix that signifies that specific {{term(namespace)}}.  These prefixes are called {{term(namespace)}} aliases.  As an example, MTConnect Standard specific {{termplural(namespace)}} are designated as `m:` and the names of the elements and attributes defined in that {{term(namespace)}} have an alias prefix of `mt:` which designates these names as MTConnect Standard specific vocabulary; e.g., `mt:MTConnectDevices`. 


XML documents are encoded with a hierarchy of elements.  In general, XML elements may contain {{termplural(child element)}}, {{term(CDATA)}}, or both.  However, in the MTConnect Standard, an element **MUST NOT** contain mixed content; meaning it cannot contain both {{termplural(child element)}} and {{term(CDATA)}}. 

The {{term(semantic data model)}} defined for each {{term(response document)}} specifies the elements and {{termplural(child element)}} that may appear in a document.  The {{term(semantic data model)}} also defines the number of times each element and {{term(child element)}} may appear in the document.

{{lst(example-of-hierarchy-of-xml-elements)}} demonstrates the hierarchy of XML elements and {{termplural(child element)}} used to form an XML document:

~~~~xml
<Root Level>    (Parent Element)
  <First Level>  (Child Element to Root Level and 
  Parent Element to Second Level)
    <Second Level>  (Child Element to First Level
    and Parent Element to Third Level)
      <Third Level name="N1"></Third Level>  
      (Child Element to Second Level)
      <Third Level name="N2"></Third Level>  
      (Child Element to Second Level)
      <Third Level name="N3"></Third Level>  
      (Child Element to Second Level)
    </Second Level>   (end-tag for Second Level)
  </First Level>   (end-tag for First Level)
</Root Level>   (end-tag for Root Level)
~~~~
{: caption="Example of hierarchy of XML elements"}


In the {{lst(example-of-hierarchy-of-xml-elements)}}, *Root Level* and *First Level* have one {{term(child element)}} (sub-elements) each and Second Level has three {{termplural(child element)}}; each called *Third Level*.  Each *Third Level* element has a different name attribute.  Each level in the structure is an element and each lower level element is a {{term(child element)}}.

{{newpage()}}

## Schema and Namespace Declaration Information

There are four pseudo-attributes typically included in the {{term(header term)}} of a {{term(response document)}} that declare the {{term(schema)}} and {{term(namespace)}} for the document.  Each of these pseudo-attributes provides specific information for a client software application to properly interpret the content of the {{term(response document)}}.

The pseudo-attributes include:

* `xmlns:xsi` – The `xsi` portion of this attribute name stands for {{term(XML Schema)}} instance.  An {{term(XML Schema)}} instance provides information that may be used by a software application to interpret XML specific information within a document.  See the W3C website for more details on `xmlns:xsi`.

* `xmlns` – Declares the default {{term(namespace)}} associated with the content of the {{term(response document)}}.  The default {{term(namespace)}} is considered to apply to all elements and attributes whenever the name of the element or attribute does not contain a prefix identifying an alternate {{term(namespace)}}.

The value of this attribute is an URN identifying the name of the file that defines the details of the {{term(namespace)}} content.  This URN provides a unique identify for the {{term(namespace)}}.

* `xmlns:m` – Declares the MTConnect specific {{term(namespace)}} associated with the content of the {{term(response document)}}.  There may be multiple {{termplural(namespace)}} declared for an XML document.  Each may be associated to the default {{term(namespace)}} or it may be totally independent.  The `:m` designates that this is a specific MTConnect {{term(namespace)}} which is directly associated with the default {{term(namespace)}}.

 
> Note:	See {{sect(Extensibility)}} for details regarding extended {{termplural(namespace)}}.


The value associated with this attribute is an URN identifying the name of the file that defines the details of the {{term(namespace)}} content.

* `xsi:schemaLocation` -  Declares the name for the {{term(schema)}} associated with the {{term(response document)}} and the location of the file that contains the details of the {{term(schema)}} for that document.

The value associated with this attribute has two parts:

  * A URN identifying the name of the specific {{term(XML Schema)}} instance associated with the {{term(response document)}}.

  * The path to the location where the file describing the specific {{term(XML Schema)}} instance is located.  If the file is located in the same root directory where the {{term(agent)}} is installed, then the local path MAY be declared.  Otherwise, a fully qualified URL must be declared to identify the location of the file.


> Note:	In the format of the value associated with `xsi:schemaLocation`, the URN and the path to the {{term(schema)}} file **MUST** be separated by a “space”.


In {{lst(example-of-schema-and-namespace-declaration)}}, the first line is the XML declaration.  The second line is a {{term(root element)}} called `MTConnectDevices`.  The remaining four lines are the pseudo-attributes of `MTCconnectDevices` that declare the XML {{term(schema)}} and {{term(namespace)}} associated with an {{term(MTConnectDevices Response Document)}}.

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
  <MTConnectDevices
   xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
   xmlns="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:m="urn:mtconnect.org:MTConnectDevices:1.3"
   xsi:schemaLocation="urn:mtconnect.org:
    MTConnectDevices:1.3 /schemas/MTConnectDevices\_1.3.xsd">
~~~~
{: caption="Example of schema and namespace declaration"}

The format for the values provided for each of the pseudo-attributes **MUST** reference the {{term(semantic data model)}} (e.g., `MTConnectDevices`, `MTConnectStreams`, `MTConnectAssets`, or `MTConnectError`) and the version (i.e.; `1.1`, `1.2`, `1.3`, etc.) of the MTConnect Standard that depict the {{term(schema)}} and {{term(namespace)}}(s) associated with a specific {{term(response document)}}.

When an implementer chooses to extend an MTConnect {{term(data model)}} by adding custom data types or additional {{termplural(structural element)}}, the {{term(schema)}} and {{term(namespace)}} for that {{term(data model)}} should be updated to reflect the additional content.  When this is done, the {{term(namespace)}} and {{term(schema)}} information in the {{term(header term)}} should be updated to reflect the URI for the extended {{term(namespace)}} and {{term(schema)}}. 

{{newpage()}}

## Extensibility

MTConnect is an extensible standard, which means that implementers **MAY** extend the {{termplural(data model)}} defined in the various sections of the MTConnect Standard to include information required for a specific implementation.  When these {{termplural(data model)}} are encoded using XML, the methods for extending these {{termplural(data model)}} are defined by the rules established for extending any XML schema (see the W3C website for more details on extending XML data models).

The following are typical extensions that **MAY** be considered in the MTConnect {{termplural(data model)}}:

* Additional {{property(type)}} and {{property(subtype)}} values for {{termplural(DataItem)}}.

* Additional {{termplural(structural element)}} as containers.

* Additional {{block(Composition)}} elements.

* New {{block(Asset)}} types that are sub-typed from the abstract {{block(Asset)}} type.

* {{termplural(child element)}} that may be added to specific XML elements contained within the {{termplural(mtconnect information model)}}.  These extended elements **MUST** be identified in a separate {{term(namespace)}}.


When extending an MTConnect {{term(data model)}}, there are some basic rules restricting changes to the MTConnect {{termplural(data model)}}.

When extending an MTConnect {{term(data model)}}, an implementer:

* **MUST NOT** add new value for category for {{termplural(DataItem)}},

* **MUST NOT** add new {{termplural(root element)}},

* **SHOULD NOT** add new {{term(top level)}} {{termplural(Component)}}, and

* **MUST NOT** add any new attributes or include any sub-elements to {{block(Composition)}}.

> Note:  Throughout the documents additional information is provided where extensibility may be acceptable or unacceptable to maintain compliance with the MTConnect Standard.

When a {{term(schema)}} representing a {{term(data model)}} is extended, the {{term(schema)}} and {{term(namespace)}} declaration at the beginning of the corresponding {{term(response document)}} **MUST** be updated to reflect the new {{term(schema)}} and {{term(namespace)}} so that a client software application can properly validate the {{term(response document)}}.

An XML example of a {{term(schema)}} and {{term(namespace)}} declaration, including an extended {{term(schema)}} and {{term(namespace)}}, is shown in {{lst(example-of-extended-schema-and-namespace-in-declaration)}}:

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
  <MTConnectDevices
   xmlns:xsi=http://www.w3.org/2001/XMLSchema-instance
   xmlns="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:m="urn:mtconnect.org:MTConnectDevices:1.3"
   xmlns:x="urn:MyLocation:MyFile:MyVersion"
   xsi:schemaLocation="urn:MyLocation:MyFile:MyVersion
     /schemas/MyFileName.xsd" />
~~~~
{: caption="Example of extended schema and namespace in declaration"}

In this example:

* `xmlns:x` is added in Line 6 to identify the {{term(XML Schema)}} instance for the extended {{term(schema)}}.   {{termplural(element name)}} identified with an "`x`" prefix are associated with this specific {{term(XML Schema)}} instance.

> Note: The "`x`" prefix **MAY** be replaced with any prefix that the implementer chooses for identifying the extended {{term(schema)}} and {{term(namespace)}}.

* `xsi:schemaLocation` is modified in Line 7 to associate the {{term(namespace)}} URN with the URL specifying the location of {{term(schema)}} file.

* `MyLocation`, `MyFile`, `MyVersion`, and `MyFileName` in Lines 6 and 7 **MUST** be replaced by the actual name, version, and location of the extended {{term(schema)}}.

When an extended {{term(schema)}} is implemented, each {{term(structural element)}}, {{term(DataItem)}}, and {{term(asset)}} defined in the extended {{term(schema)}} **MUST** be identified in each respective {{term(response document)}} by adding a prefix to the XML {{term(element name)}} associated with that {{term(structural element)}}, {{term(DataItem)}}, or {{term(asset)}}.  The prefix identifies the {{term(schema)}} and {{term(namespace)}} where that XML Element is defined. 
