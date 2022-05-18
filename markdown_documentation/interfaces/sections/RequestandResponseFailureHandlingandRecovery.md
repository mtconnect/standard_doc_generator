
## Request and Response Failure Handling and Recovery

A significant feature of the {{term(request and response)}} {{term(interaction model)}} is the ability for either piece of equipment to detect a failure associated with either the {{term(request)}} or {{term(response)}} actions.  When either a failure or unexpected action occurs, the {{term(request)}} and the {{term(response)}} portion of the {{term(interaction model)}} can announce a `FAIL` state upon detecting a problem.  The following are graphical models describing multiple scenarios where either the {{term(requester)}} or {{term(responder)}} detects and reacts to a failure.  In these examples, either the {{term(requester)}} or {{term(responder)}} announces the detection of a failure by setting either the {{term(request)}} or the {{term(response)}} state to `FAIL`.  

Once a failure is detected, the {{term(interaction model)}} provides information from each piece of equipment as they attempt to recover from a failure, reset all of their functions associated with the {{term(interface)}} to their original state, and return to normal operation.

The following sections are scenarios that describe how pieces of equipment may react to different types of failures and how they indicate when they are again ready to request a service or respond to a request for service after recovering from those failures:

### Responder Fails Immediately

In this scenario, a failure is detected by the {{term(responder)}} immediately after a {{term(request)}} for service has been initiated by the {{term(requester)}}.

![Responder Fails Immediately](figures/Responder%20Fails%20Immediately.png "Responder Fails Immediately"){: width="0.8"}

In this case, the {{term(request)}} transitions to `ACTIVE` and the {{term(responder)}} immediately detects a failure before it can transition the {{term(response)}} state to `ACTIVE`.  When this occurs, the {{term(responder)}} transitions the {{term(response)}} state to `FAIL`.

After detecting that the {{term(responder)}} has transitioned its state to `FAIL`, the {{term(requester)}} **MUST** change its state to `FAIL`.

The {{term(requester)}}, as part of clearing a failure, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to request a service.  If the recovery is successful, the {{term(requester)}} changes its state from `FAIL` to `READY`.  If for some reason the {{term(requester)}} cannot return to a condition where it is again ready to request a service, it transitions its state from `FAIL` to `NOT_READY`.

The {{term(responder)}}, as part of clearing a failure, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to perform a service.  If the recovery is successful, the {{term(responder)}} changes its {{term(response)}} state from `FAIL` to `READY`.  If for some reason the {{term(responder)}} is not again prepared to perform a service, it transitions its state from `FAIL` to `NOT_READY`.

### Responder Fails While Providing a Service

This is the most common failure scenario.  In this case, the {{term(responder)}} will begin the actions required to provide a service.  During these actions, the {{term(responder)}} detects a failure and transitions its {{term(response)}} state to `FAIL`.

![Responder Fails While Providing a Service](figures/Responder%20Fails%20While%20Providing%20a%20Service.png "Responder Fails While Providing a Service"){: width="0.8"}

When a {{term(requester)}} detects a failure of a {{term(responder)}}, it transitions it state from `ACTIVE` to `FAIL`.  

The {{term(requester)}} resets any partial actions that were initiated and attempts to return to a condition where it is again ready to request a service.  If the recovery is successful, the {{term(requester)}} changes its state from `FAIL` to `READY` if the failure has been cleared and it is again prepared to request another service.  If for some reason the {{term(requester)}} cannot return to a condition where it is again ready to request a service, it transitions its state from `FAIL` to `NOT_READY`.

The {{term(responder)}}, as part of clearing a failure, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to perform a service.  If the recovery is successful, the {{term(responder)}} changes its {{term(response)}} state from `FAIL` to `READY` if it is again prepared to perform a service.  If for some reason the {{term(responder)}} is not again prepared to perform a service, it transitions its state from `FAIL` to `NOT_READY`.

### Requester Failure During a Service Request

In this scenario, the {{term(responder)}} will begin the actions required to provide a service.  During these actions, the {{term(requester)}} detects a failure and transitions its {{term(request)}} state to `FAIL`.

![Requester Fails During a Service Request](figures/Requester%20Fails%20During%20a%20Service%20Request.png "Requester Fails During a Service Request"){: width="0.8"}

When the {{term(responder)}} detects that the {{term(requester)}} has transitioned its {{term(request)}} state to `FAIL`, the {{term(responder)}} also transitions its {{term(response)}} state to `FAIL`. 

The {{term(requester)}}, as part of clearing a failure, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to request a service.  If the recovery is successful, the {{term(requester)}} changes its state from `FAIL` to `READY`.  If for some reason the {{term(requester)}} cannot return to a condition where it is again ready to request a service, it transitions its state from `FAIL` to `NOT_READY`.

The {{term(responder)}}, as part of clearing a failure, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to perform a service.  If the recovery is successful, the {{term(responder)}} changes its {{term(response)}} state from `FAIL` to `READY`.  If for some reason the {{term(responder)}} is not again prepared to perform a service, it transitions its state from `FAIL` to `NOT_READY`.

### Requester Changes to an Unexpected State While Responder is Providing a Service

In some cases, a {{term(requester)}} may transition to an unexpected state after it has initiated a {{term(request)}} for service.  

As demonstrated in {{figure(Requester Makes Unexpected State Change)}}, the {{term(requester)}} has initiated a {{term(request)}} for service and its {{term(request)}} state has been changed to `ACTIVE`.  The {{term(responder)}} begins the actions required to provide the service.  During these actions, the {{term(requester)}} transitions its {{term(request)}} state back to `READY` before the {{term(responder)}} can complete its actions.  This **SHOULD** be regarded as a failure of the {{term(requester)}}.

![Requester Makes Unexpected State Change](figures/Requester%20Makes%20Unexpected%20State%20Change.png "Requester Makes Unexpected State Change"){: width="0.8"}

In this case, the {{term(responder)}} reacts to this change of state of the {{term(requester)}} in the same way as though the {{term(requester)}} had transitioned its {{term(request)}} state to `FAIL` (i.e., the same as in Scenario 3 above).

At this point, the {{term(responder)}} then transitions its {{term(response)}} state to `FAIL`.

The {{term(responder)}} resets any partial actions that were initiated and attempts to return to its original condition where it is again ready to perform a service.  If the recovery is successful, the {{term(responder)}} changes its {{term(response)}} state from `FAIL` to `READY`.  If for some reason the {{term(responder)}} is not again prepared to perform a service, it transitions its state from `FAIL` to `NOT_READY`.

> Note: The same scenario exists if the {{term(requester)}} transitions its {{term(request)}} state to `NOT_READY`.  However, in this case, the {{term(requester)}} then transitions its {{term(request)}} state to `READY` after it resets all of its functions back to a condition where it is again prepared to make a {{term(request)}} for service.


### Responder Changes to an Unexpected State While Providing a Service

Similar to Scenario 5, a {{term(responder)}} may transition to an unexpected state while providing a service.  

As demonstrated in {{figure(Responder Makes Unexpected State Change)}}, the {{term(responder)}} is performing the actions to provide a service and the {{term(response)}} state is `ACTIVE`.  During these actions, the {{term(responder)}} transitions its state to `NOT_READY` before completing its actions.  This should be regarded as a failure of the {{term(responder)}}.

![Responder Makes Unexpected State Change](figures/Responder%20Makes%20Unexpected%20State%20Change.png "Responder Makes Unexpected State Change"){: width="0.8"}

Upon detecting an unexpected state change of the {{term(responder)}}, the {{term(requester)}} transitions its state to `FAIL`.  

The {{term(requester)}} resets any partial actions that were initiated and attempts to return to a condition where it is again ready to request a service.  If the recovery is successful, the {{term(requester)}} changes its state from `FAIL` to `READY`.  If for some reason the {{term(requester)}} cannot return to a condition where it is again ready to request a service, it transitions its state from `FAIL` to `NOT_READY`.

Since the {{term(responder)}} has failed to an invalid state, the condition of the {{term(responder)}} is unknown.  Where possible, the {{term(responder)}} should try to reset to an initial state. 

The {{term(responder)}}, as part of clearing the cause for the change to the unexpected state, should attempt to reset any partial actions that were initiated and then return to a condition where it is again ready to perform a service.  If the recovery is successful, the {{term(responder)}} changes its {{term(response)}} state from the unexpected state to `READY`.  If for some reason the {{term(responder)}} is not again prepared to perform a service, it maintains its state as `NOT_READY`. 

### Responder or Requester Become UNAVAILABLE or Experience a Loss of Communication

In this scenario, a failure occurs in the communications connection between the {{term(responder)}} and {{term(requester)}}.  This failure may result from the {{block(InterfaceState)}} from either piece of equipment returning a value of `UNAVAILABLE` or one of the pieces of equipment does not provide a heartbeat within the desired amount of time (See {{package(Fundamentals)}} for details on heartbeat).   

![Requester - Responder Communication Failure 1](figures/Requester%20-%20Responder%20Communication%20Failure%201.png "Requester - Responder Communication Failure 1"){: width="0.8"}

![Requester - Responder Communication Failure 2](figures/Requester%20-%20Responder%20Communication%20Failure%202.png "Requester - Responder Communication Failure 2"){: width="0.8"}

When one of these situations occurs, each piece of equipment assumes that there has been a failure of the other piece of equipment.

When normal communications are re-established, neither piece of equipment should assume that the {{term(request and response)}} state of the other piece of equipment remains valid.  Both pieces of equipment should set their state to `FAIL`.

The {{term(requester)}}, as part of clearing its `FAIL` state, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to request a service.  If the recovery is successful, the {{term(requester)}} changes its state from `FAIL` to `READY`.  If for some reason the {{term(requester)}} cannot return to a condition where it is again ready to request a service, it transitions its state from `FAIL` to `NOT_READY`.

The {{term(responder)}}, as part of clearing its `FAIL` state, resets any partial actions that were initiated and attempts to return to a condition where it is again ready to perform a service.  If the recovery is successful, the {{term(responder)}} changes its {{term(response)}} state from `FAIL` to `READY`.  If for some reason the {{term(responder)}} is not again prepared to perform a service, it transitions its state from `FAIL` to `NOT_READY`.

