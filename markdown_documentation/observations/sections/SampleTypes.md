
## Sample Types

This section provides semantic information for {{block(Sample)}} types.

### Acceleration

positive rate of change of velocity.




The {{property(units)}} of {{property(Acceleration)}} **MUST** be `MILLIMETER/SECOND^2`.

#### Subtypes of Acceleration


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AccumulatedTime

accumulated time for an activity or event.




The {{property(units)}} of {{property(AccumulatedTime)}} **MUST** be `SECOND`.

### `<<deprecated>>`Amperage

strength of electrical current.

**DEPRECATED** in *Version 1.6*. Replaced by `AMPERAGE_AC` and `AMPERAGE_DC`.




The {{property(units)}} of {{property(Amperage)}} **MUST** be `AMPERE`.

#### Subtypes of Amperage


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `ALTERNATING`

    measurement of alternating voltage or current. 
    
    If not specified further in statistic, defaults to RMS voltage. 
    

* `DIRECT`

    measurement of DC current or voltage.
    

* `TARGET`

    goal of the operation or process.
    

### AmperageAC

electrical current that reverses direction at regular short intervals.




The {{property(units)}} of {{property(AmperageAC)}} **MUST** be `AMPERE`.

#### Subtypes of AmperageAC


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AmperageDC

electric current flowing in one direction only.




The {{property(units)}} of {{property(AmperageDC)}} **MUST** be `AMPERE`.

#### Subtypes of AmperageDC


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### Angle

angular position.




The {{property(units)}} of {{property(Angle)}} **MUST** be `DEGREE`.

#### Subtypes of Angle


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### AngularAcceleration

positive rate of change of angular velocity.




The {{property(units)}} of {{property(AngularAcceleration)}} **MUST** be `DEGREE/SECOND^2`.

#### Subtypes of AngularAcceleration


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AngularDeceleration

negative rate of change of angular velocity.




The {{property(units)}} of {{property(AngularDeceleration)}} **MUST** be `DEGREE/SECOND^2`.

#### Subtypes of AngularDeceleration


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### AngularVelocity

rate of change of angular position.




The {{property(units)}} of {{property(AngularVelocity)}} **MUST** be `DEGREE/SECOND`.

### AssetUpdateRate

average rate of change of values for assets in the MTConnect streams. 

The average is computed over a rolling window defined by the implementation.




The {{property(units)}} of {{property(AssetUpdateRate)}} **MUST** be `COUNT/SECOND`.

### AxisFeedrate

feedrate of a linear axis.




The {{property(units)}} of {{property(AxisFeedrate)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of AxisFeedrate


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `JOG`

    feedrate specified by a logic or motion program, by a pre-set value, or set by a switch as the feedrate for the {{block(Axis)}}. 
    

* `OVERRIDE`

    operator's overridden value.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### CapacityFluid

fluid capacity of an object or container.




The {{property(units)}} of {{property(CapacityFluid)}} **MUST** be `MILLILITER`.

### CapacitySpatial

geometric capacity of an object or container.




The {{property(units)}} of {{property(CapacitySpatial)}} **MUST** be `CUBIC_MILLIMETER`.

### ClockTime

time provided by a timing device at a specific point in time.




The {{property(units)}} of {{property(ClockTime)}} **MUST** be `yyyy-mm-ddthh:mm:ss.ffff`.

### Concentration

percentage of one component within a mixture of components.




The {{property(units)}} of {{property(Concentration)}} **MUST** be `PERCENT`.

### Conductivity

ability of a material to conduct electricity.




The {{property(units)}} of {{property(Conductivity)}} **MUST** be `SIEMENS/METER`.

### CuttingSpeed

speed difference (relative velocity) between the cutting mechanism and the surface of the workpiece it is operating on.




The {{property(units)}} of {{property(CuttingSpeed)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of CuttingSpeed


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### Deceleration

negative rate of change of velocity.




The {{property(units)}} of {{property(Deceleration)}} **MUST** be `MILLIMETER/SECOND^2`.

#### Subtypes of Deceleration


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### Density

volumetric mass of a material per unit volume of that material.




The {{property(units)}} of {{property(Density)}} **MUST** be `MILLIGRAM/CUBIC_MILLIMETER`.

### DepositionAccelerationVolumetric

rate of change in spatial volume of material deposited in an additive manufacturing process.

The rate of change in spatial volume of material deposited in an additive manufacturing process.


The {{property(units)}} of {{property(DepositionAccelerationVolumetric)}} **MUST** be `CUBIC_MILLIMETER/SECOND^2`.

#### Subtypes of DepositionAccelerationVolumetric


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionDensity

density of the material deposited in an additive manufacturing process per unit of volume.




The {{property(units)}} of {{property(DepositionDensity)}} **MUST** be `MILLIGRAM/CUBIC_MILLIMETER`.

#### Subtypes of DepositionDensity


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionMass

mass of the material deposited in an additive manufacturing process.




The {{property(units)}} of {{property(DepositionMass)}} **MUST** be `MILLIGRAM`.

#### Subtypes of DepositionMass


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionRateVolumetric

rate at which a spatial volume of material is deposited in an additive manufacturing process.




The {{property(units)}} of {{property(DepositionRateVolumetric)}} **MUST** be `CUBIC_MILLIMETER/SECOND`.

#### Subtypes of DepositionRateVolumetric


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### DepositionVolume

spatial volume of material to be deposited in an additive manufacturing process.




The {{property(units)}} of {{property(DepositionVolume)}} **MUST** be `CUBIC_MILLIMETER`.

#### Subtypes of DepositionVolume


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### Diameter

dimension of a diameter.




The {{property(units)}} of {{property(Diameter)}} **MUST** be `MILLIMETER`.

### Displacement

change in position of an object.




The {{property(units)}} of {{property(Displacement)}} **MUST** be `MILLIMETER`.

### ElectricalEnergy

{{block(Wattage)}} used or generated by a component over an interval of time.




The {{property(units)}} of {{property(ElectricalEnergy)}} **MUST** be `WATT_SECOND`.

### EquipmentTimer

amount of time a piece of equipment or a sub-part of a piece of equipment has performed specific activities.




The {{property(units)}} of {{property(EquipmentTimer)}} **MUST** be `SECOND`.

#### Subtypes of EquipmentTimer


* `DELAY`

    elapsed time of a temporary halt of action.
    

* `LOADED`

    time that the sub-parts of a piece of equipment are under load.
    
    Example: For traditional machine tools, this is a measurement of the time that the cutting tool is assumed to be engaged with the part.
    

* `OPERATING`

    time that the major sub-parts of a piece of equipment are powered or performing any activity whether producing a part or product or not.
    
    Example: For traditional machine tools, this includes `WORKING`, plus idle time.
    

* `POWERED`

    time that primary power is applied to the piece of equipment and, as a minimum, the controller or logic portion of the piece of equipment is powered and functioning or components that are required to remain on are powered.
    
    Example: Heaters for an extrusion machine that are required to be powered even when the equipment is turned off.
    

* `WORKING`

    time that a piece of equipment is performing any activity the equipment is active and performing a function under load or not.
    
    Example: For traditional machine tools, this includes `LOADED`, plus rapid moves, tool changes, etc.
    

### FillLevel

amount of a substance remaining compared to the planned maximum amount of that substance.




The {{property(units)}} of {{property(FillLevel)}} **MUST** be `PERCENT`.

### Flow

rate of flow of a fluid.




The {{property(units)}} of {{property(Flow)}} **MUST** be `LITER/SECOND`.

### Frequency

number of occurrences of a repeating event per unit time.




The {{property(units)}} of {{property(Frequency)}} **MUST** be `HERTZ`.

### GlobalPosition

**DEPRECATED** in Version 1.1.




The {{property(units)}} of {{property(GlobalPosition)}} **MUST** be `MILLIMETER`.

### HumidityAbsolute

amount of water vapor expressed in grams per cubic meter.




The {{property(units)}} of {{property(HumidityAbsolute)}} **MUST** be `GRAM/CUBIC_METER`.

#### Subtypes of HumidityAbsolute


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### HumidityRelative

amount of water vapor present expressed as a percent to reach saturation at the same temperature.




The {{property(units)}} of {{property(HumidityRelative)}} **MUST** be `PERCENT`.

#### Subtypes of HumidityRelative


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### HumiditySpecific

ratio of the water vapor present over the total weight of the water vapor and air present expressed as a percent.




The {{property(units)}} of {{property(HumiditySpecific)}} **MUST** be `PERCENT`.

#### Subtypes of HumiditySpecific


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### Length

reference to a length type tool offset variable.




The {{property(units)}} of {{property(Length)}} **MUST** be `MILLIMETER`.

#### Subtypes of Length


* `REMAINING`

    remaining total length of an object.
    

* `STANDARD`

    standard or original length of an object.
    

* `USEABLE`

    remaining usable length of an object.
    

### Level

level of a resource.

**DEPRECATED** in *Version 1.2*.  See `FILL_LEVEL`.




The {{property(units)}} of {{property(Level)}} **MUST** be `PERCENT`.

### LinearForce

{{term(force)}} applied to a mass in one direction only.




The {{property(units)}} of {{property(LinearForce)}} **MUST** be `NEWTON`.

### Load

actual versus the standard rating of a piece of equipment.




The {{property(units)}} of {{property(Load)}} **MUST** be `PERCENT`.

### Mass

mass of an object(s) or an amount of material.




The {{property(units)}} of {{property(Mass)}} **MUST** be `KILOGRAM`.

### ObservationUpdateRate

average rate of change of values for data items in the MTConnect streams. The average is computed over a rolling window defined by the implementation.




The {{property(units)}} of {{property(ObservationUpdateRate)}} **MUST** be `COUNT/SECOND`.

### Openness

percentage open where 100% is fully open and 0% is fully closed.




The {{property(units)}} of {{property(Openness)}} **MUST** be `PERCENT`.

### Orientation

measured or calculated orientation of a plane or vector relative to a cartesian coordinate system.




The {{property(units)}} of {{property(Orientation)}} **MUST** be `DEGREE_3D`.

#### Subtypes of Orientation


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

### PH

acidity or alkalinity of a solution.




The {{property(units)}} of {{property(PH)}} **MUST** be `PH`.

### PathFeedrate

feedrate for the axes, or a single axis, associated with a {{block(Path)}} component.




The {{property(units)}} of {{property(PathFeedrate)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of PathFeedrate


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `JOG`

    feedrate specified by a logic or motion program, by a pre-set value, or set by
    a switch as the feedrate for the axes, or a single axis, associated with a `Path`
    when operating in a manual state or method (jogging).
    

* `OVERRIDE`

    operator's overridden value.
    
    **DEPRECATED** in *Version 1.3*.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

* `RAPID`

    performing an operation faster or in less time than nominal rate.
    

### PathFeedratePerRevolution

feedrate for the axes, or a single axis.




The {{property(units)}} of {{property(PathFeedratePerRevolution)}} **MUST** be `MILLIMETER/REVOLUTION`.

#### Subtypes of PathFeedratePerRevolution


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### PathPosition

measured or calculated position of a control point associated with a {{block(Controller)}} entity, or {{block(Path)}} entity if provided, of a piece of equipment.




The {{property(units)}} of {{property(PathPosition)}} **MUST** be `MILLIMETER_3D`.

#### Subtypes of PathPosition


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROBE`

    position provided by a measurement probe.
    
    **DEPRECATION WARNING**: May be deprecated in the future.
    

* `TARGET`

    goal of the operation or process.
    

### Position

measured or calculated position of a {{block(Component)}} element as reported by a piece of equipment.




The {{property(units)}} of {{property(Position)}} **MUST** be `MILLIMETER`.

#### Subtypes of Position


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

* `TARGET`

    goal of the operation or process.
    

### PowerFactor

ratio of real power flowing to a load to the apparent power in that AC circuit.




The {{property(units)}} of {{property(PowerFactor)}} **MUST** be `PERCENT`.

### Pressure

force per unit area measured relative to atmospheric pressure. 

Commonly referred to as gauge pressure.




The {{property(units)}} of {{property(Pressure)}} **MUST** be `PASCAL`.

### PressureAbsolute

force per unit area measured relative to a vacuum.

The force per unit area measured relative to a vacuum.


The {{property(units)}} of {{property(PressureAbsolute)}} **MUST** be `PASCAL`.

### PressurizationRate

change of pressure per unit time.




The {{property(units)}} of {{property(PressurizationRate)}} **MUST** be `PASCAL/SECOND`.

#### Subtypes of PressurizationRate


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### ProcessTimer

amount of time a piece of equipment has performed different types of activities associated with the process being performed at that piece of equipment.




The {{property(units)}} of {{property(ProcessTimer)}} **MUST** be `SECOND`.

#### Subtypes of ProcessTimer


* `DELAY`

    elapsed time of a temporary halt of action.
    

* `PROCESS`

    time from the beginning of production of a part or product on a piece of equipment until the time that production is complete for that part or product on
    that piece of equipment.
    
    This includes the time that the piece of equipment is running, producing parts or products, or in the process of producing parts.
    

### Resistance

degree to which a substance opposes the passage of an electric current.




The {{property(units)}} of {{property(Resistance)}} **MUST** be `OHM`.

### RotaryVelocity

rotational speed of a rotary axis.




The {{property(units)}} of {{property(RotaryVelocity)}} **MUST** be `REVOLUTION/MINUTE`.

#### Subtypes of RotaryVelocity


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `OVERRIDE`

    The operators overridden value.
    
    
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### SoundLevel

sound level or sound pressure level relative to atmospheric pressure.




The {{property(units)}} of {{property(SoundLevel)}} **MUST** be `DECIBEL`.

#### Subtypes of SoundLevel


* `A_SCALE`

    A Scale weighting factor.   This is the default weighting factor if no factor is specified
    

* `B_SCALE`

    B Scale weighting factor
    

* `C_SCALE`

    C Scale weighting factor
    

* `D_SCALE`

    D Scale weighting factor
    

* `NO_SCALE`

    No weighting factor on the frequency scale
    

### `<<deprecated>>`SpindleSpeed

rotational speed of the rotary axis.

**DEPRECATED** in *Version 1.2*.  Replaced by `ROTARY_VELOCITY`.




The {{property(units)}} of {{property(SpindleSpeed)}} **MUST** be `REVOLUTION/MINUTE`.

#### Subtypes of SpindleSpeed


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `OVERRIDE`

    operator's overridden value.
    
    **DEPRECATED** in *Version 1.3*.
    

### Strain

amount of deformation per unit length of an object when a load is applied.




The {{property(units)}} of {{property(Strain)}} **MUST** be `PERCENT`.

### Temperature

degree of hotness or coldness measured on a definite scale.




The {{property(units)}} of {{property(Temperature)}} **MUST** be `CELSIUS`.

### Tension

force that stretches or elongates an object.




The {{property(units)}} of {{property(Tension)}} **MUST** be `NEWTON`.

### Tilt

angular displacement.




The {{property(units)}} of {{property(Tilt)}} **MUST** be `MICRO_RADIAN`.

### Torque

turning force exerted on an object or by an object.




The {{property(units)}} of {{property(Torque)}} **MUST** be `NEWTON_METER`.

### ValvePosition

percentage open of a value where 100% is fully open and 0% is fully closed.

Correlation with {{block(ValveState)}}:

* If the value is in a fixed state and is not 0%, then it is `OPEN`.
* If the valve is transitioning from `OPEN` to `CLOSED`, then it is `CLOSING`.
* If the valve is transitioning from `CLOSED` to `OPEN`, then it is `OPENING`.
* If the valve is in a fixed state and is 0%, then it is `CLOSED`.


The {{property(units)}} of {{property(ValvePosition)}} **MUST** be `PERCENT`.

### Velocity

rate of change of position of a {{block(Component)}}.




The {{property(units)}} of {{property(Velocity)}} **MUST** be `MILLIMETER/SECOND`.

### Viscosity

fluid's resistance to flow.




The {{property(units)}} of {{property(Viscosity)}} **MUST** be `PASCAL_SECOND`.

### VoltAmpere

apparent power in an electrical circuit, equal to the product of root-mean-square (RMS) voltage and RMS current (commonly referred to as VA).




The {{property(units)}} of {{property(VoltAmpere)}} **MUST** be `VOLT_AMPERE`.

### VoltAmpereReactive

reactive power in an AC electrical circuit (commonly referred to as VAR).




The {{property(units)}} of {{property(VoltAmpereReactive)}} **MUST** be `VOLT_AMPERE_REACTIVE`.

### `<<deprecated>>`Voltage

electrical potential between two points.

**DEPRECATED** in *Version 1.6*. Replaced by `VOLTAGE_AC` and `VOLTAGE_DC`.




The {{property(units)}} of {{property(Voltage)}} **MUST** be `VOLT`.

#### Subtypes of Voltage


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `ALTERNATING`

    alternating voltage or current. 
    
    If not specified further in statistic, defaults to RMS voltage. 
    

* `DIRECT`

    DC current or voltage.
    

* `TARGET`

    goal of the operation or process.
    

### VoltageAC

electrical potential between two points in an electrical circuit in which the current periodically reverses direction.




The {{property(units)}} of {{property(VoltageAC)}} **MUST** be `VOLT`.

#### Subtypes of VoltageAC


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### VoltageDC

electrical potential between two points in an electrical circuit in which the current is unidirectional.




The {{property(units)}} of {{property(VoltageDC)}} **MUST** be `VOLT`.

#### Subtypes of VoltageDC


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    

* `PROGRAMMED`

    directive value without offsets and adjustments.
    

### VolumeFluid

fluid volume of an object or container.




The {{property(units)}} of {{property(VolumeFluid)}} **MUST** be `MILLILITER`.

#### Subtypes of VolumeFluid


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `CONSUMED`

    reported or measured value of the amount used in the manufacturing process.
    

* `ENDED`

    boundary when an activity or an event terminates.
    

* `PART`

    reported or measured value of amount included in the {{term(part)}}.
    

* `START`

    boundary when an activity or an event commences.
    

* `WASTE`

    reported or measured value of the amount discarded.
    

### VolumeSpatial

geometric volume of an object or container.




The {{property(units)}} of {{property(VolumeSpatial)}} **MUST** be `CUBIC_MILLIMETER`.

#### Subtypes of VolumeSpatial


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `CONSUMED`

    reported or measured value of the amount used in the manufacturing process.
    

* `ENDED`

    boundary when an activity or an event terminates.
    

* `PART`

    reported or measured value of amount included in the {{term(part)}}.
    

* `START`

    boundary when an activity or an event commences.
    

* `WASTE`

    reported or measured value of the amount discarded
    

### Wattage

power flowing through or dissipated by an electrical circuit or piece of equipment.




The {{property(units)}} of {{property(Wattage)}} **MUST** be `WATT`.

#### Subtypes of Wattage


* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    

* `TARGET`

    goal of the operation or process.
    

### XDimension

dimension of an entity relative to the X direction of the referenced coordinate system.




The {{property(units)}} of {{property(XDimension)}} **MUST** be `MILLIMETER`.

### YDimension

dimension of an entity relative to the Y direction of the referenced coordinate system.




The {{property(units)}} of {{property(YDimension)}} **MUST** be `MILLIMETER`.

### ZDimension

dimension of an entity relative to the Z direction of the referenced coordinate system.




The {{property(units)}} of {{property(ZDimension)}} **MUST** be `MILLIMETER`.
