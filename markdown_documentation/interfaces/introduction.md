# Purpose of This Document

This document, {{package(Interface Interaction Model)}} of the MTConnect Standard, defines a structured data model used to organize information required to coordinate inter-operations between pieces of equipment.  

This data model is based on an {{term(interaction model)}} that defines the exchange of information between pieces of equipment and is organized in the MTConnect Standard by {{block(Interfaces)}}.   

{{block(Interfaces)}} is modeled as an extension to the {{term(Device Information Model)}} and {{term(Observation Information Model)}}.  {{block(Interfaces)}} leverages similar rules and terminology as those used to describe a component in the {{term(Device Information Model)}}.  {{block(Interfaces)}} also uses similar methods for reporting data to those used in the {{term(MTConnectStreams Response Document)}}.  

As defined in {{package(Device Information Model)}}, {{block(Interfaces)}} {{termplural(organize)}} the {{block(Interface)}} types (see {{figure(Interfaces in Entity Hierarchy)}}).  Each individual {{block(Interface)}} contains data associated with the corresponding {{term(interface)}}.

> Note: See {{package(Device Information Model)}} and {{package(Observation Information Model)}} of the MTConnect Standard for information on how {{block(Interfaces)}} is structured in the {{termplural(response document)}} which are returned from an {{term(agent)}} in response to a {{term(probe request)}}, {{term(sample request)}}, or {{term(current request)}}.

# Terminology and Conventions

Refer to {{package(Fundamentals)}} for a dictionary of terms, reserved language, and document conventions used in the MTConnect Standard.

{{printglossary[title=General Terms, type=general]()}}
{{printglossary[title=Information Model Terms, type=informationmodel]()}}
{{printglossary[title=Protocol Terms, type=protocol]()}}
{{printglossary[title=HTTP Terms, type=http]()}}
{{printglossary[title=XML Terms, type=xml]()}}
{{printglossary[title=MTConnect Terms, type=conceptmodel]()}}

{{printacronyms()}}

{{printbibliography[title=MTConnect References,keyword=MTC]()}}

{{printbibliography[title=Other References,notkeyword=MTC]()}}

{{glsaddall()}}