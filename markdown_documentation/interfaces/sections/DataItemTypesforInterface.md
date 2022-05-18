
## DataItem Types for Interface

Each {{block(Interface)}} contains data items which are used to communicate information required to execute the {{term(interface)}}. When these data items are read by another piece of equipment, that piece of equipment can then determine the actions that it may take based upon that data.

{{block(InterfaceState)}} is a data item specifically defined for {{termplural(interface)}}.  It defines the operational state of the {{term(interface)}}.  This is an indicator identifying whether the {{term(interface)}} is functioning or not. See {{sect(InterfaceState)}} for complete semantic details.

Some data items **MAY** be directly associated with the {{block(Interface)}} element and others will be organized by a {{block(References)}} element. It is up to an implementer to determine which additional data items are required for a particular {{term(interface)}}.

### Specific Data Items for the Interaction Model for Interface

A special set of data items have been defined to be used in conjunction with {{block(Interface)}}. They provide information from a piece of equipment to {{term(request)}} a service to be performed by another associated piece of equipment; and for the associated piece of equipment to indicate its progress in performing its {{term(response)}} to the {{term(request)}} for service.  .

Many of the data items describing the services associated with an {{term(interface)}} are paired to describe two distinct actions – one to {{term(request)}} an action to be performed and a second to reverse the action or to return to an original state.  For example, a {{block(DoorInterface)}} will have two actions {{block(OpenDoor)}} and {{block(CloseDoor)}}. An example of an implementation of this would be a robot that indicates to a machine that it would like to have a door opened so that the robot could extract a part from the machine and then asks the machine to close that door once the part has been removed. 

When these data items are used to describe a service associated with an {{term(interface)}}, they **MUST** have one of the following two `subType` elements: `REQUEST` or `RESPONSE`.  These **MUST** be specified to define whether the piece of equipment is functioning as the {{term(requester)}} or {{term(responder)}} for the service to be performed.  The {{term(requester)}} **MUST** specify the `REQUEST` `subType` for the data item and the {{term(responder)}} **MUST** specify a corresponding `RESPONSE` `subType` for the data item to enable the coordination between the two pieces of equipment.   

These data items and their associated `subType` provide the basic structure for implementing the {{term(interaction model)}} for an {{term(interface)}} and are defined in the following sections.

{{figure(Request State Machine)}} and {{figure(Response State Machine)}} show possible state transitions for a {{term(request)}} and {{term(response)}} respectively. The state machine diagrams provide the permissible values of the {{termplural(observation)}} for the {{block(DataItem)}} types listed in this section.

![Request State Machine](figures/Request%20State%20Machine.png "Request State Machine"){: width="0.8"}

![Response State Machine](figures/Response%20State%20Machine.png "Response State Machine"){: width="0.8"}


### CloseChuck

{{def(InterfaceEventEnum:CLOSE_CHUCK)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of CloseChuck

* `REQUEST`

    operating state of the {{term(request)}} to close a chuck.

    

    `RequestStateEnum` Enumeration:

    * `ACTIVE` 

        {{term(requester)}} has initiated a {{term(request)}} for a service and the service has not yet been completed by the {{term(responder)}}.

    * `FAIL` 

        {{term(requester)}} has detected a failure condition.

    * `NOT_READY` 

        {{term(requester)}} is not ready to make a {{term(request)}}.

    * `READY` 

        {{term(requester)}} is prepared to make a {{term(request)}}, but no {{term(request)}} for service is required.

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to close a chuck.

    

    `ResponseStateEnum` Enumeration:

    * `ACTIVE` 

        {{term(responder)}} has detected and accepted a {{term(request)}} for a service and is in the process of performing the service, but the service has not yet
        been completed.

    * `COMPLETE` 

        {{term(responder)}} has completed the actions required to perform the service.

    * `FAIL` 

        {{term(responder)}} has detected a failure condition.

    * `NOT_READY` 

        {{term(responder)}} is not ready to perform a service.

    * `READY` 

        {{term(responder)}} is prepared to react to a {{term(request)}}, but no {{term(request)}} for service has been detected.

### CloseDoor

{{def(InterfaceEventEnum:CLOSE_DOOR)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of CloseDoor

* `REQUEST`

    operating state of the {{term(request)}} to close a door.

    

    The value of {{property(CloseDoor)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to close a door.

    

    The value of {{property(CloseDoor)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### InterfaceState

{{def(InterfaceEventEnum:INTERFACE_STATE)}}

When the {{block(InterfaceState)}} is `DISABLED`, the state of all data items that are specific for the {{term(interaction model)}} associated with that {{block(Interface)}} **MUST** be set to `NOT_READY`.



`InterfaceStateEnum` Enumeration:

* `DISABLED` 

    {{block(Interface)}} is currently not operational.

* `ENABLED` 

    {{block(Interface)}} is currently operational and performing as expected.

### MaterialChange

{{def(InterfaceEventEnum:MATERIAL_CHANGE)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of MaterialChange

* `REQUEST`

    operating state of the {{term(request)}} to change the type of material or product being loaded or fed to a piece of equipment.

    

    The value of {{property(MaterialChange)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to change the type of material or product being loaded or fed to a piece of equipment.

    

    The value of {{property(MaterialChange)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### MaterialFeed

{{def(InterfaceEventEnum:MATERIAL_FEED)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of MaterialFeed

* `REQUEST`

    operating state of the {{term(request)}} to advance material or feed product to a piece of equipment from a continuous or bulk source.

    

    The value of {{property(MaterialFeed)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to advance material or feed product to a piece of equipment from a continuous or bulk source.

    

    The value of {{property(MaterialFeed)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### MaterialLoad

{{def(InterfaceEventEnum:MATERIAL_LOAD)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of MaterialLoad

* `REQUEST`

    operating state of the {{term(request)}} to load a piece of material or product.

    

    The value of {{property(MaterialLoad)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to load a piece of material or product.

    

    The value of {{property(MaterialLoad)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### MaterialRetract

{{def(InterfaceEventEnum:MATERIAL_RETRACT)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of MaterialRetract

* `REQUEST`

    operating state of the {{term(request)}} to remove or retract material or product.

    

    The value of {{property(MaterialRetract)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to remove or retract material or product.

    

    The value of {{property(MaterialRetract)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### MaterialUnload

{{def(InterfaceEventEnum:MATERIAL_UNLOAD)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of MaterialUnload

* `REQUEST`

    operating state of the {{term(request)}} to unload a piece of material or product.

    

    The value of {{property(MaterialUnload)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to unload a piece of material or product.

    

    The value of {{property(MaterialUnload)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### OpenChuck

{{def(InterfaceEventEnum:OPEN_CHUCK)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of OpenChuck

* `REQUEST`

    operating state of the {{term(request)}} to open a chuck.

    

    The value of {{property(OpenChuck)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to open a chuck.

    

    The value of {{property(OpenChuck)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### OpenDoor

{{def(InterfaceEventEnum:OPEN_DOOR)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of OpenDoor

* `REQUEST`

    operating state of the {{term(request)}} to open a door.

    

    The value of {{property(OpenDoor)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to open a door.

    

    The value of {{property(OpenDoor)}} **MUST** be one of the `ResponseStateEnum` enumeration. 

### PartChange

{{def(InterfaceEventEnum:PART_CHANGE)}}



A {{property(subType)}} **MUST** always be specified.

#### Subtypes of PartChange

* `REQUEST`

    operating state of the {{term(request)}} to change the part or product associated with a piece of equipment to a different part or product.

    

    The value of {{property(PartChange)}} **MUST** be one of the `RequestStateEnum` enumeration. 

* `RESPONSE`

    operating state of the {{term(response)}} to a {{term(request)}} to change the part or product associated with a piece of equipment to a different part or product.

    

    The value of {{property(PartChange)}} **MUST** be one of the `ResponseStateEnum` enumeration. 
