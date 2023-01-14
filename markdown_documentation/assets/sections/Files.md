
## Files

This section provides semantic information for the {{block(File)}} model.

![Files](figures/Files.png "Files"){: width="0.8"}

> Note: See {{sect(File Schema Diagrams)}} for XML schema.


### AbstractFile

abstract {{block(Asset)}} that contains the common properties of the {{block(File)}} and {{block(FileArchetype)}} types.



#### Value Properties of AbstractFile

{{tbl(value-properties-of-abstractfile)}} lists the Value Properties of {{block(AbstractFile)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(name)}}|`string`|1|
|{{property(mediaType)}}|`string`|1|
|{{property(applicationCategory)}}|`ApplicationCategoryEnum`|1|
|{{property(applicationType)}}|`ApplicationTypeEnum`|1|
{: caption="Value Properties of AbstractFile" label="table:value-properties-of-abstractfile"}

Descriptions for Value Properties of {{block(AbstractFile)}}:

* {{property(name)}} 

    name of the file.

* {{property(mediaType)}} 

    mime type of the file.

* {{property(applicationCategory)}} 

    category of application that will use this file.

    `ApplicationCategoryEnum` Enumeration:

    * `ASSEMBLY` 

        files regarding the fully assembled product.

    * `DEVICE` 

        device related files.

    * `HANDLING` 

        files relating to the handling of material.

    * `INSPECTION` 

        files related to the quality inspection.

    * `MAINTENANCE` 

        files relating to equipment maintenance.

    * `PART` 

        files relating to a part.

    * `PROCESS` 

        files related to the manufacturing process.

    * `SETUP` 

        files related to the setup of a process.

* {{property(applicationType)}} 

    type of application that will use this file.

    `ApplicationTypeEnum` Enumeration:

    * `DATA` 

        generic data.

    * `DESIGN` 

        computer aided design files or drawings.

    * `DOCUMENTATION` 

        documentation regarding a category of file.

    * `INSTRUCTIONS` 

        user instructions regarding the execution of a task.

    * `LOG` 

        data related to the history of a machine or process.

    * `PRODUCTION_PROGRAM` 

        machine instructions to perform a process.

#### Part Properties of AbstractFile

{{tbl(part-properties-of-abstractfile)}} lists the Part Properties of {{block(AbstractFile)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(FileProperty)}} (organized by `FileProperties`)|0..*|
|{{block(FileComment)}} (organized by `FileComments`)|0..*|
{: caption="Part Properties of AbstractFile" label="table:part-properties-of-abstractfile"}

Descriptions for Part Properties of {{block(AbstractFile)}}:

* {{block(FileProperty)}} 

    key-value pair providing additional metadata about a {{block(File)}}.

    {{block(FileProperties)}} groups one or more {{block(FileProperty)}} entities for a {{block(File)}}. See {{sect(FileProperty)}}.

* {{block(FileComment)}} 

    remark or interpretation for human interpretation associated with a {{block(File)}} or {{block(FileArchetype)}}.

    {{block(FileComments)}} groups one or more {{block(FileComment)}} entities for a {{block(File)}}. See {{sect(FileComment)}}.

### File

{{block(AbstractFile)}} type that provides information about the {{block(File)}} instance and its {{term(URL)}}.



#### Value Properties of File

{{tbl(value-properties-of-file)}} lists the Value Properties of {{block(File)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(size)}}|`integer`|1|
|{{property(versionId)}}|`string`|1|
|{{property(state)}}|`FileStateEnum`|1|
|{{property(Signature)}}|`x509`|0..1|
|{{property(PublicKey)}}|`x509`|0..1|
|{{property(CreationTime)}}|`datetime`|1|
|{{property(ModificationTime)}}|`datetime`|0..1|
{: caption="Value Properties of File" label="table:value-properties-of-file"}

Descriptions for Value Properties of {{block(File)}}:

* {{property(size)}} 

    size of the file in bytes.

* {{property(versionId)}} 

    version identifier of the file.

* {{property(state)}} 

    state of the file. 

    `FileStateEnum` Enumeration:

    * `EXPERIMENTAL` 

        used for processes other than production or otherwise defined.

    * `PRODUCTION` 

        used for production processes.

    * `REVISION` 

        content is modified from `PRODUCTION` or `EXPERIMENTAL`.

* {{property(Signature)}} 

    secure hash of the file.

* {{property(PublicKey)}} 

    public key used to verify the signature.

* {{property(CreationTime)}} 

    time the file was created.

* {{property(ModificationTime)}} 

    time the file was modified.

#### Part Properties of File

{{tbl(part-properties-of-file)}} lists the Part Properties of {{block(File)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(FileLocation)}}|1|
|{{block(Destination)}} (organized by `Destinations`)|0..*|
{: caption="Part Properties of File" label="table:part-properties-of-file"}

Descriptions for Part Properties of {{block(File)}}:

* {{block(FileLocation)}} 

    {{term(URL)}} reference to the file location. 

    See {{sect(FileLocation)}}.

* {{block(Destination)}} 

    reference to the target {{block(Device)}} for this {{block(File)}}.

    {{block(Destinations)}} groups one or more {{block(Destination)}} entities. See {{sect(Destination)}}.

### FileArchetype

{{block(AbstractFile)}} type that provides information common to all versions of a file.



### FileProperty

key-value pair providing additional metadata about a {{block(File)}}.



The value of {{property(FileProperty)}} **MUST** be `string`.

#### Value Properties of FileProperty

{{tbl(value-properties-of-fileproperty)}} lists the Value Properties of {{block(FileProperty)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(name)}}|`string`|1|
{: caption="Value Properties of FileProperty" label="table:value-properties-of-fileproperty"}

Descriptions for Value Properties of {{block(FileProperty)}}:

* {{property(name)}} 

    name of the {{block(FileProperty)}}.

### FileComment

remark or interpretation for human interpretation associated with a {{block(File)}} or {{block(FileArchetype)}}.



The value of {{property(FileComment)}} **MUST** be `string`.

#### Value Properties of FileComment

{{tbl(value-properties-of-filecomment)}} lists the Value Properties of {{block(FileComment)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(timestamp)}}|`datetime`|1|
{: caption="Value Properties of FileComment" label="table:value-properties-of-filecomment"}

Descriptions for Value Properties of {{block(FileComment)}}:

* {{property(timestamp)}} 

    time the comment was made.

### FileLocation

{{term(URL)}} reference to the file location. 



#### Value Properties of FileLocation

{{tbl(value-properties-of-filelocation)}} lists the Value Properties of {{block(FileLocation)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(href)}}|`xlinkhref`|1|
|{{property(xlink:type)}}|`xlinktype`|0..1|
{: caption="Value Properties of FileLocation" label="table:value-properties-of-filelocation"}

Descriptions for Value Properties of {{block(FileLocation)}}:

* {{property(href)}} 

    {{term(URL)}} reference to the file.
    
    `href` is of type `xlink:href` from the W3C XLink specification.

* {{property(xlink:type)}} 

    type of href for the xlink href type. 
    
    **MUST** be `locator` referring to a {{term(URL)}}.

### Destination

reference to the target {{block(Device)}} for this {{block(File)}}.



#### Value Properties of Destination

{{tbl(value-properties-of-destination)}} lists the Value Properties of {{block(Destination)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(deviceUuid)}}|`ID`|1|
{: caption="Value Properties of Destination" label="table:value-properties-of-destination"}

Descriptions for Value Properties of {{block(Destination)}}:

* {{property(deviceUuid)}} 

    `uuid` of the target device or application.
