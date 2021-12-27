
## DataItem SubTypes

This section provides semantic information for the {{property(subType)}} property of a {{block(DataItem)}}.

### DataItemSubType


{{block(DataItem)}} that provides a sub-categorization for the {{property(type)}} property modeled as {{property(subType)}} for a {{block(DataItem)}}.


The value of {{property(subType)}} for {{block(DataItem)}} **MUST** be one of the following:


* `ABORTED` 

    actions or activities that were attempted, but terminated before they could be completed.
    
    

* `ABSOLUTE` 

    relating to or derived in the simplest manner from the fundamental units or measurements.

* `ACTION` 

    indication of the operating state of a mechanism.

* `ACTIVE` 

    relating to logic or motion program currently executing.

* `ACTUAL` 

    measured or reported value of an {{term(observation)}}.

* `ALL` 

    all actions, items, or activities being counted independent of the outcome.

* `ALTERNATING` 

    measurement of alternating voltage or current. If not specified further in statistic, defaults to RMS voltage. 

* `AUXILIARY` 

    when multiple locations on a piece of bar stock being feed by a bar feeder are referenced as the indication of whether the end of that piece of bar stock has been reached.

* `A_SCALE` 

    A-Scale weighting factor on the frequency scale.

* `BAD` 

    actions, items, or activities being counted that do not conform to specification or expectation.

* `BATCH` 

    group of parts produced in a batch.

* `BRINELL` 

    scale to measure the resistance to deformation of a surface.

* `B_SCALE` 

    B-Scale weighting factor on the frequency scale.

* `COMMANDED` 

    directive value including adjustments such as an offset or overrides.

* `COMPLETE` 

    associated with the completion of an activity or event.

* `CONSUMED` 

    amount of material consumed from an object or container during a manufacturing process.

* `CONTROL` 

    state of the enabling signal or control logic that enables or disables the function or operation of the entity.

* `C_SCALE` 

    C-Scale weighting factor on the frequency scale.

* `DELAY` 

    elapsed time of a temporary halt of action.

* `DIRECT` 

    DC current or voltage.

* `DRY_RUN` 

    setting or operator selection used to execute a test mode to confirm the execution of machine functions.

* `D_SCALE` 

    D-Scale weighting factor on the frequency scale.

* `ENDED` 

    boundary when an activity or an event terminates.

* `EXPIRATION` 

    relating to the expiration or end of useful life for a material or other physical item.

* `FAILED` 

    actions or activities that were attempted , but failed to complete or resulted in an unexpected or unacceptable outcome.

* `FIRST_USE` 

    relating to the first use of a material or other physical item.

* `GATEWAY` 

    Gateway for the {{block(Component)}} network.

* `GOOD` 

    actions, items, or activities being counted that conform to specification or expectation.

* `HEAT_TREAT` 

    material heat number.

* `INCREMENTAL` 

    relating to or derived from the last {{term(observation)}}.

* `INSTALL_DATE` 

    date the hardware or software was installed.

* `IPV4_ADDRESS` 

    IPV4 network address of the {{block(Component)}}.

* `IPV6_ADDRESS` 

    The IPV6 network address of the {{block(Component)}}.

* `ISO_STEP_EXECUTABLE` 

    reference to a ISO 10303 Executable.

* `JOG` 

    feedrate specified by a logic or motion program when operating in a manual state or method (jogging).

* `LATERAL` 

    indication of the position of a mechanism that may move in a lateral direction.

* `LEEB` 

    scale to measure the elasticity of a surface.

* `LENGTH` 

    reference to a length type tool offset variable.

    Subtypes of `LENGTH` : `STANDARD`, `REMAINING`, `USEABLE`.


* `LICENSE` 

    license code to validate or activate the hardware or software.

* `LINE` 

    state of the power source.

    Subtypes of `LINE` : `MAXIMUM`, `MINIMUM`.


* `LINEAR` 

    direction of motion of a linear motion.

* `LOADED` 

    indication that the subparts of a piece of equipment are under load.

* `LOT` 

    group of parts tracked as a lot.

* `MACHINE_AXIS_LOCK` 

    setting or operator selection that changes the behavior of the controller on a piece of equipment.

* `MAC_ADDRESS` 

    Media Access Control Address. The unique physical address of the network hardware.

* `MAIN` 

    relating to the primary logic or motion program currently being executed.

* `MAINTENANCE` 

    relating to maintenance on the piece of equipment.

* `MANUAL_UNCLAMP` 

    indication of the state of an operator controlled interlock that can inhibit the ability to initiate an unclamp action of an electronically controlled chuck.

* `MANUFACTURE` 

    related to the production of a material or other physical item.

* `MANUFACTURER` 

    corporate identity for the maker of the hardware or software.

* `MAXIMUM` 

    maximum value.

* `MINIMUM` 

    minimum value.

* `MOHS` 

    scale to measure the resistance to scratching of a surface.

* `MOTION` 

    indication of the open or closed state of a mechanism.

* `NO_SCALE` 

    no weighting factor on the frequency scale.

* `OPERATING` 

    piece of equipment that is powered or performing any activity.

* `OPERATOR` 

    relating to the person currently responsible for operating the piece of equipment.

* `OPTIONAL_STOP` 

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 

* `ORDER_NUMBER` 

    authorization of a process occurrence.

* `OVERRIDE` 

    overridden value.

* `PART` 

    amount included in the {{term(part)}}.

* `PART_FAMILY` 

    group of parts having similarities in geometry, manufacturing process, and/or functions.

* `PART_NAME` 

    word or set of words by which a part is known, addressed, or referred to.

* `PART_NUMBER` 

    particular part design or model.

* `POWERED` 

    piece of equipment is powered and functioning or {{block(Component)}} that are required to remain on are powered.

* `PRIMARY` 

    main or most important location of a piece of bar stock.

* `PROBE` 

    position provided by a measurement probe.
    
    **DEPRECATION WARNING**: May be deprecated in the future.

* `PROCESS` 

    relating to production of a part or product on a piece of equipment.

* `PROCESS_NAME` 

    word or set of words by which a process being executed (process occurrence) by the device is known, addressed, or referred to.

* `PROCESS_PLAN` 

    process plan that a process occurrence belongs to.

* `PROCESS_STEP` 

    step in the process plan that this occurrence corresponds to. 

* `PROGRAMMED` 

    directive value without offsets and adjustments.

* `RADIAL` 

    reference to a radial type tool offset variable.

* `RAPID` 

    performing an operation faster or in less time than nominal rate.

* `RAW_MATERIAL` 

    material that is used to produce parts.

* `RELEASE_DATE` 

    date the hardware or software was released for general use.

* `REMAINING` 

    remaining measure or count of an action, object or activity.

* `REQUEST` 

    {{term(request)}} by an {{block(Interface)}} for a task.

* `RESPONSE` 

    {{term(response)}} by an {{block(Interface)}} to a {{term(request)}} for a task.

* `ROCKWELL` 

    scale to measure the resistance to deformation of a surface.

* `ROTARY` 

    direction of a rotary motion using the right hand rule convention.

* `SCHEDULE` 

    identity of a control program that is used to specify the order of execution of other programs.

* `SERIAL_NUMBER` 

    serial number that uniquely identifies a specific part.

* `SET_UP` 

    relating to the preparation of a piece of equipment for production or restoring the piece of equipment to a neutral state after production.

* `SHORE` 

    scale to measure the resistance to deformation of a surface.

* `SINGLE_BLOCK` 

    setting or operator selection that changes the behavior of the controller on a piece of equipment. 

* `STANDARD` 

    standard measure of an object or an action.

* `START` 

    boundary when an activity or an event commences.

* `SUBNET_MASK` 

    SubNet mask for the {{block(Component)}} network.

* `SWITCHED` 

    indication of the activation state of a mechanism represented by a {{block(Composition)}}.

* `TARGET` 

    goal of the operation or process.

* `TARGET_COMPLETION` 

    relating to the end or completion of an activity or event.

* `TOOL_CHANGE_STOP` 

    setting or operator selection that changes the behavior of the controller on a piece of equipment.

* `USEABLE` 

    remaining usable measure of an object or action.

* `UUID` 

    universally unique identifier as specified in ISO 11578 or RFC 4122.

* `VERSION` 

    version of the hardware or software.

* `VERTICAL` 

    indication of the position of a mechanism that may move in a vertical direction.

* `VICKERS` 

    scale to measure the resistance to deformation of a surface.

* `VLAN_ID` 

    layer2 Virtual Local Network (VLAN) ID for the {{block(Component)}} network.

* `WASTE` 

    amount discarded.

* `WIRELESS` 

    identifies whether the connection type is wireless.

* `WORKING` 

    piece of equipment performing any activity, the equipment is active and performing a function under load or not.
