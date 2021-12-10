
## Cutting Tool Measurement Subtypes

This section lists the {{block(Measurement)}} subtypes for {{block(CuttingTool)}}.

These {{block(Measurement)}} subtypes for {{block(CuttingTool)}} are specific to the entire assembly and **MUST NOT** be used for the {{block(Measurement)}} pertaining to a {{block(CuttingItem)}}. {{fig(Cutting Tool Measurement 1)}} and {{fig(Cutting Tool Measurement 2)}} will be used to reference the assembly specific {{block(Measurement)}} subtypes.

![Cutting Tool Measurement 1](figures/Cutting%20Tool%20Measurement%201.png "Cutting Tool Measurement 1"){: width="0.8"}

![Cutting Tool Measurement 2](figures/Cutting%20Tool%20Measurement%202.png "Cutting Tool Measurement 2"){: width="0.8"}


### BodyDiameterMax


largest diameter of the body of a tool item.


    {{property(code)}}: `BDX`.


    {{property(units)}}: `MILLIMETER`.


### BodyLengthMax


distance measured along the X axis from that point of the item closest to the workpiece, including the cutting item for a tool item but excluding a protruding locking mechanism for an adaptive item, to either the front of the flange on a flanged body or the beginning of the connection interface feature on the machine side for cylindrical or prismatic shanks.


    {{property(code)}}: `LBX`.


    {{property(units)}}: `MILLIMETER`.


### DepthOfCutMax


maximum engagement of the cutting edge or edges with the workpiece measured perpendicular to the feed motion.


    {{property(code)}}: `APMX`.


    {{property(units)}}: `MILLIMETER`.


### CuttingDiameterMax


maximum diameter of a circle on which the defined point Pk of each of the master inserts is located on a tool item. 

The normal of the machined peripheral surface points towards the axis of the cutting tool.


    {{property(code)}}: `DC`.


    {{property(units)}}: `MILLIMETER`.


### FlangeDiameterMax


dimension between two parallel tangents on the outside edge of a flange.


    {{property(code)}}: `DF`.


    {{property(units)}}: `MILLIMETER`.


### OverallToolLength


largest length dimension of the cutting tool including the master insert where applicable.


    {{property(code)}}: `OAL`.


    {{property(units)}}: `MILLIMETER`.


### ShankDiameter


dimension of the diameter of a cylindrical portion of a tool item or an adaptive item that can participate in a connection.


    {{property(code)}}: `DMM`.


    {{property(units)}}: `MILLIMETER`.


### ShankHeight


dimension of the height of the shank.


    {{property(code)}}: `H`.


    {{property(units)}}: `MILLIMETER`.


### ShankLength


dimension of the length of the shank.


    {{property(code)}}: `LS`.


    {{property(units)}}: `MILLIMETER`.


### UsableLengthMax


maximum length of a cutting tool that can be used in a particular cutting operation including the non-cutting portions of the tool.


    {{property(code)}}: `LUX`.


    {{property(units)}}: `MILLIMETER`.


### ProtrudingLength


dimension from the yz-plane to the furthest point of the tool item or adaptive item measured in the -X direction.


    {{property(code)}}: `LPR`.


    {{property(units)}}: `MILLIMETER`.


### FunctionalLength


distance from the gauge plane or from the end of the shank to the furthest point on the tool, if a gauge plane does not exist, to the cutting reference point determined by the main function of the tool.

The {{block(CuttingTool)}} functional length will be the length of the entire tool, not a single cutting item. Each {{block(CuttingItem)}} can have an independent {{block(FunctionalLength)}} represented in its measurements. 


    {{property(code)}}: `LF`.


    {{property(units)}}: `MILLIMETER`.


### Weight


total weight of the cutting tool in grams. 

The force exerted by the mass of the cutting tool.


    {{property(code)}}: `WT`.


    {{property(units)}}: `GRAM`.

