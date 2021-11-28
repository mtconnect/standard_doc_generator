# Protocol and Messaging

An {{term(agent)}} performs two tasks. It collects data from devices and it publishes MTConnect {{termplural(response document)}} in response to {{termplural(request)}} from client applications.

The MTConnect Standard does not address the method used by an {{term(agent)}} to collect data from a piece of equipment.  The relationship between the {{term(agent)}} and a piece of equipment is implementation dependent.  The {{term(agent)}} may be fully integrated into the piece of equipment or the {{term(agent)}} may be independent of the piece of equipment.  Implementation of the relationship between a piece of equipment and an {{term(agent)}} is the responsibility of the supplier of the piece of equipment and/or the implementer of the {{term(agent)}ls}.

The communications mechanism between an {{term(agent)}} and a client software application requires the following primary components:

* {{term(physical connection)}}:  The network transmission technologies that physically interconnect an {{term(agent)}} and a client software application.  Examples of a {{term(physical connection)}} would be an Ethernet network or a wireless connection.

* Transport Protocol:  A set of capabilities that provide the rules and procedures used to transport information between an {{term(agent)}} and a client software application through a {{term(physical connection)}}.

* {{term(application programming interface)}}:  The {{term(request)}} and {{term(response)}} interactions that occur between an {{term(agent)}} and a client software application.

* {{term(message term)}}:  The content of the information that is exchanged.  The {{term(message term)}} includes both the content of the MTConnect {{term(response document)}} and any additional information required for the client software application to interpret the {{term(response document)}}. \\
    Note: The {{termplural(physical connection)}}, {{termplural(transport protocol)}}, and {{term(application programming interface)}} supported by an {{term(agent)}} are independent of the {{term(message term)}} itself; i.e., the information contained in the MTConnect {{termplural(response document)}} is not changed based on the methods used to transport those documents to a client software application.

An {{term(agent)}} **MAY** support multiple methods for communicating with client software applications.  The MTConnect Standard specifies one methodology for communicating that **MUST** be supported by every {{term(agent)}}.  This methodology is a {{term(rest)}}, which defines a stateless, client-server communications architecture.  This REST interface is the architectural pattern that specifies the exchange of information between an {{term(agent)}} and a client software application.  REST dictates that a server has no responsibility for tracking or coordinating with a client software application regarding which information or how much information the client software application may request from a server.  This removes the burden for a server to keep track of client sessions.  An {{term(agent)}} **MUST** be implemented as a server supporting the RESTful interface. 
