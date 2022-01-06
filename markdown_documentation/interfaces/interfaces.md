
# Interfaces Overview

In many manufacturing processes, multiple pieces of equipment must work together to perform a task.  The traditional method for coordinating the activities between individual pieces of equipment is to connect them using a series of wires to communicate equipment states and demands for action.  These interactions use simple binary ON/OFF signals to accomplished their intention.

In the MTConnect Standard, {{termplural(interface)}} provides a means to replace this traditional method for interconnecting pieces of equipment with a structured {{term(interaction model)}} that provides a rich set of information used to coordinate the actions between pieces of equipment.  Implementers may utilize the information provided by this data model to (1) realize the interaction between pieces of equipment and (2) to extend the functionality of the equipment to improve the overall performance of the manufacturing process. 

The {{term(interaction model)}} used to implement {{termplural(interface)}} provides a lightweight and efficient protocol, simplifies failure recovery scenarios, and defines a structure for implementing a Plug-And-Play relationship between pieces of equipment.  By standardizing the information exchange using this higher-level semantic information model, an implementer may more readily replace a piece of equipment in a manufacturing system with any other piece of equipment capable of providing similar {{term(interaction model)}} functions.

Two primary functions are required to implement the {{term(interaction model)}} for an {{termplural(interface)}} and manage the flow of information between pieces of equipment.  Each piece of equipment needs to have the following:

* An {{term(agent)}} which provides:
    
 - The data required to implement the {{term(interaction model)}}.
    
 - Any other data from a piece of equipment needed to implement the {{term(interface)}} – operating states of the equipment, position information, execution modes, process information, etc. 
 
* A client software application that enables the piece of equipment to acquire and interpret information from another piece of equipment. 


## Interfaces Architecture

MTConnect Standard is based on a communications method that provides no direct way for one piece of equipment to change the state of or cause an action to occur in another piece of equipment.  The {{term(interaction model)}} used to implement {{termplural(interface)}} is based on a {{term(publish and subscribe)}} type of communications as described in {{citetitle(MTCPart1)}} and utilizes a {{term(request)}} and {{term(response)}} information exchange mechanism.  For {{termplural(interface)}}, pieces of equipment must perform both the publish ({{term(agent)}}) and subscribe (client) functions.  


> Note: The current definition of {{termplural(interface)}} addresses the interaction between two pieces of equipment.  Future releases of the MTConnect Standard may address the interaction between multiple (more than two) pieces of equipment.

![Data Flow Architecture for Interfaces](figures/Data%20Flow%20Architecture%20for%20Interfaces.png "Data Flow Architecture for Interfaces"){: width="0.8"}

> Note: The data flow architecture illustrated in {{fig(Data Flow Architecture for Interfaces)}} was historically referred to in the MTConnect Standard as a read-read concept.

In the implementation of the {{term(interaction model)}} for {{termplural(interface)}}, two pieces of equipment can exchange information in the following manner.  One piece of equipment indicates a {{term(request)}} for service by publishing a type of {{term(request)}} using a data item provided through an {{term(agent)}} as defined in {{sect(DataItem Types for Interface)}}.  The client associated with the second piece of equipment, which is subscribing to data from the first machine, detects and interprets that {{term(request)}}.  If the second machine chooses to take any action to fulfill this {{term(request)}}, it can indicate its acceptance by publishing a {{term(response)}} using a data item provided through its {{term(agent)}}.  The client on the first piece of equipment continues to monitor information from the second piece of equipment until it detects an indication that the {{term(response)}} to the {{term(request)}} has been completed or has failed.

An example of this type of interaction between pieces of equipment can be represented by a machine tool that wants the material to be loaded by a robot.  In this example, the machine tool is the {{term(requester)}}, and the robot is the {{term(responder)}}.  On the other hand, if the robot wants the machine tool to open a door, the robot becomes the {{term(requester)}} and the machine tool the {{term(responder)}}.

## Request and Response Information Exchange

The {{block(DataItem)}} elements defined by the {{term(interaction model)}} each have a `REQUEST` and `RESPONSE` subtype.  These subtypes identify if the data item represents a {{term(request)}} or a {{term(response)}}.  Using these data items, a piece of equipment changes the state of its {{term(request)}} or {{term(response)}} to indicate information that can be read by the other piece of equipment.  To aid in understanding how the {{term(interaction model)}} functions, one can view this {{term(interaction model)}} as a simple state machine. 

The interaction between two pieces of equipment can be described as follows.  When the {{term(requester)}} wants an activity to be performed, it transitions its {{term(request)}} state from a `READY` state to an `ACTIVE` state.  In turn, when the client on the {{term(responder)}} reads this information and interprets the {{term(request)}}, the {{term(responder)}} announces that it is performing the requested task by changing its response state to `ACTIVE`.  When the action is finished, the {{term(responder)}} changes its response state to `COMPLETE`.  This pattern of {{term(request)}} and {{term(response)}} provides the basis for the coordination of actions between pieces of equipment.  These actions are implemented using `EVENT` category data items.  (See {{sect(DataItem Types for Interface)}} for details on the {{block(Event)}} type data items defined for {{termplural(interface)}}.)

> Note: The implementation details of how the {{term(responder)}} piece of equipment reacts to the {{term(request)}} and then completes the requested task are up to the implementer.

![Request and Response Overview](figures/Request%20and%20Response%20Overview.png "Request and Response Overview"){: width="0.8"}

The initial condition of both the {{term(request)}} and {{term(response)}} states on both pieces of equipment is `READY`.  The dotted lines indicate the on-going communications that occur to monitor the progress of the interactions between the pieces of equipment.

The interaction between the pieces of equipment as illustrated in {{fig(Request and Response Overview)}} progresses through the sequence listed below.

* The {{term(request)}} transitions from `READY` to `ACTIVE` signaling that a service is needed.

* The {{term(response)}} detects the transition of the {{term(request)}}.

* The {{term(response)}} transitions from `READY` to `ACTIVE` indicating that it is performing the action.

* Once the action has been performed, the {{term(response)}} transitions to `COMPLETE`.

* The {{term(request)}} detects the action is `COMPLETE`.

* The {{term(request)}} transitions back to `READY` acknowledging that the service has been performed.

* The {{term(response)}} detects the {{term(request)}} has returned to `READY`.

* In recognition of this acknowledgement, the {{term(response)}} transitions back to `READY`.

After the final action has been completed, both pieces of equipment are back in the `READY` state indicating that they are able to perform another action.

# Interfaces for Device and Observation Information Models

The {{term(interaction model)}} for implementing {{termplural(interface)}} is defined in the MTConnect Standard as an extension to the {{term(Device Information Model)}} and {{term(Observation Information Model)}}.

A piece of equipment **MAY** support multiple different {{termplural(interface)}}. Each piece of equipment supporting {{termplural(interface)}} **MUST** model the information associated with each {{term(interface)}} as an {{block(Interface)}} component.  {{block(Interface)}} is an abstract {{block(Component)}} and is realized by {{block(Interface)}} component types. 

The {{fig(Interfaces in Entity Hierarchy)}} illustrates where an {{block(Interface)}} is modeled in the {{term(Device Information Model)}} for a piece of equipment.

![Interfaces in Entity Hierarchy](figures/Interfaces%20in%20Entity%20Hierarchy.png "Interfaces in Entity Hierarchy"){: width="0.8"}

{{input(sections/Interfaces.md)}}

{{input(sections/InterfaceTypes.md)}}

{{input(sections/DataforInterface.md)}}

{{input(sections/DataItemTypesforInterface.md)}}

# Operation and Error Recovery



{{input(sections/RequestandResponseFailureHandlingandRecovery.md)}}
