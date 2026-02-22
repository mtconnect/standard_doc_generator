
## SolidModel

This section provides semantic information for the {{block(SolidModel)}} entity.

![SolidModel](figures/SolidModel.png "SolidModel"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![SolidModel Example](figures/SolidModel%20Example.png "SolidModel Example"){: width="0.8"}

> Note: See {{lst(solidmodel-example)}} for the {{term(XML)}} representation of the same example.

### SolidModel

references to a file with the three-dimensional geometry of the {{block(Component)}} or {{block(Composition)}}.


The geometry **MAY** have a transformation and a scale to position the {{block(Component)}} with respect to the other {{block(Component)}}s. A geometry file can contain a set of assembled items, in this case, the {{block(SolidModel)}} references the {{property(SolidModel::id)}} of the assembly model file and the specific item within that file.

The {{block(SolidModel)}} **MAY** provide a translation, rotation, and scale to correctly place it relative to the other geometries in the machine. If the {{block(Component)}} can move and has a {{block(Motion)}} {{block(Configuration)}}, the {{block(SolidModel)}} will move when the {{block(Component)}} or {{block(Composition)}} moves.

Either an {{property(SolidModel::href)}} or a {{property(SolidModel::modelIdRef)}} and an {{property(SolidModel::itemRef)}} **MUST** be specified.


#### Value Properties of SolidModel

{{tbl(value-properties-of-solidmodel)}} lists the Value Properties of {{block(SolidModel)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(id)}}|`ID`|1|
|{{property(solidModelIdRef)}}|`ID`|0..1|
|{{property(href)}}|`string`|0..1|
|{{property(itemRef)}}|`string`|0..1|
|{{property(mediaType)}}|`MediaTypeEnum`|1|
|{{property(coordinateSystemIdRef)}}|`ID`|0..1|
|{{property(nativeUnits)}}|`NativeUnitEnum`|0..1|
|{{property(units)}}|`UnitEnum`|0..1|
{: caption="Value Properties of SolidModel" label="table:value-properties-of-solidmodel"}

Descriptions for Value Properties of {{block(SolidModel)}}:

* {{property(id)}} 

    unique identifier for this element.

* {{property(solidModelIdRef)}} 

    associated model file if an item reference is used.

* {{property(href)}} 

    {{term(URL)}} giving the location of the {{block(SolidModel)}}. 
    
    If not present, the model referenced in the {{property(SolidModel::solidModelIdRef)}} is used.
    
    {{property(SolidModel::href)}} is of type `xlink:href` from the W3C XLink specification.

* {{property(itemRef)}} 

    reference to the item within the model within the related geometry. A {{property(SolidModel::solidModelIdRef)}} **MUST** be given. 
    
    > Note: `Item` defined in ASME Y14.100 - A nonspecific term used to denote any unit or product, including materials, parts, assemblies, equipment, accessories, and computer software.

* {{property(mediaType)}} 

    format of the referenced document.

    `MediaTypeEnum` Enumeration:

    * `3DS` 

        Autodesk file format.

    * `ACIS` 

        Dassault file format.

    * `COLLADA` 

        ISO 17506.

    * `GDML` 

        Geometry Description Markup Language.

    * `IGES` 

        Initial Graphics Exchange Specification.

    * `OBJ` 

        Wavefront OBJ file format.

    * `STEP` 

        ISO 10303 STEP AP203 or AP242 format.

    * `STL` 

        STereoLithography file format.

    * `X_T` 

        Parasolid XT Siemens data interchange format.

* {{property(coordinateSystemIdRef)}} 

    reference to the coordinate system for this {{block(SolidModel)}}.

* {{property(nativeUnits)}} 

    same as {{property(DataItem::nativeUnits)}}. See {{sect(DataItem)}}.

    The value of {{property(nativeUnits)}} **MUST** be one of the `NativeUnitEnum` enumeration. 

* {{property(units)}} 

    same as {{property(DataItem::units)}}. See {{sect(DataItem)}}.

    The value of {{property(units)}} **MUST** be one of the `UnitEnum` enumeration. 

#### Part Properties of SolidModel

{{tbl(part-properties-of-solidmodel)}} lists the Part Properties of {{block(SolidModel)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Transformation)}}|0..1|
|{{block(Scale)}}|0..1|
{: caption="Part Properties of SolidModel" label="table:part-properties-of-solidmodel"}

Descriptions for Part Properties of {{block(SolidModel)}}:

* {{block(Transformation)}} 

    process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.

    See {{sect(Transformation)}}.

* {{block(Scale)}} 

    either a single multiplier applied to all three dimensions or a three space multiplier given in the X, Y, and Z dimensions in the coordinate system used for the {{block(SolidModel)}}.

    See {{sect(Scale)}}.

### Scale

either a single multiplier applied to all three dimensions or a three space multiplier given in the X, Y, and Z dimensions in the coordinate system used for the {{block(SolidModel)}}.



#### Part Properties of Scale

{{tbl(part-properties-of-scale)}} lists the Part Properties of {{block(Scale)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(value)}}|0..1|
{: caption="Part Properties of Scale" label="table:part-properties-of-scale"}

Descriptions for Part Properties of {{block(Scale)}}:

* {{block(ScaleDataSet)}} 

    multiplier for X axis.
