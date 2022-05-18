
## Sensor

This section provides semantic information for the {{block(SensorConfiguration)}} entity.

{{term(sensor)}} is a unique type of a piece of equipment.  A {{term(sensor)}} is typically comprised of two major components: a {{term(sensor unit)}} that provides signal processing, conversion, and communications and the {{termplural(sensing element)}} that provides a signal or measured value.

The {{term(sensor unit)}} is modeled as a {{term(lower level)}} {{block(Component)}} called {{block(Sensor)}}.  The {{term(sensing element)}} may be modeled as a {{block(Composition)}} element of a {{block(Sensor)}} element and the measured value would be modeled as a {{block(DataItem)}} (See {{sect(DataItems)}} for more information on {{block(DataItem)}} elements).  Each {{term(sensor unit)}} may have multiple {{termplural(sensing element)}}; each representing the data for a variety of measured values.

![Sensing Element provided as a DataItem Example](figures/Sensing%20Element%20provided%20as%20a%20DataItem%20Example.png "Sensing Element provided as a DataItem Example"){: width="0.8"}

> Note: See {{lst(example-of-sensing-element-provided-as-data-item-associated-with-a-component)}} for an {{term(XML)}} example.

When a {{term(sensor unit)}} is modeled as a {{block(Component)}} or as a separate piece of equipment, it may provide additional configuration information for the {{termplural(sensor element)}} and the {{term(sensor unit)}} itself.  

![Sensor for Rotary Axis Example](figures/Sensor%20for%20Rotary%20Axis%20Example.png "Sensor for Rotary Axis Example"){: width="0.8"}

> Note: If a {{block(Sensor)}} provides vibration measurement data for the spindle on a piece of equipment, it could be modeled as a {{block(Sensor)}} for rotary axis named `C`. See {{lst(example-of-sensor-for-rotary-axis)}} for an {{term(XML)}} example.

![Sensor unit with Sensing Elements Example](figures/Sensor%20unit%20with%20Sensing%20Elements%20Example.png "Sensor unit with Sensing Elements Example"){: width="0.8"}

> Note: If a {{block(Sensor)}} provides measurement data for multiple {{block(Component)}} elements within a piece of equipment and is not associated with any particular {{block(Component)}}, it **MAY** be modeled as an independent {{block(Component)}} and the data associated with measurements are associated with their associated {{block(Component)}} entities. See {{lst(example-of-sensor-unit-with-sensing-element)}} for an {{term(XML)}} example.

{{block(Configuration)}} data provides information required for maintenance and support of the sensor.

When {{block(Sensor)}} represents the {{term(sensor unit)}} for multiple {{term(sensing element)}}(s), each sensing element is represented by a {{block(Channel)}}.   The {{term(sensor unit)}} itself and each {{block(Channel)}} representing one {{term(sensing element)}} **MAY** have its own configuration data.

![Sensor Configuration Example](figures/Sensor%20Configuration%20Example.png "Sensor Configuration Example"){: width="0.8"}

> Note: See {{lst(example-of-configuration-data-for-sensor)}} for an {{term(XML)}} example.


### SensorConfiguration

configuration for a {{block(Sensor)}}.


![SensorConfiguration](figures/SensorConfiguration.png "SensorConfiguration"){: width="0.8"}

> Note: See {{figure(SensorConfiguration Schema)}} for XML schema.


#### Value Properties of SensorConfiguration

{{tbl(value-properties-of-sensorconfiguration)}} lists the Value Properties of {{block(SensorConfiguration)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(CalibrationDate)}}|`dateTime`|0..1|
|{{property(CalibrationInitials)}}|`string`|0..1|
|{{property(FirmwareVersion)}}|`string`|1|
|{{property(NextCalibrationDate)}}|`dateTime`|0..1|
{: caption="Value Properties of SensorConfiguration" label="table:value-properties-of-sensorconfiguration"}

Descriptions for Value Properties of {{block(SensorConfiguration)}}:

* {{property(CalibrationDate)}} 

    Date upon which the {{term(sensor unit)}} was last calibrated.

* {{property(CalibrationInitials)}} 

    The initials of the person verifying the validity of the calibration data.

* {{property(FirmwareVersion)}} 

    Version number for the sensor unit as specified by the manufacturer.

* {{property(NextCalibrationDate)}} 

    Date upon which the {{term(sensor unit)}} is next scheduled to be calibrated.

#### Part Properties of SensorConfiguration

{{tbl(part-properties-of-sensorconfiguration)}} lists the Part Properties of {{block(SensorConfiguration)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Channel)}} (organized by `Channels`)|0..*|
{: caption="Part Properties of SensorConfiguration" label="table:part-properties-of-sensorconfiguration"}

Descriptions for Part Properties of {{block(SensorConfiguration)}}:

* {{block(Channel)}} 

    {{term(sensing element)}} of a {{block(Sensor)}}.

    {{block(Channels)}} groups one or more {{block(Channel)}} entities. See {{block(Channel)}}.

### Channel

{{term(sensing element)}} of a {{block(Sensor)}}.


When {{block(Sensor)}} has multiple {{termplural(sensing element)}}, each {{term(sensing element)}} is modeled as a {{block(Channel)}} for the {{block(Sensor)}}. 


#### Value Properties of Channel

{{tbl(value-properties-of-channel)}} lists the Value Properties of {{block(Channel)}}.

|Value Property name|Value Property type|Multiplicity|
|-|-|:-:|
|{{property(CalibrationDate)}}|`dateTime`|0..1|
|{{property(CalibrationInitials)}}|`string`|0..1|
|{{property(name)}}|`string`|0..1|
|{{property(NextCalibrationDate)}}|`dateTime`|0..1|
|{{property(number)}}|`string`|1|
{: caption="Value Properties of Channel" label="table:value-properties-of-channel"}

Descriptions for Value Properties of {{block(Channel)}}:

* {{property(CalibrationDate)}} 

    Date upon which the {{term(sensor unit)}} was last calibrated to the {{term(sensor element)}}.

* {{property(CalibrationInitials)}} 

    The initials of the person verifying the validity of the calibration data.

* {{property(name)}} 

    name of the specific {{term(sensing element)}}.

* {{property(NextCalibrationDate)}} 

    Date upon which the {{term(sensor element)}} is next scheduled to be calibrated with the {{term(sensor unit)}}.

* {{property(number)}} 

    unique identifier that will only refer to a specific {{term(sensing element)}}.

#### Part Properties of Channel

{{tbl(part-properties-of-channel)}} lists the Part Properties of {{block(Channel)}}.

|Part Property name|Multiplicity|
|:-|:-:|
|{{block(Description)}}|0..1|
{: caption="Part Properties of Channel" label="table:part-properties-of-channel"}

Descriptions for Part Properties of {{block(Channel)}}:

* {{block(Description)}} 

    descriptive content.

    See {{sect(Description)}}.
