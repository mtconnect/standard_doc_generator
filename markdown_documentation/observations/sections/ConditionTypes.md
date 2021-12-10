
## Condition Types

This section provides semantic information for {{block(Condition)}} types.

{{block(Condition)}} types are reported differently from other {{block(Observation)}} types. They are reported based on the {{term(condition state)}} for each {{block(Condition)}}.

The {{property(type)}} and {{property(subType)}} (where applicable) properties for a {{block(Condition)}} **MAY** be any of the {{property(type)}} and {{property(subType)}} attributes defined for `SAMPLE` {{property(category)}} or `EVENT` {{property(category)}} {{block(DataItem)}} listed in the {{term(Device Information Model)}}.

This section lists additional {{block(Condition)}} types that have been defined to represent the health and fault status of {{termplural(Component)}}.

### Actuator

indication of a fault associated with an actuator.




### ChuckInterlock

state of an interlock function or control logic state intended to prevent the associated {{block(Chuck)}} component from being operated.




### Communications

indication that the piece of equipment has experienced a communications failure.




### DataRange

indication that the value of the data associated with a measured value or a calculation is outside of an expected range.




### Direction

direction of motion.




### EndOfBar

indication of whether the end of a piece of bar stock being feed by a bar feeder has been reached.




### Hardware

hardware of a {{block(Component)}}.




### InterfaceState

operational state of an {{block(Interface)}}.




### LogicProgram

indication that an error occurred in the logic program or programmable logic controller (PLC) associated with a piece of equipment.




### MotionProgram

indication that an error occurred in the motion program associated with a piece of equipment.




### System

general purpose indication associated with an electronic component of a piece of equipment or a controller that represents a fault that is not associated with the operator, program, or hardware.



