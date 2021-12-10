
## CoordinateSystems

This section provides semantic information for the {{block(CoordinateSystem)}} entity.

![CoordinateSystem](figures/CoordinateSystem.png "CoordinateSystem"){: width="0.8"}

> Note: See {{fig(CoordinateSystem Schema)}} for XML schema.

![CoordinateSystem Example](figures/CoordinateSystem%20Example.png "CoordinateSystem Example"){: width="0.8"}

> Note: See {{lst(coordinatesystem-example)}} for the {{term(XML)}} representation of the same example.

### CoordinateSystem


reference system that associates a unique set of n parameters with each point in an n-dimensional space. {{cite(ISO 10303-218:2004)}}

At most only one of {{block(Origin)}} or {{block(Transformation)}} **MUST** be defined for a {{block(CoordinateSystem)}}.

#### Value Properties of CoordinateSystem

{{tbl(value-properties-of-coordinatesystem)}} lists the Value Properties of {{block(CoordinateSystem)}}.

| Value Property name | Value Property type | Multiplicity |
|--------------------:|--------------------:|-------------:|
| {{property(id)}} | `ID` | 1 |
| {{property(name)}} | `string` | 0..1 |
| {{property(nativeName)}} | `string` | 0..1 |
| {{property(parentIdRef)}} | `ID` | 0..1 |
| {{property(type)}} | `CoordinateSystemTypeEnum` | 1 |
| {{property(Description)}} | `string` | 0..1 |
{: caption="Value Properties of CoordinateSystem"}

Descriptions for Value Properties of {{block(CoordinateSystem)}}:

* {{property(id)}} 

    unique identifier for this element.

* {{property(name)}} 

    name of the coordinate system.

* {{property(nativeName)}} 

    manufacturer's name or users name for the coordinate system.

* {{property(parentIdRef)}} 

    pointer to the {{property(id)}} attribute of the parent {{block(CoordinateSystem)}}.

* {{property(type)}} 

    type of coordinate system.

    The value of {{property(type)}} **MUST** be one of the `CoordinateSystemTypeEnum` enumeration.

    `CoordinateSystemTypeEnum` Enumeration:


    * `WORLD` 

        stationary coordinate system referenced to earth, which is independent of the robot motion. {{cite(ISO 9787:2013)}}
        
        For non-robotic devices, stationary coordinate system referenced to earth, which is independent of the motion of a piece of equipment.

    * `BASE` 

        coordinate system referenced to the base mounting surface. {{cite(ISO 9787:2013)}}
        
        A base mounting surface is a connection surface between the arm and its supporting structure.{{cite(ISO 9787:2013)}}
        
        For non-robotic devices, it is the connection surface between the device and its supporting structure.

    * `OBJECT` 

        coordinate system referenced to the object. {{cite(ISO 9787:2013)}}

    * `TASK` 

        coordinate system referenced to the site of the task. {{cite(ISO 9787:2013)}}

    * `MECHANICAL_INTERFACE` 

        coordinate system referenced to the mechanical interface. {{cite(ISO 9787:2013)}}

    * `TOOL` 

        coordinate system referenced to the tool or to the end effector attached to the mechanical interface. {{cite(ISO 9787:2013)}}

    * `MOBILE_PLATFORM` 

        coordinate system referenced to one of the components of a mobile platform. {{cite(ISO 8373:2012)}}

    * `MACHINE` 

        coordinate system referenced to the home position and orientation of the primary axes of a piece of equipment.

    * `CAMERA` 

        coordinate system referenced to the sensor which monitors the site of the task. {{cite(ISO 9787:2013)}}

* {{property(Description)}} 

    natural language description of the {{block(CoordinateSystem)}}.

#### Part Properties of CoordinateSystem

{{tbl(part-properties-of-coordinatesystem)}} lists the Part Properties of {{block(CoordinateSystem)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Origin)}} | 0..1 |
| {{block(Transformation)}} | 0..1 |
{: caption="Part Properties of CoordinateSystem"}

Descriptions for Part Properties of {{block(CoordinateSystem)}}:

* {{block(Origin)}} 

    coordinates of the origin position of a coordinate system.
    See {{sect(Origin)}}.

* {{block(Transformation)}} 

    process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.
    See {{sect(Transformation)}}.

### Origin


coordinates of the origin position of a coordinate system.


    The value of {{property(Origin)}} **MUST** be `MILLIMETER`.


### Transformation


process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.

At a minimum, a {{block(Translation)}} or a {{block(Rotation)}} **MUST** be defined for a {{block(Transformation)}}.

#### Part Properties of Transformation

{{tbl(part-properties-of-transformation)}} lists the Part Properties of {{block(Transformation)}}.

| Part Property name | Multiplicity |
|-------------------------------------:|-------------:|
| {{block(Translation)}} | 0..1 |
| {{block(Rotation)}} | 0..1 |
{: caption="Part Properties of Transformation"}

Descriptions for Part Properties of {{block(Transformation)}}:

* {{block(Translation)}} 

    translations along X, Y, and Z axes are expressed as x,y, and z respectively within a 3-dimensional vector. 
    See {{sect(Translation)}}.

* {{block(Rotation)}} 

    rotations about X, Y, and Z axes are expressed in A, B, and C respectively within a 3-dimensional vector. 
    
    See {{sect(Rotation)}}.

### Rotation


rotations about X, Y, and Z axes are expressed in A, B, and C respectively within a 3-dimensional vector. 



    The value of {{property(Rotation)}} **MUST** be `DEGREE`.


### Translation


translations along X, Y, and Z axes are expressed as x,y, and z respectively within a 3-dimensional vector. 


    The value of {{property(Translation)}} **MUST** be `MILLIMETER`.

