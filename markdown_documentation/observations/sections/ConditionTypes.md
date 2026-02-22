
## Condition Types

This section provides semantic information for {{block(Condition)}} types.

{{block(Condition)}} types are reported differently from other {{block(Observation)}} types. They are reported based on the {{term(condition state)}} for each {{block(Condition)}}.

The {{property(DataItem::type)}} and {{property(DataItem::subType)}} (where applicable) for a {{block(Condition)}} **MAY** be any of the {{property(DataItem::type)}} and {{property(DataItem::subType)}} defined for {{block(DataItem)}}s with {{property(DataItem::category)}} as `SAMPLE` or {{property(DataItem::category)}} as `EVENT` listed in the {{term(Device Information Model)}}.

This section lists additional {{block(Condition)}} types that have been defined to represent the health and fault status of {{termplural(Component)}}.

### Actuator

{{def(ConditionEnum::ACTUATOR)}}



### Communications

{{def(ConditionEnum::COMMUNICATIONS)}}



### DataRange

{{def(ConditionEnum::DATA_RANGE)}}



### LogicProgram

{{def(ConditionEnum::LOGIC_PROGRAM)}}



### MotionProgram

{{def(ConditionEnum::MOTION_PROGRAM)}}



### System

{{def(ConditionEnum::SYSTEM)}}


