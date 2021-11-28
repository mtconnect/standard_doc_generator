# MTConnect Fundamentals

The MTConnect Standard defines the functionality of an \gls{agent}.  In an MTConnect installation, pieces of equipment publish information to an \gls{agent}.  Client software applications request information from the \gls{agent} using a communications protocol.  Based on the specific information that the client software application has requested from the \gls{agent}, the \gls{agent} forms a \gls{response document} based upon one of the \glspl{semantic data model} defined in the MTConnect Standard and then transmits that document to the client software application.  

![MTConnect Architecture Model](figures/mtconnect-architecture-model.png "mtconnect-architecture-model")

\fig{mtconnect-architecture-model} illustrates the architecture of a typical MTConnect installation. 

> Note: In each implementation of a communication system based on the MTConnect Standard, there \MUST be a schema defined that encodes the rules and terminology defined for each of the \glspl{semantic data model}.  These schemas \MAY be used by client software applications to validate the content and structure of the \glspl{response document} published by an \gls{agent}.

