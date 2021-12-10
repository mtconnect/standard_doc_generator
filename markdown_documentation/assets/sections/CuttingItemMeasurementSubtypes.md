
## Cutting Item Measurement Subtypes

This section lists the {{block(Measurement)}} subtypes for {{block(CuttingItem)}}.

These {{block(Measurement)}} subtypes for {{block(CuttingItem)}} are specific to an individual {{block(CuttingItem)}} and **MUST NOT** be used for the {{block(Measurement)}} pertaining to an assembly. Figures below will be used to for reference for the {{block(CuttingItem)}} specific {{block(Measurement)}} types.

![Cutting Tool](figures/Cutting%20Tool.png "Cutting Tool"){: width="0.8"}

![Cutting Item](figures/Cutting%20Item.png "Cutting Item"){: width="0.8"}

![Cutting Item Measurement](figures/Cutting%20Item%20Measurement.png "Cutting Item Measurement"){: width="0.8"}

![Cutting Item Drive Angle](figures/Cutting%20Item%20Drive%20Angle.png "Cutting Item Drive Angle"){: width="0.8"}

### FunctionalLength


distance from the gauge plane or from the end of the shank of the cutting tool, if a gauge plane does not exist, to the cutting reference point determined by the main function of the tool. 

This measurement will be with reference to the cutting tool and **MUST NOT** exist without a cutting tool.


    {{property(code)}}: `LFx`.


    {{property(units)}}: `MILLIMETER`.


### CuttingReferencePoint


theoretical sharp point of the cutting tool from which the major functional dimensions are taken.


    {{property(code)}}: `CRP`.


    {{property(units)}}: `MILLIMETER`.


### CuttingEdgeLength


theoretical length of the cutting edge of a cutting item over sharp corners.


    {{property(code)}}: `L`.


    {{property(units)}}: `MILLIMETER`.


### DriveAngle


angle between the driving mechanism locator on a tool item and the main cutting edge.


    {{property(code)}}: `DRVA`.


    {{property(units)}}: `DEGREE`.


### FlangeDiameter


dimension between two parallel tangents on the outside edge of a flange.


    {{property(code)}}: `DF`.


    {{property(units)}}: `MILLIMETER`.


### FunctionalWidth


distance between the cutting reference point and the rear backing surface of a turning tool or the axis of a boring bar.


    {{property(code)}}: `WF`.


    {{property(units)}}: `MILLIMETER`.


### IncribedCircleDiameter


diameter of a circle to which all edges of a equilateral and round regular insert are tangential.


    {{property(code)}}: `IC`.


    {{property(units)}}: `MILLIMETER`.


### PointAngle


angle between the major cutting edge and the same cutting edge rotated by 180 degrees about the tool axis.


    {{property(code)}}: `SIG`.


    {{property(units)}}: `DEGREE`.


### ToolCuttingEdgeAngle


angle between the tool cutting edge plane and the tool feed plane measured in a plane parallel the xy-plane.


    {{property(code)}}: `KAPR`.


    {{property(units)}}: `DEGREE`.


### ToolLeadAngle


angle between the tool cutting edge plane and a plane perpendicular to the tool feed plane measured in a plane parallel the xy-plane.


    {{property(code)}}: `PSIR`.


    {{property(units)}}: `DEGREE`.


### ToolOrientation


angle of the tool with respect to the workpiece for a given process. 

The value is application specific.


    {{property(code)}}: `N/A`.


    {{property(units)}}: `DEGREE`.


### StepDiameterLength


length of a portion of a stepped tool that is related to a corresponding cutting diameter measured from the cutting reference point of that cutting diameter to the point on the next cutting edge at which the diameter starts to change.


    {{property(code)}}: `SDLx`.


    {{property(units)}}: `MILLIMETER`.


### StepIncludedAngle


angle between a major edge on a step of a stepped tool and the same cutting edge rotated 180 degrees about its tool axis.


    {{property(code)}}: `STAx`.


    {{property(units)}}: `DEGREE`.


### WiperEdgeLength


measure of the length of a wiper edge of a cutting item.


    {{property(code)}}: `BS`.


    {{property(units)}}: `MILLIMETER`.


### CuttingDiameter


diameter of a circle on which the defined point Pk located on this cutting tool. 

The normal of the machined peripheral surface points towards the axis of the cutting tool.


    {{property(code)}}: `DCx`.


    {{property(units)}}: `MILLIMETER`.


### CuttingHeight


distance from the basal plane of the tool item to the cutting point.


    {{property(code)}}: `HF`.


    {{property(units)}}: `MILLIMETER`.


### CornerRadius


nominal radius of a rounded corner measured in the X Y-plane.


    {{property(code)}}: `RE`.


    {{property(units)}}: `MILLIMETER`.


### Weight


total weight of the cutting tool in grams. 

The force exerted by the mass of the cutting tool.


    {{property(code)}}: `WT`.


    {{property(units)}}: `GRAM`.


### ChamferFlatLength


flat length of a chamfer.


    {{property(code)}}: `BCH`.


    {{property(units)}}: `MILLIMETER`.


### ChamferWidth


width of the chamfer.


    {{property(code)}}: `CHW`.


    {{property(units)}}: `MILLIMETER`.


### InsertWidth


W1 is used for the insert width when an inscribed circle diameter is not practical.


    {{property(code)}}: `W1`.


    {{property(units)}}: `MILLIMETER`.

