## XML Response Documents

As defined in {{latex(\sect{XML Documents})}}, {{term(xml)}} is currently the only language supported by the MTConnect Standard for encoding {{termplural(response document)}}.

{{termplural(response document)}} must be valid and conform to the {{term(schema)}} defined in the {{term(semantic data model)}} defined for that document.  The {{term(schema)}} for each {{term(response document)}} **MUST** be updated to correlate to a specific version of the MTConnect Standard.  Versions, within a {{term(major)}} version, of the MTConnect Standard will be defined in such a way to best maintain backwards compatibility of the {{termplural(semantic data model)}} through all {{term(minor)}} revisions of the Standard.  However, new {{term(minor)}} versions may introduce extensions or enhancements to existing {{termplural(semantic data model)}}.

To be valid, a {{term(response document)}} must be well-formed; meaning that, amongst other things, each element has the required {{term(xml)}} *start-tag* and *end-tag* and that the document does not contain any illegal characters.  The validation of the document may also include a determination that required elements and attributes are present, they only occur in the appropriate location in the document, and they appear only the correct number of times.  If the document is not well-formed, it may be rejected by a client software application.  The {{term(semantic data model)}} defined for each {{term(response document)}} also specifies the elements and {{termplural(child element)}} that may appear in a document.  {{term(xml)}} elements may contain {{termplural(child element)}}, {{term(cdata)}}, or both.  The {{term(semantic data model)}} also defines the number of times each element and {{term(child element)}} may appear in the document.

Each {{term(response document)}} encoded using {{term(xml)}} consists of the following primary sections:

* {{term(xml)}} Declaration
* Root Element
* Schema and Namespace Declaration
* Document Header
* Document Body

The following will provide details defining how each of the {{termplural(response document)}} are encoded using {{term(xml)}}.

> Note: See {{latex(\sect{Terminology and Conventions})}} for the definition of {{term(xml)}} related terms used in the MTConnect Standard.

### Fundamentals of Using XML to Encode Response Documents

The MTConnect Standard follows industry conventions for formatting the elements and attributes included in an {{term(xml)}} document.  The general guidelines are as follows: 

* All element names **MUST** be specified in Pascal case (first letter of each word is capitalized). For example: `<PowerSupply/>`.

* The name for an attribute **MUST** be Camel case; similar to Pascal case, but the first letter will be lower case.  For example: `<MyElement nativeName="bob"/>` where `MyElement` is the {{term(element name)}} and {{term(nativename)}} is an attribute.

* All {{term(cdata)}} values that are defined with a limited or controlled vocabulary **MUST** be in upper case with an \_ (underscore) separating words.  For example: {{term(on value)}}, {{term(off value)}}, {{term(actual subtype)}}, and {{term(counterclockwise value)}}.

* The values provided for a date and/or a time **MUST** follow the W3C ISO 8601 format with an arbitrary number of decimals representing fractions of a second.  Refer to the following specification for details on the format for dates and times:  http://www.w3.org/TR/NOTE-datetime.

The format for the value describing a date and a time will be\\ YYYY-MM-DDThh:mm:ss.ffff. An example would be: 2017-01-13T13:01.213415Z.  

> Note:  Z refers to UTC/GMT time, not local time.

The accuracy and number of decimals representing fractions of a second for a {{term(timestamp)}} **MUST** be determined by the capabilities of the piece of equipment publishing information to an {{term(agent)}}.  All time values **MUST** be provided in UTC (GMT).

* {{term(xml)}} element names **MUST** be spelled out and abbreviations are not permitted.   See the exclusion below regarding the use of the suffix `Ref`.

* {{term(xml)}} attribute names {{latex(\SHOULD)}} be spelled out and abbreviations {{latex(\SHOULD)}} be avoided.  The exception to this rule is the use of {{term(id)}} when associated with an identifier.  See the exclusion below regarding the use of the suffix `Ref`.

* The abbreviation `Ref` for {{term(reference)}} is permitted as a suffix to element names of either a {{term(structural element)}} or a {{term(data entity)}} to provide an efficient method to associate information defined in another location in a {{term(data model)}} without duplicating that original data or structure.  See *Section 4.8* in {{latex(\citetitle{MTCPart2})}} for more information on {{term(reference)}}.

### XML Declaration

The first section of a {{term(response document)}} encoded with {{term(xml)}} {{latex(\SHOULD)}} be the {{term(xml declaration)}}.  The declaration is a single element.

An example of an {{term(xml declaration)}} would be:  

~~~~xml
<?xml version="1.0" encoding="UTF-8"?>
~~~~
{: caption="Example of xml declaration" label="xml-declaration" start=""}

This element provides information regarding how the {{term(xml)}} document is encoded and the character type used for that encoding.  See the W3C website for more details on the {{term(xml)}} declaration. 

### Root Element

Every {{term(response document)}} **MUST** contain only one root element.  The MTConnect Standard defines {{term(mtconnectdevices)}}, {{term(mtconnectstreams)}}, {{term(mtconnectassets)}}, and {{term(mtconnecterror)}} as {{termplural(root element)}}. 

The {{term(root element)}} specifies a specific {{term(response document)}} and appears at the top of the document immediately following the {{term(xml declaration)}}.

#### MTConnectDevices Root Element

{{term(mtconnectdevices)}} is the {{term(root element)}} for the {{term(mtconnectdevices response document)}}.  

![MTConnectDevices Structure](figures/mtconnectdevices-structure.png "mtconnectdevices-structure")

{{FloatBarrier}}

{{term(mtconnectdevices)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(devices)}}.  Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(devices)}} is an {{term(xml)}} container that represents the {{term(document body)}} for an {{term(mtconnectdevices response document)}} -- see {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(devices)}} are defined in {{latex(\citetitle{MTCPart2})}}.

{{term(mtconnectdevices)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

##### MTConnectDevices Elements

An {{term(mtconnectdevices)}} element **MUST** contain a {{term(header)}} and a {{term(devices)}} element.

| Element | Description | Occurrence |
|---------|-------------|------------|
| {{term(header)}} |An {{term(xml)}} container in an {{term(mtconnect response document)}} that provides information from an {term(agent)}} defining version information, storage capacity, and parameters associated with the data management within the {{term(agent)}}. | 1 | 
| {{term(devices)}} | The {{term(xml)}} container in an {{term(mtconnect response document)}} that provides the {{term(equipment metadata)}} for each of the pieces of equipment associated with an {{term(agent)}}. | 1 |

#### MTConnectStreams Root Element

{{term(mtconnectstreams)}} is the {{term(root element)}} for the {{term(mtconnectstreams response document)}}.  

![MTConnectStreams Structure](figures/mtconnectstreams-structure.png "mtconnectstreams-structure")

{{FloatBarrier}}

{{term(mtconnectstreams)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(streams)}}.  

Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(streams)}} is an {{term(xml)}} container that represents the {{term(document body)}} for a {{term(mtconnectstreams response document)}} -- see {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(streams)}} are defined in {{latex(\citetitle{MTCPart3})}}.

{{term(mtconnectstreams)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

{{newpage}}

##### MTConnectStreams Elements{{latex(\mbox)}}{}

An {{term(mtconnectstreams)}} element **MUST** contain a {{term(header)}} and a {{term(streams)}} element.

> Note: Table was here

#### MTConnectAssets Root Element

{{term(mtconnectassets)}} is the {{term(root element)}} for the {{term(mtconnectassets response document)}}. 

![MTConnectAssets Structure](figures/mtconnectassets-structure.png "mtconnectassets-structure")

{{FloatBarrier}}

{{newpage}} 

{{term(mtconnectassets)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(assets mtconnectassets)}}.

Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(assets mtconnectassets)}} is an {{term(xml)}} container that represents the {{term(document body)}} for an {{term(mtconnectassets response document)}} -- see {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(assets mtconnectassets)}} are defined in {{latex(\citetitle{MTCPart40})}}.

{{term(mtconnectassets)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

##### MTConnectAssets Elements{{latex(\mbox)}}{}

An {{term(mtconnectassets)}} element **MUST** contain a {{term(header)}} and an {{term(assets mtconnectassets)}} element.

> Note: Table was here

#### MTConnectError Root Element

{{term(mtconnecterror)}} is the {{term(root element)}} for the {{term(mtconnecterrors response document)}}.

[MTConnectError Structure](figures/mtconnecterror-structure.png "mtconnecterror-structure")

{{FloatBarrier}}

{{term(mtconnecterror)}} **MUST** contain two {{termplural(child element)}} - {{term(header)}} and {{term(errors)}}. 

> Note:	When compatibility with *Version 1.0.1* and earlier of the MTConnect Standard is required for an implementation, the {{term(mtconnecterrors response document)}} contains only a single {{term(error)}} {{term(data entity)}} and the {{term(errors)}} {{term(child element)}} {{latex(\MUSTNOT)}} appear in the document. 

Details for {{term(header)}} are defined in {{latex(\sect{Document Header})}}.  

{{term(errors)}} is an {{term(xml)}} container that represents the {{term(document body)}} for an {{term(mtconnecterrors response document)}} -- See {{latex(\sect{Document Body})}}.  Details for the {{term(semantic data model)}} describing the contents for {{term(errors)}} are defined in {{latex(\sect{Error Information Model})}}.

{{term(mtconnecterror)}} also has a number of attributes.  These attributes are defined in {{latex(\sect{Schema and Namespace Declaration})}}.

##### MTConnectError Elements{{latex(\mbox)}}{}

An {{term(mtconnecterror)}} element **MUST** contain a {{term(header)}} and an {{term(errors)}} element.

> Table was here
