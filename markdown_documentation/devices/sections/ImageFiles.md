
## ImageFiles

This section provides semantic information for the {{block(ImageFile)}} entity.

### ImageFile

reference to a file containing an image of the {{block(Component)}}.



#### Value Properties of ImageFile

{{tbl(value-properties-of-imagefile)}} lists the Value Properties of {{block(ImageFile)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(id)}}|`ID`|1|
|{{property(href)}}|`string`|1|
|{{property(mediaType)}}|`string`|1|
|{{property(name)}}|`string`|0..1|
{: caption="Value Properties of ImageFile" label="table:value-properties-of-imagefile"}

Descriptions for Value Properties of {{block(ImageFile)}}:

* {{property(id)}} 

    unique identifier of the image file.

* {{property(href)}} 

    {{term(URL)}} giving the location of the image file.

* {{property(mediaType)}} 

    mime type of the image file.

* {{property(name)}} 

    description of the image file.
