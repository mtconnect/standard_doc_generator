## Agent

An {{term(agent)}} is the centerpiece of an MTConnect implementation.  It provides two primary functions:

* Organizes and manages individual pieces of information published by one or more pieces of equipment.
* Publishes that information in the form of a {{term(response document)}} to client software applications.

The MTConnect Standard addresses the behavior of an {{term(agent)}} and the structure and meaning of the data published by an {{term(agent)}}.  It is the responsibility of the implementer of an {{term(agent)}} to determine the means by which the behavior is achieved for a specific {{term(agent)}}.

An {{term(agent)}} is software that may be installed as part of a piece of equipment or it may be installed separately.  When installed separately, an {{term(agent)}} may receive information from one or more pieces of equipment.

Some pieces of equipment may be able to communicate directly to an {{term(agent)}}.  Other pieces of equipment may require an {{term(adapter)}} to transform the information provided by the equipment into a form that can be sent to an {{term(agent)}}.  In either case, the method of transmitting information from the piece of equipment to an {{term(agent)}} is implementation dependent and is not addressed as part of the MTConnect Standard.

One function of an {{term(agent)}} is to store information that it receives from a piece of equipment in an organized manner.  A second function of an {{term(agent)}} is to receive {{termplural(request)}} for information from one or many client software applications and then respond to those {{termplural(request)}} by publishing a {{term(response document)}} that contains the requested information.

There are three types of information stored by an {{term(agent)}} that **MAY** be published in a {{term(response document)}}.  These are as follows:

* {{term(equipment metadata)}} defines the {{termplural(structural element)}} that represent the physical and logical parts and sub-parts of each piece of equipment that can publish data to the {{term(agent)}}, the relationships between those parts and sub-parts, and the {{termplural(data entity)}} associated with each of those {{termplural(structural element)}}.  This {{term(equipment metadata)}} is provided in an {{term(mtconnectdevices response document)}}. See {{latex(\citetitle{MTCPart2})}} for more information on {{term(equipment metadata)}}.
* {{term(streaming data)}} provides the values published by pieces of equipment for the {{termplural(data entity)}} defined by the {{term(equipment metadata)}}.  {{term(streaming data)}} is provided in an {{term(mtconnectstreams response document)}}.  See {{latex(\citetitle{MTCPart2})}} for more information on {{term(streaming data)}}.
* {{termplural(mtconnect asset)}} represent information used in a manufacturing operation that is commonly shared amongst multiple pieces of equipment and/or software applications.  {{termplural(mtconnect asset)}} are provided in an {{term(mtconnectassets response document)}}.  See {{latex(\citetitle{MTCPart40})}} for more information on {{termplural(mtconnect asset)}}.

The exchange between an {{term(agent)}} and a client software application is a {{term(request)}} and {{term(response)}} information exchange mechanism.  See {{latex(\sect{Request/Response Information Exchange})}} for details on this {{term(requestresponse)}} information exchange mechanism.

### Instance of an Agent

As described above, an {{term(agent)}} collects and organizes values published by pieces of equipment.  As with any piece of software, an {{term(agent)}} may be periodically restarted.  When an {{term(agent)}} restarts, it **MUST** indicate to client software applications whether the information available in the {{term(buffer)}} represents a completely new set of data or if the {{term(buffer)}} includes data that had been collected prior to the restart of the {{term(agent)}}.

Any time an {{term(agent)}} is restarted and begins to collect a completely new set of {{term(streaming data)}}, that set of data is referred to as an {{term(instance)}} of the {{term(agent)}}.  The {{term(agent)}} **MUST** maintain a piece of information called {{term(instanceid)}} that represents the specific {{term(instance)}} of the {{term(agent)}}.

{{term(instanceid)}} is represented by a 64-bit integer.  The {{term(instanceid)}} **MAY** be implemented using any mechanism that will guarantee that the value for {{term(instanceid)}} will be unique each time the {{term(agent)}} begins collecting a new set of data.

When an {{term(agent)}} is restarted and it provides a method to recover all, or some portion, of the data that was stored in the {{term(buffer)}} before it stopped operating, the {{term(agent)}} **MUST** use the same {{term(instanceid)}} that was defined prior to the restart. 

### Storage of Equipment Metadata for a Piece of Equipment

An {{term(agent)}} **MUST** be capable of publishing {{term(equipment metadata)}} for each piece of equipment that publishes information through the {{term(agent)}}.  {{term(equipment metadata)}} is typically a static file defining the {{termplural(structural element)}} associated with each piece of equipment reporting information through the {{term(agent)}} and the {{termplural(data entity)}} that can be associated with each of these {{termplural(structural element)}}.  See details on {{termplural(structural element)}} and {{termplural(data entity)}} in {{latex(\citetitle{MTCPart2})}}.

The MTConnect Standard does not define the mechanism to be used by an {{term(agent)}} to acquire, maintain, or store the {{term(equipment metadata)}}.  This mechanism **MUST** be defined as part of the implementation of a specific {{term(agent)}}.

### Storage of Streaming Data

{{term(streaming data)}} that is published from a piece(s) of equipment to an {{term(agent)}} is stored by the {{term(agent)}} based upon the sequence upon which each piece of data is received.  As described below, the order in which data is stored by the {{term(agent)}} is one of the factors that determines the data that may be included in a specific {{term(mtconnectstreams response document)}}. 

#### Management of Streaming Data Storage

An {{term(agent)}} stores a fixed amount of data.  The amount of data stored by an {{term(agent)}} is dependent upon the implementation of a specific {{term(agent)}}.  The examples below demonstrate how discrete pieces of data received from pieces of equipment are stored.

The method for storing {{term(streaming data)}} in an {{term(agent)}} can be thought of as a tube that can hold a finite set of balls.  Each ball represents the occurrence of a {{term(data entity)}} published by a piece of equipment.  This data is pushed in one end of the tube until there is no more room for additional balls.  At that point, any new data inserted will push the oldest data out the back of the tube.  The data in the tube will continue to shift in this manner as new data is received.

This tube is referred to as a {{term(buffer)}} in an {{term(agent)}}.

![Data Storage in Buffer](figures/data-storage-in-buffer.png "data-storage-in-buffer")

In {{figure(first-in-first-out-buffer-management)}}, the maximum number of {{termplural(data entity)}} that can be stored in the {{term(buffer)}} of the {{term(agent)}} is 8.  The maximum number of {{termplural(data entity)}} that can be stored in the {{term(buffer)}} is represented by a value called {{term(buffersize)}}.  This example illustrates that when the {{term(buffer)}} fills up, the oldest piece of data falls out the other end.

![First In First Out Buffer Management](figures/first-in-first-out-buffer-management.png "first-in-first-out-buffer-management")

This process constrains the memory storage requirements for an {{term(agent)}} to a fixed maximum size since the MTConnect Standard only requires an {{term(agent)}} to store a finite number of pieces of data.

As an implementation guideline, the {{term(buffer)}} {{latex(\SHOULD)}} be sized large enough to provide storage for a reasonable amount of information received from all pieces of equipment that are publishing information to that {{term(agent)}}.  The implementer should also consider the impact of a temporary loss of communications between a client software application and an {{term(agent)}} when determining the size for the {{term(buffer)}}.  A larger {{term(buffer)}} will allow a client software application more time to reconnect to an {{term(agent)}} without losing data.

#### Sequence Numbers{{latex(\mbox)}}{}

In an {{term(agent)}}, each occurrence of a {{term(data entity)}} in the {{term(buffer)}} will be assigned a monotonically increasing {{term(sequence number)}} as it is inserted into the {{term(buffer)}}.  The {{term(sequence number)}} is a 64-bit integer and the values assigned as {{termplural(sequence number)}} will never wrap around or be exhausted; at least within the next 100,000 years based on the size of a 64-bit number.

{{term(sequence number)}} is the primary key identifier used to manage and locate a specific piece of data in an {{term(agent)}}.  The {{term(sequence number)}} associated with each {{term(data entity)}} reported by an {{term(agent)}} is identified with an attribute called {{term(sequence)}}.

The {{term(sequence number)}} for each piece of data **MUST** be unique for an instance of an {{term(agent)}} (see {{latex(\sect{Instance of an Agent})}} for information on {{termplural(instance)}} of an {{term(agent)}}).  If data is received from more than one piece of equipment, the {{termplural(sequence number)}} are based on the order in which the data is received regardless of which piece of equipment produced that data.  The {{term(sequence number)}} **MUST** be a monotonically increasing number that spans all pieces of equipment publishing data to an {{term(agent)}}.  This allows for multiple pieces of equipment to publish data through a single {{term(agent)}} with no {{term(sequence number)}} collisions and unnecessary protocol complexity.

The {{term(sequence number)}} **MUST** be reset to one (1) each time an {{term(agent)}} is restarted and begins to collect a fresh set of data; i.e., each time {{term(instanceid)}} is changed.

{{figure(instanceid-and-sequence)}} demonstrates the relationship between {{term(instanceid)}} and sequence when an {{term(agent)}} stops and restarts and begins collecting a new set of data.  In this case, the {{term(instanceid)}} is changed to a new value and value for {{term(sequence)}} resets to one (1):

![instanceId and sequence](figures/instanceid-and-sequence.png "instanceid-and-sequence")

{{figure(identifying-the-range-of-data-with-firstsequence-and-lastsequence)}} also shows two additional pieces of information defined for an {{term(agent)}}:

* {{term(firstsequence)}} -- the oldest piece of data contained in the {{term(buffer)}}; i.e., the next piece of data to be moved out of the {{term(buffer)}}
* {{term(lastsequence)}} -- the newest data added to the {{term(buffer)}}

{{term(firstsequence)}} and {{term(lastsequence)}} provide guidance to a software application identifying the range of data avail
able that may be requested from an {{term(agent)}}. 

![Indentifying the range of data with firstSequence and lastSequence](figures/identifying-the-range-of-data-with-firstsequence-and-lastsequence.png "identifying-the-range-of-data-with-firstsequence-and-lastsequence")

When a client software application requests data from an {{term(agent)}}, it can specify both the {{term(sequence number)}} of the first piece of data ({{term(from query)}}) that **MUST** be included in the {{term(response document)}} and the total number ({{term(count model)}}) of pieces of data that {{latex(\SHOULD)}} be included in that document.

In {{figure(identifying-the-range-of-data-with-from-and-count)}}, the request specifies that the data to be returned starts at {{term(sequence number)}} 15 ({{term(from query)}}) and includes a total of three items ({{term(count model)}}).  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/identifying-the-range-of-data-with-from-and-count.png}
  {{latex(\caption{Identifying the range of data with from and count})}}
   {#fig:identifying-the-range-of-data-with-from-and-count}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}


Once a {{term(response)}} to a {{term(request)}} has been completed, the value of {{term(nextsequence)}} will be established.  {{term(nextsequence)}} is the {{term(sequence number)}} of the next piece of data available in the {{term(buffer)}}.  In the example in {{figure(identifying-the-range-of-data-with-from-and-count)}}, the next {{term(sequence number)}} ({{term(nextsequence)}}) will be 18.

As shown in {{figure(identifying-the-range-of-data-with-nextsequence-and-lastsequence)}}, the combination of {{term(from query)}} and {{term(count model)}} defined by the {{term(request)}} indicates a {{term(sequence number)}} for data that is beyond that which is currently in the {{term(buffer)}}.  In this case, {{term(nextsequence)}} is set to a value of {{term(lastsequence)}} + 1.  

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/identifying-the-range-of-data-with-nextsequence-and-lastsequence.png}
  {{latex(\caption{Indentifying the range of data with nextSequence and lastSequence})}}
   {#fig:identifying-the-range-of-data-with-nextsequence-and-lastsequence}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

#### Buffer Data Structure

The information in the {{term(buffer)}} of an {{term(agent)}} can be thought of as a four-column table of data.  Each column in the table represents:

{{latex(\begin{itemize})}}
* The first column is the {{term(sequence number)}} associated with each {{term(data entity)}} - {{term(sequence)}}.

* The second column is the time that the data was published by a piece of equipment.  This time is defined as the {{term(timestamp)}} associated with that {{term(data entity)}}.  See {{latex(\sect{Time Stamp})}} for details on {{term(timestamp)}}.

* The third column, {{term(dataitemid)}}, refers to the identity of {{termplural(data entity)}} as they will appear in the {{term(mtconnectstreams response document)}}.  See *Section 5* of {{latex(\citetitle{MTCPart3})}} for details on {{term(dataitemid)}} for a {{term(data entity)}} and how that identify relates to the {{term(id)}} attribute of the corresponding {{term(data entity)}} in the {{termplural(device information model)}}.

* The fourth column is the value associated with each {{term(data entity)}}.
{{latex(\end{itemize})}}

{{figure(data-storage-concept)}} is an example demonstrating the concept of how data may be stored in an {{term(agent)}}:

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/data-storage-concept.png}
  {{latex(\caption{Data Storage Concept})}}
   {#fig:data-storage-concept}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}


The storage mechanism for the data, the internal representation of the data, and the implementation of the {{term(agent)}} itself is not part of the MTConnect Standard.  The implementer can choose both the amount of data to be stored in the {{term(agent)}} and the mechanism for how the data is stored.  The only requirement is that an {{term(agent)}} publish the {{termplural(response document)}} in the required format.  

#### Time Stamp

Each piece of equipment that publishes information to an {{term(agent)}} {{latex(\SHOULD)}} provide a time stamp indicating when each piece of information was measured or determined.  If no time stamp is provided, the {{term(agent)}} **MUST** provide a time stamp for the information based upon when that information was received at the {{term(agent)}}.

The {{term(timestamp)}} associated with each piece of information is reported by an {{term(agent)}} as {{term(timestamp)}}.  {{term(timestamp)}} **MUST** be reported in UTC (Coordinated Universal Time) format; e.g., "2010-04-01T21:22:43Z".

{{latex(\begin{note})}}
Note:  Z refers to UTC/GMT time, not local time.

{{latex(\end{note})}}

Client software applications should use the value of {{term(timestamp)}} reported for each piece of information as the means for ordering when pieces of information were generated as opposed to using {{term(sequence)}} for this purpose.

{{latex(\begin{note})}}
Note: It is assumed that {{term(timestamp)}} provides the best available estimate of the time that the value(s) for the published information was measured or determined.

{{latex(\end{note})}}

If two pieces of information are measured or determined at the exact same time, they **MUST** be reported with the same value for {{term(timestamp)}}.  Likewise, all information that is recorded in the {{term(buffer)}} with the same value for {{term(timestamp)}} should be interpreted as having been recorded at the same point in time; even if that data was published by more than one piece of equipment. 

#### Recording Occurrences of Streaming Data

An {{term(agent)}} **MUST** record data in the {{term(buffer)}} each time the value for that specific piece of data changes.  If a piece of equipment publishes multiple occurrences of a piece of data with the same value, the {{term(agent)}} {{latex(\MUSTNOT)}} record multiple occurrence for that {{term(data entity)}}.

{{latex(\begin{note})}}
Note:	There is one exception to this rule.  Some {{termplural(data entity)}} may be defined with a {{term(representation)}} attribute value of {{term(discrete representation)}} (See *Section 7.2.2.12* of {{latex(\citetitle{MTCPart2})}} for details on {{term(representation)}}.)  In this case, each occurrence of the data represents a new and unique piece of information.  The {{term(agent)}} **MUST** then record each occurrence of the {{term(data entity)}} that is published by a piece of equipment.

{{latex(\end{note})}}

The value for each piece of information reported by an {{term(agent)}} must be considered by a client software application to be valid until such a time that another occurrence of that piece of information is published by the {{term(agent)}}.

#### Maintaining Last Value for Data Entities

An {{term(agent)}} **MUST** retain a copy of the last available value associated with each {{term(data entity)}} known to the {{term(agent)}}; even if an occurrence of that {{term(data entity)}} is no longer in the {{term(buffer)}}.  This function allows an {{term(agent)}} to provide a software application a view of the last known value for each {{term(data entity)}} associated with a piece of equipment.

The {{term(agent)}} **MUST** also retain a copy of the last value associated with each {{term(data entity)}} that has flowed out of the {{term(buffer)}}.  This function allows an {{term(agent)}} to provide a software application a view of the last known value for each {{term(data entity)}} associated with a {{term(current request)}} with an {{term(at query)}} parameter in the {{term(query http request)}} portion of its {{term(http request line)}} (See {{latex(\sect{Current Request Implemented Using HTTP})}} for details on {{term(current request)}}).

{{latex(\newpage)}}

#### Unavailability of Data

An {{term(agent)}} **MUST** maintain a list of {{termplural(data entity)}} that **MAY** be published by each piece of equipment providing information to the {{term(agent)}}.   This list of {{termplural(data entity)}} is derived from the {{term(equipment metadata)}} stored in the {{term(agent)}} for each piece of equipment.

Each time an {{term(agent)}} is restarted, the {{term(agent)}} **MUST** place an occurrence of every {{term(data entity)}} in the {{term(buffer)}}.  The value reported for each of these {{termplural(data entity)}} **MUST** be set to {{term(unavailable value)}} and the {{term(timestamp)}} for each **MUST** be set to the time that the last piece of data was collected by the {{term(agent)}} prior to the restart.

If at any time an {{term(agent)}} loses communications with a piece of equipment, or the {{term(agent)}} is unable to determine a valid value for all, or any portion, of the {{termplural(data entity)}} published by a piece of equipment, the {{term(agent)}} **MUST** place an occurrence of each of these {{termplural(data entity)}} in the {{term(buffer)}} with its value set to {{term(unavailable value)}}.  This signifies that the value is currently indeterminate and no assumptions of a valid value for the data is possible.

Since an {{term(agent)}} may receive information from multiple pieces of equipment, it **MUST** consider the validity of the data from each of these pieces of equipment independently.

There is one exception to the rules above.  Any {{term(data entity)}} that is constrained to a constant data value **MUST** be reported with the constant value and the {{term(agent)}} {{latex(\MUSTNOT)}} set the value of that {{term(data entity)}} to {{term(unavailable value)}}.

{{latex(\begin{note})}}
Note:	The schema for the {{termplural(device information model)}} (defined in {{latex(\citetitle{MTCPart2})}}) defines how the value reported for an individual piece of data may be constrained to one or more specific values.

{{latex(\end{note})}}

#### Persistence and Recovery

The implementer of an {{term(agent)}} must decide on a strategy regarding the storage of {{term(streaming data)}} in the {{term(buffer)}} of the {{term(agent)}}.

In the simplest form, an {{term(agent)}} can hold the {{term(buffer)}} information in volatile memory where no data is persisted when the {{term(agent)}} is stopped.  In this case, the {{term(agent)}} **MUST** update the value for {{term(instanceid)}} when the {{term(agent)}} restarts to indicate that the {{term(agent)}} has begun to collect a new set of data.

If the implementation of an {{term(agent)}} provides a method of persisting and restoring all or a portion of the information in the {{term(buffer)}} of the {{term(agent)}} ({{termplural(sequence number)}}, {{termplural(time stamp)}}, identify, and values), the {{term(agent)}} {{latex(\MUSTNOT)}} change the value of the {{term(instanceid)}} when the {{term(agent)}} restarts.  This will indicate to a client software application that it does not need to reset the value for {{term(nextsequence)}} when it requests the next set of data from the {{term(agent)}}.

When an implementer chooses to provide a method to persist the information in an {{term(agent)}}, they may choose to store as much data as is practical in a recoverable storage system.  Such a method may also include the ability to store historical information that has previously been pushed out of the {{term(buffer)}}.

#### Heartbeat

An {{term(agent)}} **MUST** provide a function that indicates to a client application that the HTTP connection is still viable during times when there is no new data available to report in a {{term(response document)}}.  This function is defined as {{term(heartbeat)}}.

{{term(heartbeat)}} represents the amount of time after a {{term(response document)}} has been published until a new {{term(response document)}} **MUST** be published, even when no new data is available.

See {{latex(\sect{Query Portion of the HTTP Request Line for a Sample Request})}} for more details on configuring the {{term(heartbeat)}} function.

#### Data Sets
 {#sec:Data Sets}

See {{latex(\citetitle{MTCPart3})}} *Section Part 3: DataItem with representation of DATA\textunderscore SET* for management of {{termplural(data set)}}.


### Storage of Documents for MTConnect Assets

An {{term(agent)}} also stores information associated with {{termplural(mtconnect asset)}}.

When a piece of equipment publishes a document that represents information associated with an {{term(mtconnect asset)}}, an {{term(agent)}} stores that document in a {{term(buffer)}}.  This {{term(buffer)}} is called the {{termplural(asset buffer)}}.  The document is called an {{term(asset document)}}.

The {{termplural(asset buffer)}} **MUST** be a separate {{term(buffer)}} from the one where the {{term(streaming data)}} is stored.

The {{term(asset document)}} that is published by the piece of equipment **MUST** be organized based upon one of the applicable {{termplural(asset information model)}} defined in one of the Parts 4.x of the MTConnect Standard.

An {{term(agent)}} will only retain a limited number of {{termplural(asset document)}} in the {{termplural(asset buffer)}}.  The {{termplural(asset buffer)}} functions similar to the {{term(buffer)}} for {{term(streaming data)}}; i.e., when the {{termplural(asset buffer)}} is full, the oldest {{term(asset document)}} is pushed from the {{term(buffer)}}.

{{figure(first-in-first-out-asset-buffer-management)}} demonstrates the oldest {{term(asset document)}} being pushed from the {{termplural(asset buffer)}} when a new {{term(asset document)}} is added and the {{termplural(asset buffer)}} is full:

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=1.0{{latex(\textwidth)}}]{figures/first-in-first-out-asset-buffer-management.png}
  {{latex(\caption{First In First Out Asset Buffer Management})}}
   {#fig:first-in-first-out-asset-buffer-management}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

Within an {{term(agent)}}, the management of {{termplural(asset document)}} behave like a key/value storage in a database.  In the case of {{termplural(mtconnect asset)}}, the key is an identifier for an Asset (see details on {{term(assetid)}} in {{latex(\citetitle{MTCPart40})}}) and the value is the {{term(asset document)}} that was published by the piece of equipment. 

{{figure(relationship-between-assetid-and-stored-asset-documents)}} demonstrates the relationship between the key ({{term(assetid)}}) and the stored {{termplural(asset document)}}:

{{latex(\begin{figure})}}[ht]
  {{latex(\centering)}}
  {{latex(\includegraphics)}}[width=0.3{{latex(\textwidth)}}]{figures/relationship-between-assetid-and-stored-asset-documents.png}
  {{latex(\caption{Relationship between assetId and stored Asset documents})}}
   {#fig:relationship-between-assetid-and-stored-asset-documents}
{{latex(\end{figure})}}

{{latex(\FloatBarrier)}}

{{latex(\begin{note})}}
Note:  The key ({{term(assetid)}}) is independent of the order of the {{termplural(asset document)}} stored in the {{termplural(asset buffer)}}.

{{latex(\end{note})}}

When an {{term(agent)}} receives a new {{term(asset document)}} representing an {{term(mtconnect asset)}}, it must determine whether this document represents an {{term(mtconnect asset)}} that is not currently represented in the {{termplural(asset buffer)}} or if the document represents new information for an {{term(mtconnect asset)}} that is already represented in the {{termplural(asset buffer)}}.  When a new {{term(asset document)}} is received, one of the following **MUST** occur:

{{latex(\begin{itemize})}}

* If the {{term(asset document)}} represents an {{term(mtconnect asset)}} that is not currently represented in the {{termplural(asset buffer)}}, the {{term(agent)}} **MUST** add the new document to the front of the {{termplural(asset buffer)}}.  If the {{termplural(asset buffer)}} is full, the oldest {{term(asset document)}} will be removed from the {{termplural(asset buffer)}}.

* If the {{term(asset document)}} represents an {{term(mtconnect asset)}} that is already represented in the {{termplural(asset buffer)}}, the {{term(agent)}} **MUST** remove the existing {{term(asset document)}} representing that {{term(mtconnect asset)}} from the {{termplural(asset buffer)}} and add the new {{term(asset document)}} to the front of the {{termplural(asset buffer)}}.  

{{latex(\end{itemize})}}

The MTConnect Standard does not specify the maximum number of {{termplural(asset document)}} that may be stored in the {{termplural(asset buffer)}}; that limit is determined by the implementation of a specific {{term(agent)}}.  The number of {{termplural(asset document)}} that may be stored in an {{term(agent)}} is defined by the value for {{term(assetbuffersize)}} (See {{latex(\sect{Document Header})}} for more information on {{term(assetbuffersize)}}.).  A value of 4,294,967,296 or $2^{32}$ can be provided for {{term(assetbuffersize)}} to indicate unlimited storage.

There is no requirement for an {{term(agent)}} to provide persistence for the {{termplural(asset document)}} stored in the {{termplural(asset buffer)}}.  If an {{term(agent)}} should fail, all {{termplural(asset document)}} stored in the {{termplural(asset buffer)}} **MAY** be lost.  It is the responsibility of the implementer to determine if {{termplural(asset document)}} stored in an {{term(agent)}} may be restored or if those {{termplural(asset document)}} are retained by some other software application.

Additional details on how an {{term(agent)}} organizes and manages information associated with {{termplural(mtconnect asset)}} are provided in {{latex(\citetitle{MTCPart40})}}. 

