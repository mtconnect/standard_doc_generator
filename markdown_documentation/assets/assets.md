
# Asset Information Model

The MTConnect Standard supports a simple distributed storage mechanism that allows applications and equipment to share and exchange complex information models in a similar way to a distributed data store.  The {{term(Asset Information Model)}} associates each {{block(MTConnectAssets)}} entity with a unique identifier and allows for some predefined mechanisms to find, create, request, update, and delete these electronic documents in a way that provides for consistency across multiple pieces of equipment.

The protocol provides a limited mechanism of accessing {{termplural(Asset)}} using the following properties: {{property(assetId)}}, {{term(asset)}} type (element name of {{term(asset)}} root), and the piece of equipment associated with the {{term(asset)}}.  These access strategies will provide the following services and answer the following questions: What {{termplural(asset)}} are from a particular piece of equipment?  What are the {{termplural(asset)}} of a particular type? What {{term(asset)}} is stored for a given {{property(assetId)}}?

Although these mechanisms are provided, an {{term(agent)}} should not be considered a data store or a system of reference.  The {{term(agent)}} is providing an ephemeral storage capability that will temporarily manage the data for applications wishing to communicate and manage data as needed by the various processes.  An application cannot rely on an {{term(agent)}} for long term persistence or durability since the {{term(agent)}} is only required to temporarily store the {{term(asset)}} data and may require another system to provide the source data upon initialization.  An {{term(agent)}} is always providing the best-known equipment centric view of the data given the limitations of that piece of equipment.

The MTConnect Standard has two data item types to support change notification when an {{term(Asset)}} is added, updated or removed. {{block(AssetChanged)}} states the {{property(assetId)}} of the {{term(Asset)}} that has been added or updated. {{block(AssetRemoved)}} states the {{property(assetId)}} of the {{term(Asset)}} that has been removed. See {{package(Observation Information Model)}} for more details.

{{input(sections/AssetInformationModel.md)}}

# Cutting Tool Asset Information Model

There are two {{termplural(information model)}} used to represent a cutting tool, {{block(CuttingToolArchetype)}} and {{block(CuttingTool)}}. The {{block(CuttingToolArchetype)}} represents the static cutting tool geometries and nominal values as one would expect from a tool catalog and the {{block(CuttingTool)}} represents the use or application of the tool on the shop floor with actual measured values and process data. In Version 1.3.0 of the MTConnect Standard it was decided to separate out these two concerns since not all pieces of equipment will have access to both sets of information. In this way, a generic definition of the cutting tool can coexist with a specific assembly {{term(information model)}} with minimal redundancy of data.

MTConnect Standard will adopt the ISO 13399 structure when formulating the vocabulary for Cutting Tool geometries and structure to be represented in the {{block(CuttingToolArchetype)}}. The nominal values provided in the {{block(CuttingToolLifeCycle)}} section are only concerned with two aspects of the Cutting Tool; the Cutting Tool and the cutting item. The tool item, Adaptive Item, and Assembly Item will only be covered in the {{block(CuttingToolDefinition)}} section of this document since this section contains the full ISO 13399 information about a Cutting Tool.

![Cutting Tool Parts](figures/Cutting%20Tool%20Parts.png "Cutting Tool Parts"){: width="0.8"}

The {{figure(Cutting Tool Parts)}} illustrates the parts of a Cutting Tool. The Cutting Tool is the aggregate of all the components and the cutting item is the part of the tool that removes the material from the workpiece. These are the primary focus of the MTConnect Standard.

![Cutting Tool Composition](figures/Cutting%20Tool%20Composition.png "Cutting Tool Composition"){: width="0.8"}

{{figure(Cutting Tool Composition)}} provides another view of the composition of a Cutting Tool. The Adaptive Items and tool items will be used for measurements, but will not be modeled as separate entities. When we are referencing the Cutting Tool we are referring to the entirety of the assembly and when we provide data regarding the cutting item we are referencing each individual item as illustrated on the left of the previous diagram.

![Cutting Tool, Tool Item, and Cutting Item](figures/Cutting%20Tool,%20Tool%20Item,%20and%20Cutting%20Item.png "Cutting Tool, Tool Item, and Cutting Item"){: width="0.8"}

![Cutting Tool, Tool Item, and Cutting Item 2](figures/Cutting%20Tool,%20Tool%20Item,%20and%20Cutting%20Item%202.png "Cutting Tool, Tool Item, and Cutting Item 2"){: width="0.8"}


{{figure(Cutting Tool, Tool Item, and Cutting Item)}} and {{figure(Cutting Tool, Tool Item, and Cutting Item 2)}} further illustrates the components of the Cutting Tool. As we compose the tool item, cutting item, Adaptive Item, we get a Cutting Tool. The tool item, Adaptive Item, and Assembly Item will only be in the {{block(CuttingToolDefinition)}} section that will contain the full ISO 13399 information. These figures also use the ISO 13399 codes for each of the measurements. These codes will be translated into the MTConnect Standard vocabulary as illustrated below. The measurements will have a maximum, minimum, and nominal value representing the tolerance of allowable values for this dimension.

The MTConnect Standard will not define the entire geometry of the Cutting Tool, but will provide the information necessary to use the tool in the manufacturing process. Additional information can be added to the definition of the Cutting Tool by means of schema extensions.

Additional diagrams will reference these dimensions by their codes that will be defined in the measurement tables. The codes are consistent with the codes used in ISO 13399 and have been standardized. MTConnect Standard will use the full text name for clarity in the {{termplural(response document)}}.



{{input(sections/CuttingTool.md)}}

{{input(sections/CuttingToolLifeCycle.md)}}

{{input(sections/CuttingItem.md)}}

{{input(sections/CuttingToolMeasurementSubtypes.md)}}

{{input(sections/CuttingItemMeasurementSubtypes.md)}}

# Files Asset Information Model

Manufacturing processes require various documents, programs, setup sheets, and digital media available at the device for a given process. The {{block(File)}} and {{block(FileArchetype)}} {{block(Asset)}}s provide a mechanism to communicate specific "Files" that are relevant to a process where the media is located on a server and represented by a Universal Resource Locator (URL).

The {{block(FileArchetype)}} contains metadata common to all {{block(File)}} {{block(Asset)}}s for a certain purpose. The {{block(File)}} {{block(Asset)}} references the file specific to a given device or set of devices. The {{block(File)}} {{block(Asset)}} does not hold the contents of the file, it contains a reference to the location (URL) used to access the information. The metadata associated with the {{block(File)}} provides semantic information about the representation (mime-type) and the application associated with the {{block(File)}}. The application of the file is an extensible controlled vocabulary with common manufacturing uses provided.

{{input(sections/Files.md)}}

# Raw Material Asset Information Model

Raw material represents the source of material for immediate use and sources of material that may or may not be used during the manufacturing process.

The {{block(RawMaterial)}} {{block(Asset)}} holds the references to the content stored in the actual {{block(RawMaterial)}} container or derived about the {{block(RawMaterial)}} by the system during operation.

{{input(sections/RawMaterial.md)}}

# QIF Asset Information Model

The {{term(QIF)}} is an American National Standards Institute (ANSI) accredited standard developed by the Digital Metrology Standards Consortium (DMSC) standards development organization. The DMSC is an A-liaison to the International Standards Organization (ISO) Technical Committee (TC) 184. {{term(QIF)}} addresses the needs of the metrology community to have a semantic information model for the exchange of metrology data throughout the verification lifecycle from product design to execution, analysis, and reporting.

The MTConnect {{term(QIF)}} {{term(Asset Information Model)}} provides a wrapper around a {{term(QIF)}} document (i.e., a dataset conforming to the QIF Information model) in its native XML representation. The MTConnect standard does not alter or extend the {{term(QIF)}} standard and regards the {{term(QIF)}} standard as a passthrough.

Information about the {{term(QIF)}} standards is at the following location: https://qifstandards.org

{{input(sections/QIF.md)}}
