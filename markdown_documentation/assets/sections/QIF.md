
## QIF

This section provides semantic information for the {{block(QIFDocumentWrapper)}} model.

![QIFDocumentWrapper](figures/QIFDocumentWrapper.png "QIFDocumentWrapper"){: width="0.8"}

> Note: See {{sect(QIFDocumentWrapper Schema Diagrams)}} for XML schema.


### QIFDocument


QIF Document as given by the {{term(QIF)}} standard.


### QIFDocumentWrapper


{{block(Asset)}} that carries the QIF Document.


#### Value Properties of QIFDocumentWrapper

{{tbl(value-properties-of-qifdocumentwrapper)}} lists the Value Properties of {{block(QIFDocumentWrapper)}}.

| Value Property name | Value Property type | Multiplicity |
|---------------------|---------------------|:------------:|
| {{property(qifDocumentType)}} | `QIFDocumentTypeEnum` | 0..1 |
{: caption="Value Properties of QIFDocumentWrapper"}

Descriptions for Value Properties of {{block(QIFDocumentWrapper)}}:

* {{property(qifDocumentType)}} 

    contained QIF Document type as defined in the {{term(QIF)}} Standard.

    The value of {{property(qifDocumentType)}} **MUST** be one of the `QIFDocumentTypeEnum` enumeration.

    `QIFDocumentTypeEnum` Enumeration:


    * `MEASUREMENT_RESOURCE` 

        

    * `PLAN` 

        

    * `PRODUCT` 

        

    * `RESULTS` 

        

    * `RULES` 

        

    * `STATISTICS` 

        

#### Part Properties of QIFDocumentWrapper

{{tbl(part-properties-of-qifdocumentwrapper)}} lists the Part Properties of {{block(QIFDocumentWrapper)}}.

| Part Property name | Multiplicity |
|:-------------------------------------|:-------------:|
| {{block(QIFDocument)}} | 1 |
{: caption="Part Properties of QIFDocumentWrapper"}

Descriptions for Part Properties of {{block(QIFDocumentWrapper)}}:

* {{block(QIFDocument)}} 

    QIF Document as given by the {{term(QIF)}} standard.
    QIF Document as given by the {{term(QIF)}} standard.
