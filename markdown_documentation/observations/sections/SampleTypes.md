
## Sample Types

This section provides semantic information for {{block(Sample)}} types.

### Acceleration

{{def(SampleEnum:ACCELERATION)}}



The {{property(units)}} of {{property(Acceleration)}} **MUST** be `MILLIMETER/SECOND^2`.

The default {{property(subType)}} of {{property(Acceleration)}} is `ACTUAL`.

#### Subtypes of Acceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### AccumulatedTime

{{def(SampleEnum:ACCUMULATED_TIME)}}



The {{property(units)}} of {{property(AccumulatedTime)}} **MUST** be `SECOND`.

### `<<deprecated>>`Amperage

{{def(SampleEnum:AMPERAGE)}}



The {{property(units)}} of {{property(Amperage)}} **MUST** be `AMPERE`.

#### Subtypes of Amperage

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
    **DEPRECATED** in *Version 1.6*.

    

* `ALTERNATING`

    measurement of alternating voltage or current. 
    
    If not specified further in statistic, defaults to RMS voltage. 
    
    **DEPRECATED** in *Version 1.6*.

    

* `DIRECT`

    measurement of DC current or voltage.
    
    **DEPRECATED** in *Version 1.6*.

    

* `TARGET`

    goal of the operation or process.
    
    **DEPRECATED** in *Version 1.6*.

    

### AmperageAC

{{def(SampleEnum:AMPERAGE_AC)}}



The {{property(units)}} of {{property(AmperageAC)}} **MUST** be `AMPERE`.

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of AmperageAC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### AmperageDC

{{def(SampleEnum:AMPERAGE_DC)}}



The {{property(units)}} of {{property(AmperageDC)}} **MUST** be `AMPERE`.

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of AmperageDC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### Angle

{{def(SampleEnum:ANGLE)}}



The {{property(units)}} of {{property(Angle)}} **MUST** be `DEGREE`.

#### Subtypes of Angle

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### AngularAcceleration

{{def(SampleEnum:ANGULAR_ACCELERATION)}}



The {{property(units)}} of {{property(AngularAcceleration)}} **MUST** be `DEGREE/SECOND^2`.

The default {{property(subType)}} of {{property(AngularAcceleration)}} is `ACTUAL`.

#### Subtypes of AngularAcceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### AngularDeceleration

{{def(SampleEnum:ANGULAR_DECELERATION)}}



The {{property(units)}} of {{property(AngularDeceleration)}} **MUST** be `DEGREE/SECOND^2`.

The default {{property(subType)}} of {{property(AngularDeceleration)}} is `ACTUAL`.

#### Subtypes of AngularDeceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### AngularVelocity

{{def(SampleEnum:ANGULAR_VELOCITY)}}



The {{property(units)}} of {{property(AngularVelocity)}} **MUST** be `DEGREE/SECOND`.

### AssetUpdateRate

{{def(SampleEnum:ASSET_UPDATE_RATE)}}



The {{property(units)}} of {{property(AssetUpdateRate)}} **MUST** be `COUNT/SECOND`.

### AxisFeedrate

{{def(SampleEnum:AXIS_FEEDRATE)}}



The {{property(units)}} of {{property(AxisFeedrate)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of AxisFeedrate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `JOG`

    relating to momentary activation of a function or a movement.
    
    **DEPRECATION WARNING**: May be deprecated in the future.

    

* `OVERRIDE`

    operator's overridden value.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

* `RAPID`

    performing an operation faster or in less time than nominal rate.

    

### BatteryCapacity

{{def(SampleEnum:BATTERY_CAPACITY)}}



The {{property(units)}} of {{property(BatteryCapacity)}} **MUST** be `COULOMB`.

The default {{property(subType)}} of {{property(BatteryCapacity)}} is `ACTUAL`.

#### Subtypes of BatteryCapacity

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `TARGET`

    goal of the operation or process.

    

### BatteryCharge

{{def(SampleEnum:BATTERY_CHARGE)}}



The {{property(units)}} of {{property(BatteryCharge)}} **MUST** be `PERCENT`.

The default {{property(subType)}} of {{property(BatteryCharge)}} is `ACTUAL`.

#### Subtypes of BatteryCharge

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `TARGET`

    goal of the operation or process.

    

### CapacityFluid

{{def(SampleEnum:CAPACITY_FLUID)}}



The {{property(units)}} of {{property(CapacityFluid)}} **MUST** be `MILLILITER`.

### CapacitySpatial

{{def(SampleEnum:CAPACITY_SPATIAL)}}



The {{property(units)}} of {{property(CapacitySpatial)}} **MUST** be `CUBIC_MILLIMETER`.

### ChargeRate

{{def(SampleEnum:CHARGE_RATE)}}



The {{property(units)}} of {{property(ChargeRate)}} **MUST** be `AMPERE`.

The default {{property(subType)}} of {{property(ChargeRate)}} is `ACTUAL`.

#### Subtypes of ChargeRate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `TARGET`

    goal of the operation or process.

    

### Concentration

{{def(SampleEnum:CONCENTRATION)}}



The {{property(units)}} of {{property(Concentration)}} **MUST** be `PERCENT`.

### Conductivity

{{def(SampleEnum:CONDUCTIVITY)}}



The {{property(units)}} of {{property(Conductivity)}} **MUST** be `SIEMENS/METER`.

### CuttingSpeed

{{def(SampleEnum:CUTTING_SPEED)}}



The {{property(units)}} of {{property(CuttingSpeed)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of CuttingSpeed

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### Deceleration

{{def(SampleEnum:DECELERATION)}}



The {{property(units)}} of {{property(Deceleration)}} **MUST** be `MILLIMETER/SECOND^2`.

The default {{property(subType)}} of {{property(Deceleration)}} is `ACTUAL`.

#### Subtypes of Deceleration

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### Density

{{def(SampleEnum:DENSITY)}}



The {{property(units)}} of {{property(Density)}} **MUST** be `MILLIGRAM/CUBIC_MILLIMETER`.

### DepositionAccelerationVolumetric

{{def(SampleEnum:DEPOSITION_ACCELERATION_VOLUMETRIC)}}



The {{property(units)}} of {{property(DepositionAccelerationVolumetric)}} **MUST** be `CUBIC_MILLIMETER/SECOND^2`.

#### Subtypes of DepositionAccelerationVolumetric

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### DepositionDensity

{{def(SampleEnum:DEPOSITION_DENSITY)}}



The {{property(units)}} of {{property(DepositionDensity)}} **MUST** be `MILLIGRAM/CUBIC_MILLIMETER`.

#### Subtypes of DepositionDensity

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### DepositionMass

{{def(SampleEnum:DEPOSITION_MASS)}}



The {{property(units)}} of {{property(DepositionMass)}} **MUST** be `MILLIGRAM`.

#### Subtypes of DepositionMass

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### DepositionRateVolumetric

{{def(SampleEnum:DEPOSITION_RATE_VOLUMETRIC)}}



The {{property(units)}} of {{property(DepositionRateVolumetric)}} **MUST** be `CUBIC_MILLIMETER/SECOND`.

#### Subtypes of DepositionRateVolumetric

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### DepositionVolume

{{def(SampleEnum:DEPOSITION_VOLUME)}}



The {{property(units)}} of {{property(DepositionVolume)}} **MUST** be `CUBIC_MILLIMETER`.

#### Subtypes of DepositionVolume

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### DewPoint

{{def(SampleEnum:DEW_POINT)}}



The {{property(units)}} of {{property(DewPoint)}} **MUST** be `CELSIUS`.

### Diameter

{{def(SampleEnum:DIAMETER)}}



The {{property(units)}} of {{property(Diameter)}} **MUST** be `MILLIMETER`.

### DischargeRate

{{def(SampleEnum:DISCHARGE_RATE)}}



The {{property(units)}} of {{property(DischargeRate)}} **MUST** be `AMPERE`.

The default {{property(subType)}} of {{property(DischargeRate)}} is `ACTUAL`.

#### Subtypes of DischargeRate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `TARGET`

    goal of the operation or process.

    

### Displacement

{{def(SampleEnum:DISPLACEMENT)}}



The {{property(units)}} of {{property(Displacement)}} **MUST** be `MILLIMETER`.

### DisplacementAngular

{{def(SampleEnum:DISPLACEMENT_ANGULAR)}}

> Note: The displacement vector **MAY** be defined by the motion of the owning {{block(Component)}}.



The {{property(units)}} of {{property(DisplacementAngular)}} **MUST** be `DEGREE`.

### DisplacementLinear

{{def(SampleEnum:DISPLACEMENT_LINEAR)}}

> Note: The displacement vector **MAY** be defined by the motion of the owning {{block(Component)}}.



The {{property(units)}} of {{property(DisplacementLinear)}} **MUST** be `MILLIMETER`.

### ElectricalEnergy

{{def(SampleEnum:ELECTRICAL_ENERGY)}}



The {{property(units)}} of {{property(ElectricalEnergy)}} **MUST** be `WATT_SECOND`.

### EquipmentTimer

{{def(SampleEnum:EQUIPMENT_TIMER)}}



The {{property(units)}} of {{property(EquipmentTimer)}} **MUST** be `SECOND`.

A {{property(subType)}} **MUST** always be specified.

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

{{def(SampleEnum:FILL_LEVEL)}}



The {{property(units)}} of {{property(FillLevel)}} **MUST** be `PERCENT`.

### Flow

{{def(SampleEnum:FLOW)}}



The {{property(units)}} of {{property(Flow)}} **MUST** be `LITER/SECOND`.

### FollowingError

{{def(SampleEnum:FOLLOWING_ERROR)}}



The {{property(units)}} of {{property(FollowingError)}} **MUST** be `COUNT`.

#### Subtypes of FollowingError

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

### FollowingErrorAngular

{{def(SampleEnum:FOLLOWING_ERROR_ANGULAR)}}



The {{property(units)}} of {{property(FollowingErrorAngular)}} **MUST** be `DEGREE`.

#### Subtypes of FollowingErrorAngular

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

### FollowingErrorLinear

{{def(SampleEnum:FOLLOWING_ERROR_LINEAR)}}



The {{property(units)}} of {{property(FollowingErrorLinear)}} **MUST** be `MILLIMETER`.

#### Subtypes of FollowingErrorLinear

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

### Frequency

{{def(SampleEnum:FREQUENCY)}}



The {{property(units)}} of {{property(Frequency)}} **MUST** be `HERTZ`.

### `<<deprecated>>`GlobalPosition

{{def(SampleEnum:GLOBAL_POSITION)}}



The {{property(units)}} of {{property(GlobalPosition)}} **MUST** be `MILLIMETER`.

#### Subtypes of GlobalPosition

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### GravitationalAcceleration

{{def(SampleEnum:GRAVITATIONAL_ACCELERATION)}}





The {{property(units)}} of {{property(GravitationalAcceleration)}} **MUST** be `GRAVITATIONAL_ACCELERATION`.

### GravitationalForce

{{def(SampleEnum:GRAVITATIONAL_FORCE)}}

> Note: $$Mass\times GravitationalAcceleration$$



The {{property(units)}} of {{property(GravitationalForce)}} **MUST** be `GRAVITATIONAL_FORCE`.

### HumidityAbsolute

{{def(SampleEnum:HUMIDITY_ABSOLUTE)}}



The {{property(units)}} of {{property(HumidityAbsolute)}} **MUST** be `GRAM/CUBIC_METER`.

#### Subtypes of HumidityAbsolute

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### HumidityRelative

{{def(SampleEnum:HUMIDITY_RELATIVE)}}



The {{property(units)}} of {{property(HumidityRelative)}} **MUST** be `PERCENT`.

#### Subtypes of HumidityRelative

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### HumiditySpecific

{{def(SampleEnum:HUMIDITY_SPECIFIC)}}



The {{property(units)}} of {{property(HumiditySpecific)}} **MUST** be `PERCENT`.

#### Subtypes of HumiditySpecific

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### Length

{{def(SampleEnum:LENGTH)}}



The {{property(units)}} of {{property(Length)}} **MUST** be `MILLIMETER`.

#### Subtypes of Length

* `REMAINING`

    remaining total length of an object.

    

* `STANDARD`

    standard or original length of an object.

    

* `USEABLE`

    remaining usable length of an object.

    

### `<<deprecated>>`Level

{{def(SampleEnum:LEVEL)}}



The {{property(units)}} of {{property(Level)}} **MUST** be `PERCENT`.

### LinearForce

{{def(SampleEnum:LINEAR_FORCE)}}



The {{property(units)}} of {{property(LinearForce)}} **MUST** be `NEWTON`.

### Load

{{def(SampleEnum:LOAD)}}



The {{property(units)}} of {{property(Load)}} **MUST** be `PERCENT`.

### Mass

{{def(SampleEnum:MASS)}}



The {{property(units)}} of {{property(Mass)}} **MUST** be `KILOGRAM`.

### ObservationUpdateRate

{{def(SampleEnum:OBSERVATION_UPDATE_RATE)}}



The {{property(units)}} of {{property(ObservationUpdateRate)}} **MUST** be `COUNT/SECOND`.

### Openness

{{def(SampleEnum:OPENNESS)}}



The {{property(units)}} of {{property(Openness)}} **MUST** be `PERCENT`.

### Orientation

{{def(SampleEnum:ORIENTATION)}}



The {{property(units)}} of {{property(Orientation)}} **MUST** be `DEGREE_3D`.

The value of {{property(Orientation)}} **MUST** be a list of `float` of size `0..3`.

#### Subtypes of Orientation

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

### PH

{{def(SampleEnum:PH)}}



The {{property(units)}} of {{property(PH)}} **MUST** be `PH`.

### PathFeedrate

{{def(SampleEnum:PATH_FEEDRATE)}}



The {{property(units)}} of {{property(PathFeedrate)}} **MUST** be `MILLIMETER/SECOND`.

#### Subtypes of PathFeedrate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `JOG`

    relating to momentary activation of a function or a movement.
    
    **DEPRECATION WARNING**: May be deprecated in the future.

    

* `OVERRIDE`

    operator's overridden value.
    
    **DEPRECATED** in *Version 1.3*.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

* `RAPID`

    performing an operation faster or in less time than nominal rate.

    

### PathFeedratePerRevolution

{{def(SampleEnum:PATH_FEEDRATE_PER_REVOLUTION)}}



The {{property(units)}} of {{property(PathFeedratePerRevolution)}} **MUST** be `MILLIMETER/REVOLUTION`.

#### Subtypes of PathFeedratePerRevolution

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### PathPosition

{{def(SampleEnum:PATH_POSITION)}}



The {{property(units)}} of {{property(PathPosition)}} **MUST** be `MILLIMETER_3D`.

The value of {{property(PathPosition)}} **MUST** be a list of `float` of size `0..3`.

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

{{def(SampleEnum:POSITION)}}



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

    

### PositionCartesian

{{def(SampleEnum:POSITION_CARTESIAN)}}



The {{property(units)}} of {{property(PositionCartesian)}} **MUST** be `MILLIMETER_3D`.

The value of {{property(PositionCartesian)}} **MUST** be a list of `float` of size `0..3`.

### PowerFactor

{{def(SampleEnum:POWER_FACTOR)}}



The {{property(units)}} of {{property(PowerFactor)}} **MUST** be `PERCENT`.

### Pressure

{{def(SampleEnum:PRESSURE)}}



The {{property(units)}} of {{property(Pressure)}} **MUST** be `PASCAL`.

### PressureAbsolute

The force per unit area measured relative to a vacuum.



The {{property(units)}} of {{property(PressureAbsolute)}} **MUST** be `PASCAL`.

### PressurizationRate

{{def(SampleEnum:PRESSURIZATION_RATE)}}



The {{property(units)}} of {{property(PressurizationRate)}} **MUST** be `PASCAL/SECOND`.

#### Subtypes of PressurizationRate

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### ProcessTimer

{{def(SampleEnum:PROCESS_TIMER)}}



The {{property(units)}} of {{property(ProcessTimer)}} **MUST** be `SECOND`.

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of ProcessTimer

* `DELAY`

    elapsed time of a temporary halt of action.

    

* `PROCESS`

    time from the beginning of production of a part or product on a piece of equipment until the time that production is complete for that part or product on
    that piece of equipment.
    
    This includes the time that the piece of equipment is running, producing parts or products, or in the process of producing parts.

    

### Resistance

{{def(SampleEnum:RESISTANCE)}}



The {{property(units)}} of {{property(Resistance)}} **MUST** be `OHM`.

### RotaryVelocity

{{def(SampleEnum:ROTARY_VELOCITY)}}



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

    

### SettlingError

{{def(SampleEnum:SETTLING_ERROR)}}



The {{property(units)}} of {{property(SettlingError)}} **MUST** be `COUNT`.

#### Subtypes of SettlingError

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

### SettlingErrorAngular

{{def(SampleEnum:SETTLING_ERROR_ANGULAR)}}



The {{property(units)}} of {{property(SettlingErrorAngular)}} **MUST** be `DEGREE`.

#### Subtypes of SettlingErrorAngular

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

### SettlingErrorLinear

{{def(SampleEnum:SETTLING_ERROR_LINEAR)}}



The {{property(units)}} of {{property(SettlingErrorLinear)}} **MUST** be `MILLIMETER`.

#### Subtypes of SettlingErrorLinear

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

### SoundLevel

{{def(SampleEnum:SOUND_LEVEL)}}



The {{property(units)}} of {{property(SoundLevel)}} **MUST** be `DECIBEL`.

The default {{property(subType)}} of {{property(SoundLevel)}} is `A_SCALE`.

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

{{def(SampleEnum:SPINDLE_SPEED)}}



The {{property(units)}} of {{property(SpindleSpeed)}} **MUST** be `REVOLUTION/MINUTE`.

#### Subtypes of SpindleSpeed

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
    **DEPRECATED** in *Version 1.3*.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.
    
    **DEPRECATED** in *Version 1.3*.

    

* `OVERRIDE`

    operator's overridden value.
    
    **DEPRECATED** in *Version 1.3*.

    

### Strain

{{def(SampleEnum:STRAIN)}}



The {{property(units)}} of {{property(Strain)}} **MUST** be `PERCENT`.

### Temperature

{{def(SampleEnum:TEMPERATURE)}}



The {{property(units)}} of {{property(Temperature)}} **MUST** be `CELSIUS`.

### Tension

{{def(SampleEnum:TENSION)}}



The {{property(units)}} of {{property(Tension)}} **MUST** be `NEWTON`.

### Tilt

{{def(SampleEnum:TILT)}}



The {{property(units)}} of {{property(Tilt)}} **MUST** be `MICRO_RADIAN`.

### Torque

{{def(SampleEnum:TORQUE)}}



The {{property(units)}} of {{property(Torque)}} **MUST** be `NEWTON_METER`.

### Velocity

{{def(SampleEnum:VELOCITY)}}



The {{property(units)}} of {{property(Velocity)}} **MUST** be `MILLIMETER/SECOND`.

### Viscosity

{{def(SampleEnum:VISCOSITY)}}



The {{property(units)}} of {{property(Viscosity)}} **MUST** be `PASCAL_SECOND`.

### VoltAmpere

{{def(SampleEnum:VOLT_AMPERE)}}



The {{property(units)}} of {{property(VoltAmpere)}} **MUST** be `VOLT_AMPERE`.

### VoltAmpereReactive

{{def(SampleEnum:VOLT_AMPERE_REACTIVE)}}



The {{property(units)}} of {{property(VoltAmpereReactive)}} **MUST** be `VOLT_AMPERE_REACTIVE`.

### `<<deprecated>>`Voltage

{{def(SampleEnum:VOLTAGE)}}



The {{property(units)}} of {{property(Voltage)}} **MUST** be `VOLT`.

#### Subtypes of Voltage

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.
    
    **DEPRECATED** in *Version 1.6*.

    

* `ALTERNATING`

    alternating voltage or current. 
    
    If not specified further in statistic, defaults to RMS voltage. 
    
    **DEPRECATED** in *Version 1.6*.

    

* `DIRECT`

    DC current or voltage.
    
    **DEPRECATED** in *Version 1.6*.

    

* `TARGET`

    goal of the operation or process.
    
    **DEPRECATED** in *Version 1.6*.

    

### VoltageAC

{{def(SampleEnum:VOLTAGE_AC)}}



The {{property(units)}} of {{property(VoltageAC)}} **MUST** be `VOLT`.

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of VoltageAC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### VoltageDC

{{def(SampleEnum:VOLTAGE_DC)}}



The {{property(units)}} of {{property(VoltageDC)}} **MUST** be `VOLT`.

A {{property(subType)}} **MUST** always be specified.

#### Subtypes of VoltageDC

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `COMMANDED`

    directive value including adjustments such as an offset or overrides.

    

* `PROGRAMMED`

    directive value without offsets and adjustments.

    

### VolumeFluid

{{def(SampleEnum:VOLUME_FLUID)}}



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

{{def(SampleEnum:VOLUME_SPATIAL)}}



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

{{def(SampleEnum:WATTAGE)}}



The {{property(units)}} of {{property(Wattage)}} **MUST** be `WATT`.

#### Subtypes of Wattage

* `ACTUAL`

    measured or reported value of an {{term(observation)}}.

    

* `TARGET`

    goal of the operation or process.

    

### XDimension

{{def(SampleEnum:X_DIMENSION)}}



The {{property(units)}} of {{property(XDimension)}} **MUST** be `MILLIMETER`.

### YDimension

{{def(SampleEnum:Y_DIMENSION)}}



The {{property(units)}} of {{property(YDimension)}} **MUST** be `MILLIMETER`.

### ZDimension

{{def(SampleEnum:Z_DIMENSION)}}



The {{property(units)}} of {{property(ZDimension)}} **MUST** be `MILLIMETER`.
