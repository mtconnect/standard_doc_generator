
## Motion

This section provides semantic information for the {{block(Motion)}} entity.

![Motion](figures/Motion.png "Motion"){: width="0.8"}

> Note: See {{sect(Configuration Schema Diagrams)}} for XML schema.

![Motion Example](figures/Motion%20Example.png "Motion Example"){: width="0.8"}

> Note: See {{lst(motion-example)}} for the {{term(XML)}} representation of the same example.

### Motion

movement of the component relative to a coordinate system. 


{{block(Motion)}} specifies the kinematic chain of the {{block(component)}} entities.

At most only one of {{block(Origin)}} or {{block(Transformation)}} **MUST** be defined for a {{block(Motion)}}.


#### Value Properties of Motion

{{tbl(value-properties-of-motion)}} lists the Value Properties of {{block(Motion)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(actuation)}}|`MotionActuationTypeEnum`|1|
|{{property(coordinateSystemIdRef)}}|`ID`|1|
|{{property(id)}}|`ID`|1|
|{{property(parentIdRef)}}|`ID`|0..1|
|{{property(type)}}|`MotionTypeEnum`|1|
{: caption="Value Properties of Motion" label="table:value-properties-of-motion"}

Descriptions for Value Properties of {{block(Motion)}}:

* {{property(actuation)}} 

    describes if this component is actuated directly or indirectly as a result of other motion.

    `MotionActuationTypeEnum` Enumeration:

    * `DIRECT` 

        movement is initiated by the component.

    * `NONE` 

        no actuation of this axis.
        
        > Note: Actuation of `NONE` can be either a derived `REVOLUTE` or `PRISMATIC` motion or static `FIXED` relationship.

    * `VIRTUAL` 

        motion is computed and is used for expressing an imaginary movement.

* {{property(coordinateSystemIdRef)}} 

    coordinate system within which the kinematic motion occurs.

* {{property(id)}} 

    unique identifier for this element.

* {{property(parentIdRef)}} 

    pointer to the {{property(id)}} attribute of the parent {{block(Motion)}}.
    
    The kinematic chain connects all components using the parent relations. All motion is connected to the motion of the parent. The first node in the chain will not have a parent.

* {{property(type)}} 

    type of motion.

    `MotionTypeEnum` Enumeration:

    * `CONTINUOUS` 

        revolves around an axis with a continuous range of motion.

    * `FIXED` 

        axis does not move.

    * `PRISMATIC` 

        sliding linear motion along an axis with a fixed range of motion.

    * `REVOLUTE` 

        rotates around an axis with a fixed range of motion.

#### Part Properties of Motion

{{tbl(part-properties-of-motion)}} lists the Part Properties of {{block(Motion)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Axis)}}|0..1|
|{{block(Origin)}}|0..1|
|{{block(Transformation)}}|0..1|
|{{block(Description)}}|0..1|
{: caption="Part Properties of Motion" label="table:part-properties-of-motion"}

Descriptions for Part Properties of {{block(Motion)}}:

* {{block(Axis)}} 

    axis along or around which the {{block(Component)}} moves relative to a coordinate system.

    See {{sect(Axis)}}.

* {{block(Origin)}} 

    coordinates of the origin position of a coordinate system.

    See {{sect(Origin)}}.

* {{block(Transformation)}} 

    process of transforming to the origin position of the coordinate system from a parent coordinate system using {{block(Translation)}} and {{block(Rotation)}}.

    See {{sect(Transformation)}}.

* {{block(Description)}} 

    descriptive content.

    See {{sect(Description)}}.

### Axis

axis along or around which the {{block(Component)}} moves relative to a coordinate system.



The value of {{property(Axis)}} **MUST** be a list of `float` of size `3`.
