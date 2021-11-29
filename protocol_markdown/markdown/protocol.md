# Protocol and Messaging

An {{term(agent)}} performs two tasks. It collects data from devices and it publishes MTConnect {{termplural(response document)}} in response to {{termplural(request)}} from client applications. The MTConnect Standard does prescribe data collection. The {{term(agent)}} may be embedded or independent of the piece of equipment.

An {{term(agent)}} **MAY** support multiple interfaces.  The MTConnect Standard requires requires the {{term(agent)}} **MUST** support the {{term(rest)}} API.  ReST state management requires client has responsibility for recovery in case of error or loss of connection.
