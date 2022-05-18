
## Condition Types

This section provides semantic information for {{block(Condition)}} types.

{{block(Condition)}} types are reported differently from other {{block(Observation)}} types. They are reported based on the {{term(condition state)}} for each {{block(Condition)}}.

The {{property(type)}} and {{property(subType)}} (where applicable) properties for a {{block(Condition)}} **MAY** be any of the {{property(type)}} and {{property(subType)}} attributes defined for `SAMPLE` {{property(category)}} or `EVENT` {{property(category)}} {{block(DataItem)}} listed in the {{term(Device Information Model)}}.

This section lists additional {{block(Condition)}} types that have been defined to represent the health and fault status of {{termplural(Component)}}.

### Actuator

{{def(ConditionEnum:ACTUATOR)}}



### Communications

{{def(ConditionEnum:COMMUNICATIONS)}}



### DataRange

{{def(ConditionEnum:DATA_RANGE)}}



### LogicProgram

{{def(ConditionEnum:LOGIC_PROGRAM)}}



### MotionProgram

{{def(ConditionEnum:MOTION_PROGRAM)}}



### System

{{def(ConditionEnum:SYSTEM)}}


