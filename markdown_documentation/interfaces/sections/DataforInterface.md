
## Data for Interface

Each {{term(interface)}} **MUST** provide the data associated with the specific {{term(interface)}} to implement the {{term(interaction model)}} and any additional data that may be needed by another piece of equipment to understand the operating states and conditions of the first piece of equipment as it applies to the {{term(interface)}}.

Details on data items specific to the {{term(interaction model)}} for each type of {{term(interface)}} are provided in {{sect(DataItem Types for Interface)}}.

An implementer may choose any other data available from a piece of equipment to describe the operating states and other information needed to support an {{term(interface)}}.

#### References for Interface

Some of the data items needed to support a specific {{term(interface)}} may already be defined elsewhere in the {{term(MTConnectDevices Response Document)}} for a piece of equipment.  However, the implementer may not be able to directly associate this data with the {{term(interface)}} since the MTConnect Standard does not permit multiple occurrences of a piece of data to be configured in a {{term(MTConnectDevices Response Document)}}.  {{block(References)}} provides a mechanism for associating information defined elsewhere in the {{term(information model)}} for a piece of equipment with a specific {{term(interface)}}.  

{{block(References)}} {{termplural(organize)}} {{block(Reference)}} elements.

{{block(Reference)}} is a pointer to information that is associated with another entity defined elsewhere for a piece of equipment.

{{block(References)}} is an economical syntax for providing interface specific information without directly duplicating the occurrence of the data. It provides a mechanism to include all necessary information required for interaction and deterministic information flow between pieces of equipment.

For more information on the {{block(References)}} model, see Section 7 of {{citetitle(MTCPart2)}}.
