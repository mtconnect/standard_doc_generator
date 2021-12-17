
## References

This section provides semantic information for the {{block(Reference)}} entity. {{fig(References)}} shows the {{block(Reference)}} model. 

{{block(Reference)}} may be modeled as part of a {{block(Device)}}, {{block(Component)}} or {{block(Interface)}} type.

![References](figures/References.png "References"){: width="0.8"}

> Note: See {{sect(References Schema Diagrams)}} for XML schema of {{block(Reference)}} and its types.

### Reference


pointer to information that is associated with another entity defined elsewhere in the {{block(MTConnectDevices)}} entity for a piece of equipment.

{{block(Reference)}} is an abstract entity and will be realized by a specific {{block(Reference)}} type for an {{block(MTConnectDevices)}} entity. See {{sect(ComponentRef)}} and {{sect(DataItemRef)}}.

#### Value Properties of Reference

{{tbl(value-properties-of-reference)}} lists the Value Properties of {{block(Reference)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(idRef)}} | `ID` | 1 |
| {{property(name)}} | `string` | 0..1 |
{: caption="Value Properties of Reference"}

Descriptions for Value Properties of {{block(Reference)}}:

* {{property(idRef)}} 

    pointer to the {{property(id)}} attribute of an element that contains the information to be associated with this element.

* {{property(name)}} 

     name of an element or a piece of equipment.

### DataItemRef


{{block(Reference)}} that is a pointer to a {{block(DataItem)}} associated with another entity defined for a piece of equipment.

{{block(DataItemRef)}} allows the data associated with a {{block(DataItem)}} defined in another entity to be directly associated with this entity.

### ComponentRef


{{block(Reference)}} that is a pointer to all of the information associated with another entity defined for a piece of equipment.


{{block(ComponentRef)}} allows all of the information of ({{term(lower level)}} {{block(Component)}} entities that is associated with the other entity to be directly associated with this entity.
