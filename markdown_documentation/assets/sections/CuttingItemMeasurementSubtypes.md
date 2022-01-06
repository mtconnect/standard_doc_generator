
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


The {{property(code)}} of {{property(FunctionalLength)}} **MUST** be `LFx`.

The {{property(units)}} of {{property(FunctionalLength)}} **MUST** be `MILLIMETER`.

### CuttingReferencePoint


theoretical sharp point of the cutting tool from which the major functional dimensions are taken.


The {{property(code)}} of {{property(CuttingReferencePoint)}} **MUST** be `CRP`.

The {{property(units)}} of {{property(CuttingReferencePoint)}} **MUST** be `MILLIMETER`.

### CuttingEdgeLength


theoretical length of the cutting edge of a cutting item over sharp corners.


The {{property(code)}} of {{property(CuttingEdgeLength)}} **MUST** be `L`.

The {{property(units)}} of {{property(CuttingEdgeLength)}} **MUST** be `MILLIMETER`.

### DriveAngle


angle between the driving mechanism locator on a tool item and the main cutting edge.


The {{property(code)}} of {{property(DriveAngle)}} **MUST** be `DRVA`.

The {{property(units)}} of {{property(DriveAngle)}} **MUST** be `DEGREE`.

### FlangeDiameter


dimension between two parallel tangents on the outside edge of a flange.


The {{property(code)}} of {{property(FlangeDiameter)}} **MUST** be `DF`.

The {{property(units)}} of {{property(FlangeDiameter)}} **MUST** be `MILLIMETER`.

### FunctionalWidth


distance between the cutting reference point and the rear backing surface of a turning tool or the axis of a boring bar.


The {{property(code)}} of {{property(FunctionalWidth)}} **MUST** be `WF`.

The {{property(units)}} of {{property(FunctionalWidth)}} **MUST** be `MILLIMETER`.

### IncribedCircleDiameter


diameter of a circle to which all edges of a equilateral and round regular insert are tangential.


The {{property(code)}} of {{property(IncribedCircleDiameter)}} **MUST** be `IC`.

The {{property(units)}} of {{property(IncribedCircleDiameter)}} **MUST** be `MILLIMETER`.

### PointAngle


angle between the major cutting edge and the same cutting edge rotated by 180 degrees about the tool axis.


The {{property(code)}} of {{property(PointAngle)}} **MUST** be `SIG`.

The {{property(units)}} of {{property(PointAngle)}} **MUST** be `DEGREE`.

### ToolCuttingEdgeAngle


angle between the tool cutting edge plane and the tool feed plane measured in a plane parallel the xy-plane.


The {{property(code)}} of {{property(ToolCuttingEdgeAngle)}} **MUST** be `KAPR`.

The {{property(units)}} of {{property(ToolCuttingEdgeAngle)}} **MUST** be `DEGREE`.

### ToolLeadAngle


angle between the tool cutting edge plane and a plane perpendicular to the tool feed plane measured in a plane parallel the xy-plane.


The {{property(code)}} of {{property(ToolLeadAngle)}} **MUST** be `PSIR`.

The {{property(units)}} of {{property(ToolLeadAngle)}} **MUST** be `DEGREE`.

### ToolOrientation


angle of the tool with respect to the workpiece for a given process. 

The value is application specific.


The {{property(code)}} is `N/A` for {{property(ToolOrientation)}}.

The {{property(units)}} of {{property(ToolOrientation)}} **MUST** be `DEGREE`.

### StepDiameterLength


length of a portion of a stepped tool that is related to a corresponding cutting diameter measured from the cutting reference point of that cutting diameter to the point on the next cutting edge at which the diameter starts to change.


The {{property(code)}} of {{property(StepDiameterLength)}} **MUST** be `SDLx`.

The {{property(units)}} of {{property(StepDiameterLength)}} **MUST** be `MILLIMETER`.

### StepIncludedAngle


angle between a major edge on a step of a stepped tool and the same cutting edge rotated 180 degrees about its tool axis.


The {{property(code)}} of {{property(StepIncludedAngle)}} **MUST** be `STAx`.

The {{property(units)}} of {{property(StepIncludedAngle)}} **MUST** be `DEGREE`.

### WiperEdgeLength


measure of the length of a wiper edge of a cutting item.


The {{property(code)}} of {{property(WiperEdgeLength)}} **MUST** be `BS`.

The {{property(units)}} of {{property(WiperEdgeLength)}} **MUST** be `MILLIMETER`.

### CuttingDiameter


diameter of a circle on which the defined point Pk located on this cutting tool. 

The normal of the machined peripheral surface points towards the axis of the cutting tool.


The {{property(code)}} of {{property(CuttingDiameter)}} **MUST** be `DCx`.

The {{property(units)}} of {{property(CuttingDiameter)}} **MUST** be `MILLIMETER`.

### CuttingHeight


distance from the basal plane of the tool item to the cutting point.


The {{property(code)}} of {{property(CuttingHeight)}} **MUST** be `HF`.

The {{property(units)}} of {{property(CuttingHeight)}} **MUST** be `MILLIMETER`.

### CornerRadius


nominal radius of a rounded corner measured in the X Y-plane.


The {{property(code)}} of {{property(CornerRadius)}} **MUST** be `RE`.

The {{property(units)}} of {{property(CornerRadius)}} **MUST** be `MILLIMETER`.

### Weight


total weight of the cutting tool in grams. 

The force exerted by the mass of the cutting tool.


The {{property(code)}} of {{property(Weight)}} **MUST** be `WT`.

The {{property(units)}} of {{property(Weight)}} **MUST** be `GRAM`.

### ChamferFlatLength


flat length of a chamfer.


The {{property(code)}} of {{property(ChamferFlatLength)}} **MUST** be `BCH`.

The {{property(units)}} of {{property(ChamferFlatLength)}} **MUST** be `MILLIMETER`.

### ChamferWidth


width of the chamfer.


The {{property(code)}} of {{property(ChamferWidth)}} **MUST** be `CHW`.

The {{property(units)}} of {{property(ChamferWidth)}} **MUST** be `MILLIMETER`.

### InsertWidth


W1 is used for the insert width when an inscribed circle diameter is not practical.


The {{property(code)}} of {{property(InsertWidth)}} **MUST** be `W1`.

The {{property(units)}} of {{property(InsertWidth)}} **MUST** be `MILLIMETER`.
