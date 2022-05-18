
## Cutting Tool Measurement Subtypes

This section lists the {{block(Measurement)}} subtypes for {{block(CuttingTool)}}.

These {{block(Measurement)}} subtypes for {{block(CuttingTool)}} are specific to the entire assembly and **MUST NOT** be used for the {{block(Measurement)}} pertaining to a {{block(CuttingItem)}}. {{figure(Cutting Tool Measurement 1)}} and {{figure(Cutting Tool Measurement 2)}} will be used to reference the assembly specific {{block(Measurement)}} subtypes.

![Cutting Tool Measurement 1](figures/Cutting%20Tool%20Measurement%201.png "Cutting Tool Measurement 1"){: width="0.8"}

![Cutting Tool Measurement 2](figures/Cutting%20Tool%20Measurement%202.png "Cutting Tool Measurement 2"){: width="0.8"}


### BodyDiameterMax

largest diameter of the body of a tool item.



The {{property(code)}} of {{property(BodyDiameterMax)}} **MUST** be `BDX`.

The {{property(units)}} of {{property(BodyDiameterMax)}} **MUST** be `MILLIMETER`.

### BodyLengthMax

distance measured along the X axis from that point of the item closest to the workpiece, including the cutting item for a tool item but excluding a protruding locking mechanism for an adaptive item, to either the front of the flange on a flanged body or the beginning of the connection interface feature on the machine side for cylindrical or prismatic shanks.



The {{property(code)}} of {{property(BodyLengthMax)}} **MUST** be `LBX`.

The {{property(units)}} of {{property(BodyLengthMax)}} **MUST** be `MILLIMETER`.

### DepthOfCutMax

maximum engagement of the cutting edge or edges with the workpiece measured perpendicular to the feed motion.



The {{property(code)}} of {{property(DepthOfCutMax)}} **MUST** be `APMX`.

The {{property(units)}} of {{property(DepthOfCutMax)}} **MUST** be `MILLIMETER`.

### CuttingDiameterMax

maximum diameter of a circle on which the defined point Pk of each of the master inserts is located on a tool item. 

The normal of the machined peripheral surface points towards the axis of the cutting tool.



The {{property(code)}} of {{property(CuttingDiameterMax)}} **MUST** be `DC`.

The {{property(units)}} of {{property(CuttingDiameterMax)}} **MUST** be `MILLIMETER`.

### FlangeDiameterMax

dimension between two parallel tangents on the outside edge of a flange.



The {{property(code)}} of {{property(FlangeDiameterMax)}} **MUST** be `DF`.

The {{property(units)}} of {{property(FlangeDiameterMax)}} **MUST** be `MILLIMETER`.

### OverallToolLength

largest length dimension of the cutting tool including the master insert where applicable.



The {{property(code)}} of {{property(OverallToolLength)}} **MUST** be `OAL`.

The {{property(units)}} of {{property(OverallToolLength)}} **MUST** be `MILLIMETER`.

### ShankDiameter

dimension of the diameter of a cylindrical portion of a tool item or an adaptive item that can participate in a connection.



The {{property(code)}} of {{property(ShankDiameter)}} **MUST** be `DMM`.

The {{property(units)}} of {{property(ShankDiameter)}} **MUST** be `MILLIMETER`.

### ShankHeight

dimension of the height of the shank.



The {{property(code)}} of {{property(ShankHeight)}} **MUST** be `H`.

The {{property(units)}} of {{property(ShankHeight)}} **MUST** be `MILLIMETER`.

### ShankLength

dimension of the length of the shank.



The {{property(code)}} of {{property(ShankLength)}} **MUST** be `LS`.

The {{property(units)}} of {{property(ShankLength)}} **MUST** be `MILLIMETER`.

### UsableLengthMax

maximum length of a cutting tool that can be used in a particular cutting operation including the non-cutting portions of the tool.



The {{property(code)}} of {{property(UsableLengthMax)}} **MUST** be `LUX`.

The {{property(units)}} of {{property(UsableLengthMax)}} **MUST** be `MILLIMETER`.

### ProtrudingLength

dimension from the yz-plane to the furthest point of the tool item or adaptive item measured in the -X direction.



The {{property(code)}} of {{property(ProtrudingLength)}} **MUST** be `LPR`.

The {{property(units)}} of {{property(ProtrudingLength)}} **MUST** be `MILLIMETER`.

### FunctionalLength

distance from the gauge plane or from the end of the shank to the furthest point on the tool, if a gauge plane does not exist, to the cutting reference point determined by the main function of the tool.

The {{block(CuttingTool)}} functional length will be the length of the entire tool, not a single cutting item. Each {{block(CuttingItem)}} can have an independent {{block(FunctionalLength)}} represented in its measurements. 



The {{property(code)}} of {{property(FunctionalLength)}} **MUST** be `LF`.

The {{property(units)}} of {{property(FunctionalLength)}} **MUST** be `MILLIMETER`.

### Weight

total weight of the cutting tool in grams. 

The force exerted by the mass of the cutting tool.



The {{property(code)}} of {{property(Weight)}} **MUST** be `WT`.

The {{property(units)}} of {{property(Weight)}} **MUST** be `GRAM`.
