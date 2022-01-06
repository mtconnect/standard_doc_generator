{{appendix()}}
{{section*{Appendices}()}}
{{addcontentsline{toc}{section}{Appendices}()}}
{{renewcommand{\thesubsection}{\Alph{subsection}}()}}

## Bibliography

Engineering Industries Association. EIA Standard - EIA-274-D, Interchangeable Variable, Block Data Format for Positioning, Contouring, and Contouring/Positioning Numerically Controlled Machines. Washington, D.C. 1979.

ISO TC 184/SC4/WG3 N1089. ISO/DIS 10303-238: Industrial automation systems and integration  Product data representation and exchange  Part 238: Application Protocols: Application interpreted model for computerized numerical controllers. Geneva, Switzerland, 2004.

International Organization for Standardization. ISO 14649: Industrial automation systems and integration – Physical device control – Data model for computerized numerical controllers – Part 10: General process data. Geneva, Switzerland, 2004.

International Organization for Standardization. ISO 14649: Industrial automation systems and integration – Physical device control – Data model for computerized numerical controllers – Part 11: Process data for milling. Geneva, Switzerland, 2000.

International Organization for Standardization. ISO 6983/1 – Numerical Control of machines – Program format and definition of address words – Part 1: Data format for positioning, line and contouring control systems. Geneva, Switzerland, 1982.

Electronic Industries Association. ANSI/EIA-494-B-1992, 32 Bit Binary CL (BCL) and 7 Bit ASCII CL (ACL) Exchange Input Format for Numerically Controlled Machines. Washington, D.C. 1992.

National Aerospace Standard. Uniform Cutting Tests - NAS Series: Metal Cutting Equipment Specifications. Washington, D.C. 1969.

International Organization for Standardization. ISO 10303-11: 1994, Industrial automation systems and integration  Product data representation and exchange  Part 11: Description methods: The EXPRESS language reference manual. Geneva, Switzerland, 1994.

International Organization for Standardization. ISO 10303-21: 1996, Industrial automation systems and integration -- Product data representation and exchange -- Part 21: Implementation methods: Clear text encoding of the exchange structure. Geneva, Switzerland, 1996.

H.L. Horton, F.D. Jones, and E. Oberg. Machinery's Handbook. Industrial Press, Inc. New York, 1984.

International Organization for Standardization. ISO 841-2001: Industrial automation systems and integration - Numerical control of machines - Coordinate systems and motion nomenclature. Geneva, Switzerland, 2001.

ASME B5.57: Methods for Performance Evaluation of Computer Numerically Controlled Lathes and Turning Centers, 1998.

ASME/ANSI B5.54: Methods for Performance Evaluation of Computer Numerically Controlled Machining Centers. 2005.

OPC Foundation. OPC Unified Architecture Specification, Part 1: Concepts Version 1.00. July 28, 2006.

IEEE STD 1451.0-2007, Standard for a Smart Transducer Interface for Sensors and Actuators – Common Functions, Communication Protocols, and Transducer Electronic Data Sheet (TEDS) Formats, IEEE Instrumentation and Measurement Society, TC-9, The Institute of Electrical and Electronics Engineers, Inc., New York, N.Y. 10016, SH99684, October 5, 2007.

IEEE STD 1451.4-1994, Standard for a Smart Transducer Interface for Sensors and Actuators – Mixed-Mode Communication Protocols and Transducer Electronic Data Sheet (TEDS) Formats, IEEE Instrumentation and Measurement Society, TC-9, The Institute of Electrical and Electronics Engineers, Inc., New York, N.Y. 10016, SH95225, December 15, 2004. {{newpage()}} 

## XML Schema Diagrams

### Components Schema Diagrams

![Components Schema](figures/Components%20Schema.png "Components Schema"){: width="0.8"}

![Component Description Schema](figures/Component%20Description%20Schema.png "Component Description Schema"){: width="0.8"}

### DataItems Schema Diagrams

![DataItems Schema](figures/DataItems%20Schema.png "DataItems Schema"){: width="0.8"}

![Source Schema](figures/Source%20Schema.png "Source Schema"){: width="0.8"}

![Constraints Schema](figures/Constraints%20Schema.png "Constraints Schema"){: width="0.8"}

![Filter Schema](figures/Filter%20Schema.png "Filter Schema"){: width="0.8"}

![Definition Schema](figures/Definition%20Schema.png "Definition Schema"){: width="0.8"}

### References Schema Diagrams

![References Schema](figures/References%20Schema.png "References Schema"){: width="0.8"}

![ComponentRef Schema](figures/ComponentRef%20Schema.png "ComponentRef Schema"){: width="0.8"}

![DataItemRef Schema](figures/DataItemRef%20Schema.png "DataItemRef Schema"){: width="0.8"}

### Configuration Schema Diagrams

![Configuration Schema](figures/Configuration%20Schema.png "Configuration Schema"){: width="0.8"}

![CoordinateSystem Schema](figures/CoordinateSystem%20Schema.png "CoordinateSystem Schema"){: width="0.8"}

![Motion Schema](figures/Motion%20Schema.png "Motion Schema"){: width="0.8"}

![Relationships Schema](figures/Relationships%20Schema.png "Relationships Schema"){: width="0.8"}

![ComponentRelationship Schema](figures/ComponentRelationship%20Schema.png "ComponentRelationship Schema"){: width="0.8"}

![DeviceRelationship Schema](figures/DeviceRelationship%20Schema.png "DeviceRelationship Schema"){: width="0.8"}

![SensorConfiguration Schema](figures/SensorConfiguration%20Schema.png "SensorConfiguration Schema"){: width="0.8"}

![SolidModel Schema](figures/SolidModel%20Schema.png "SolidModel Schema"){: width="0.8"}

![Specifications Schema](figures/Specifications%20Schema.png "Specifications Schema"){: width="0.8"}

![ProcessSpecification Schema](figures/ProcessSpecification%20Schema.png "ProcessSpecification Schema"){: width="0.8"}

## XML Examples

### Device Entity Hierarchy Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Components>
    <Axes id="a" name="base">
    <Components>
      <Linear id="x" name="X"/>
      <Linear id="y" name="Y"/>
      <Linear id="z" name="Z"/>
      <Rotary id="ar" name="B"/>
      <Linear id="w" name="Z3" nativeName="W"/>
      <Rotary id="c" name="C"/>
    </Components>
    </Axes>
    <Controller id="cont" name="controller">
    <Components>
      <Path id="path1" name="path"/>
    </Components>
    </Controller>
    <Door id="door1" name="door"/>
    <Systems id="systems" name="systems">
    <Components>
      <WorkEnvelope id="we1" name="workenv">
      <Compositions>
        <Composition type="WORKPIECE" id="wp"/>
        <Composition type="TABLE" id="tbl"/>
      </Compositions>
      </WorkEnvelope>
      <Electric id="elec" name="electric"/>
      <Hydraulic id="hydraulic" name="hydraulic"/>
      <Coolant id="coolant" name="coolant"/>
      <Pneumatic id="pneumatic" name="pneumatic"/>
      <Lubrication id="lubrication" name="lubrication"/>
    </Components>
    </Systems>
    <Auxiliaries id="Aux" name="auxiliaries">
    <Components>
      <Environmental id="room" name="environmental"/>
    </Components>
    </Auxiliaries>
    <Resources id="resources" name="resources">
    <Components>
      <Personnel id="personnel" name="personnel"/>
      <Materials id="materials" name="materials">
      <Components>
        <Stock id="procstock" name="stock"/>
      </Components>
      <Materials/>
    </Components> 
    </Resources>
    </Components>
  </Device>
</Devices>
~~~~
{: caption="Device Entity Hierarchy Example"}

### Component Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
  <DataItems>
    <DataItem category="EVENT" id="avail" name="avail" type="AVAILABILITY"/>
    <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
    <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
  </DataItems>
    <Components>
    <Controller id="cont" name="controller">
      <DataItems>
      <DataItem category="EVENT" id="estop" name="estop" type="EMERGENCY_STOP"/>
      <DataItem category="CONDITION" id="logic_cond" type="LOGIC_PROGRAM"/>
      <DataItem category="CONDITION" id="cont_system" type="SYSTEM"/>
      <DataItem category="SAMPLE" id="cut_time" type="ACCUMULATED_TIME" units="SECOND"/>
    </DataItems>
    <Components>
      <Path id="path1" name="path">
        <DataItems>
        <DataItem category="EVENT" id="execution" name="execution" type="EXECUTION"/>
        <DataItem category="SAMPLE" id="cspeed" subType="ACTUAL" type="CUTTING_SPEED" units="MILLIMETER/SECOND"/>
        <DataItem category="CONDITION" id="path_system" type="SYSTEM"/>
        <DataItem category="EVENT" id="cvars" representation="DATA_SET" type="VARIABLE"/>
        <DataItem category="EVENT" id="woffset" representation="TABLE" type="WORK_OFFSET"/>
      </DataItems>
      </Path>
    </Components>
    </Controller>
  </Components>
  </Device>
</Devices>
~~~~
{: caption="Component Example"}

### Component with Compositions Example

In {{term(XML)}}, `Composition` types are represented differently than `Component` types. For `Component` types, the element name is Pascal Case of the `Component` type name. Whereas, the element name for all `Composition`types is `Composition` and the type is defined by the `type` attribute of the element (see example below).

~~~~xml
<WorkEnvelope id="we1" name="workenv">
  <DataItems>
    <DataItem category="CONDITION" id="hardware1" name="hardware1" type="HARDWARE"/>
  </DataItems>
  <Compositions>
  <Composition type="WORKPIECE" id="wp"/>
  <Composition type="TABLE" id="tbl"/>
  </Compositions>
</WorkEnvelope>
~~~~
{: caption="Component with Compositions Example"}

### CoordinateSystem Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
    <DataItems>
      <DataItem id="avail" type="AVAILABILITY" category="EVENT"/>
      <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
      <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
    </DataItems>
    <Configuration>
      <CoordinateSystems>
        <CoordinateSystem id="base" type="BASE">
          <Origin>0 0 0</Origin>
        </CoordinateSystem>
        <CoordinateSystem id="machcoord" type="MACHINE" parentIdRef="base">
          <Transformation>
            <Translation>210 275 1430</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
        <CoordinateSystem id="workcoord" type="OBJECT" parentIdRef="machcoord">
          <Transformation>
            <Translation>0 0 0</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
      </CoordinateSystems>
    </Configuration>
  </Device>
</Devices>
~~~~
{: caption="CoordinateSystem Example"}

### Motion Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
    <DataItems>
      <DataItem id="avail" type="AVAILABILITY" category="EVENT"/>
      <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
      <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
    </DataItems>
    <Configuration>
      <CoordinateSystems>
        <CoordinateSystem id="base" type="BASE">
          <Origin>0 0 0</Origin>
        </CoordinateSystem>
        <CoordinateSystem id="machcoord" type="MACHINE" parentIdRef="base">
          <Transformation>
            <Translation>210 275 1430</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
        <CoordinateSystem id="workcoord" type="OBJECT" parentIdRef="machcoord">
          <Transformation>
            <Translation>0 0 0</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
      </CoordinateSystems>
    </Configuration>
    <Components>
      <Axes id="a" name="base">
        <Components>
          <Linear id="x" name="X">
            <Configuration>
              <Motion id="xmotion" coordinateSystemIdRef="machcoord" type="PRISMATIC" actuation="DIRECT">
                <Transformation>
                  <Translaton>300 915 590</Translaton>
                  <Rotation>0 0 0</Rotation>
                </Transformation>
                <Axis>1.0 0 0</Axis>
              </Motion>
            </Configuration>
          </Linear>
          <DataItems>
            <DataItem id="xtravel" type="SYSTEM" category="CONDITION">
          </DataItems>
        </Components>
      </Axes>
    </Components>
  </Device>
</Devices>
~~~~
{: caption="Motion Example"}

### Relationship Example

~~~~xml
<Components>
  <Axes id="a" name="base">
    <Components>
      <Linear id="x" name="X">
        <Configuration>        
          <Relationships>
            <ComponentRelationship id="xpar" type="PARENT" idRef="we1"/>
          </Relationships>
        </Configuration>
      </Linear>
      <DataItems>
        <DataItem id="xtravel" type="SYSTEM" category="CONDITION">
      </DataItems>
    </Components>
  </Axes>
  <Systems id="systems" name="systems">
    <Components>
      <WorkEnvelope id="we1" name="workenv">
        <Compositions>
          <Composition type="WORKPIECE" id="wp"/>
          <Composition type="TABLE" id="tbl"/>
        </Compositions>
        <DataItems>
          <DataItem id="we1cond" type="SYSTEM" category="CONDITION">
        </DataItems>
      </WorkEnvelope>
    </Components>
  </Systems>
</Components>
~~~~
{: caption="Relationship Example"}
      
### SolidModel Example

~~~~xml
<Devices>
  <Device id="d1" name="M12346" uuid="M80104K162N">
    <Description manufacturer="Example_Corporation" 
      serialNumber="272237"> Mill w/SMooth-G
    </Description>
    <DataItems>
      <DataItem id="avail" type="AVAILABILITY" category="EVENT"/>
      <DataItem category="EVENT" id="d1_asset_chg" name="asset_chg" type="ASSET_CHANGED"/>
      <DataItem category="EVENT" id="d1_asset_rem" name="asset_rem" type="ASSET_REMOVED"/>
    </DataItems>
    <Configuration>
      <CoordinateSystems>
        <CoordinateSystem id="base" type="BASE">
          <Origin>0 0 0</Origin>
        </CoordinateSystem>
        <CoordinateSystem id="machcoord" type="MACHINE" parentIdRef="base">
          <Transformation>
            <Translation>210 275 1430</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
        <CoordinateSystem id="workcoord" type="OBJECT" parentIdRef="machcoord">
          <Transformation>
            <Translation>0 0 0</Translation>
            <Rotation>0 0 0</Rotation>
          </Transformation>
        </CoordinateSystem>
      </CoordinateSystems>
    </Configuration>
    <Components>
      <Structures id="struct">
        <Configuration>
          <SolidModel id="model" mediaType="OBJ" href="/objs/mazak.obj" coordinateSystemIdRef="base">
            <Transformation>
              <Translation>0 860 0</Translation>
              <Rotation>-90 0 0</Rotation>
            </Transformation>
            <Scale>0.001 0.001 0.001</Scale>
          </SolidModel>
        </Configuration>
        <Components>
          <Structure id="xaxis" name="X_AXIS">
            <Configuration>
              <SolidModel id="x_model" mediaType="OBJ" itemRef="xaxis" solidModelIdRef="model" coordinateSystemIdRef="base"/>
            </Configuration>
            <DataItems>
              <DataItem type="SYSTEM" category="CONDITION" id="struct_cond"/>
            </DataItems>
          </Structure>
        </Components>
      </Structures>
    </Components>
  </Device>
</Devices>
~~~~
{: caption="SolidModel Example"}

### Specification Example

~~~~xml
<Components>
  <Axes id="a" name="base">
    <Components>
      <Linear id="x" name="X">
        <Configuration>
          <Specifications>
            <Specification id="spec001" type="LENGTH" units="MILLIMETER">
              <Nominal>650</Nominal>
            </Specification>
            <Specification id="spec002" type="LINEAR_FORCE" units="NEWTON">
              <Maximum>5200</Maximum>
              <Minimum>0</Minimum>
            </Specification>
          </Specifications>
        </Configuration>
        <DataItems>
          <DataItem id="xtravel" type="SYSTEM" category="CONDITION">
        </DataItems>
      </Linear>
    </Components>
  </Axes>
</Components>
~~~~
{: caption="Specification Example"}

### Example of sensing element provided as data item associated with a Component

~~~~xml
<Components>
  <Axes id="a" name="base"
    <Components>
      <Rotary id="c" name="C">
        <DataItems>
          <DataItem type="TEMPERATURE" id="servotemp4"
            category="SAMPLE" nativeUnits="CELSIUS"
            compositionId="Bmotor" units="CELSIUS"/>
          </DataItems>
      </Rotary>
    </Components>
  </Axes>
</Components>
~~~~
{: caption="Example of sensing element provided as data item associated with a Component"}

### Example of Sensor for rotary axis

~~~~xml
<Components>
  <Axes id="a" name="base"
    <Components>
      <Rotary id="ar" name="B">
        <Components>
          <Sensor id="spdlm" name="Spindlemonitor">
            <DataItems>
              <DataItem type="DISPLACEMENT" id="cvib"
                category="SAMPLE" name="Svib" 
                units="MILLIMETER"/>
            </DataItems>
          </Sensor >
        <Components>
      </Rotary>
    </Components>
  </Axes>
</Components>
~~~~
{: caption="Example of Sensor for rotary axis"}

### Example of sensor unit with sensing element

~~~~xml
<Axes id="a" name="base"
  <Components>
  <Sensor id="sens1" name="Sensorunit">
    <DataItems>
    <DataItem type="TEMPERATURE" id="sentemp"
      category="SAMPLE" name="Sensortemp" 
      units="CELSIUS"/> 
    </DataItems>
  </Sensor >
  <Linear id="x" name="X">
    <DataItems>
    <DataItem type="DISPLACEMENT" id="xvib"
      category="SAMPLE" name="xvib" 
      units="MILLIMETER">
      <Source componentId="sens1"/>
    </DataItem>
    </DataItems>
  </Rotary>
  <Linear id="y" name="Y">
    <DataItems>
    <DataItem type="DISPLACEMENT" id="yvib" 
      category="SAMPLE" name="yvib" 
      units="MILLIMETER">
      <Source componentId="sens1"/>
    </DataItem>
    </DataItems>
  </Linear>
  <Components>
</Axes>
~~~~
{: caption="Example of sensor unit with sensing element"}

### Example of configuration data for Sensor

~~~~xml
<Sensor id="sensor" name="sensor">
  <Configuration>
    <SensorConfiguration>
      <FirmwareVersion>2.02</FirmwareVersion>
      <CalibrationDate>2010-05-16</CalibrationDate>
      <NextCalibrationDate>2010-05-16</NextCalibrationDate>
      <CalibrationInitials>WS</CalibrationInitials>
      <Channels>
        <Channel number="1" name="A/D:1">
          <Description>A/D With Thermister</Description>
        </Channel>
      </Channels>
    </SensorConfiguration>
  </Configuration>
  <DataItems>
    <DataItem category="CONDITION" id="sensorc" 
      name="sensorc" type="SYSTEM" />
    <DataItem category="SAMPLE" id="senv" name="sensorc"
      type="VOLTAGE_DC" units="VOLT" subType="ACTUAL" />
  </DataItems>
</Sensor>
~~~~
{: caption="Example of configuration data for Sensor"}  