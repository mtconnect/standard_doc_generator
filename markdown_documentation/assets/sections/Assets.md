
## Assets

This section provides semantic information for the {{block(Asset)}} model.

![Asset](figures/Asset.png "Asset"){: width="0.8"}

> Note: See {{sect(Assets Schema Diagrams)}} for XML schema.

MTConnect Standard has two data item types to support change notification when an {{term(Asset)}} is added, updated or removed. {{block(AssetChanged)}} states the {{property(assetId)}} of the {{term(Asset)}} that has been added or updated. {{block(AssetRemoved)}} states the {{property(assetId)}} of the {{term(Asset)}} that has been removed. See {{citetitle(MTCPart3)}} for more details.

### Asset


abstract {{term(Asset)}}. 

It is used in the manufacturing process, but is not permanently associated with a single piece of equipment. It can be removed from the piece of equipment without compromising its function, and can be associated with other pieces of equipment during its lifecycle.


#### Value Properties of Asset

{{tbl(value-properties-of-asset)}} lists the Value Properties of {{block(Asset)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(assetId)}} | `ID` | 1 |
| {{property(deviceUuid)}} | `ID` | 0..1 |
| {{property(removed)}} | `boolean` | 0..1 |
| {{property(timestamp)}} | `dateTime` | 1 |
{: caption="Value Properties of Asset"}

Descriptions for Value Properties of {{block(Asset)}}:

* {{property(assetId)}} 

    unique identifier for an {{block(Asset)}}.

* {{property(deviceUuid)}} 

    associated piece of equipment's {{term(UUID)}} that supplied the {{block(Asset)}}'s data.
    
    It references to the {{property(uuid)}} property of the {{block(Device)}} defined in {{citetitle(MTCPart2)}}.

* {{property(removed)}} 

    indicator that the {{block(Asset)}} has been removed from the piece of equipment.

* {{property(timestamp)}} 

    time the {{block(Asset)}} data was last modified.

#### Reference Properties of Asset

{{tbl(reference-properties-of-asset)}} lists the Reference Properties of {{block(Asset)}}.

| Reference Property name | Multiplicity |
|:-------------------------------------|:-------------:|
| {{block(Description)}} | 0..1 |
{: caption="Reference Properties of Asset"}

Descriptions for Reference Properties of {{block(Asset)}}:

* {{block(Description)}} 

    descriptive content.
    descriptive content. 
    
    This can contain configuration information and manufacturer specific details.
