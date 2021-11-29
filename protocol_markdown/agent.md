## Agent

The MTConnect Standard specifies the minimum functionality of the {{term(agent)}}. The functionality is as follows:

* Provides store and forward messaging middleware service.
* Provides key-value information storage and retrieval service.
* Implements the ReST API for the MTConnect Standard.
  * {{term(device)}} metadata.
  * {{termplural(observation)}} collected by the agent.
  * {{termplural(asset)}} colleted by the agent.

There are three types of information stored by an {{term(agent)}} that **MAY** be published in a {{term(response document)}}.  These are as follows:

* {{term(equipment metadata)}} soecified in {{cite(MTCPart2)}}.
* {{term(streaming data)}} provides the {{termplural(observation)}} specified in {{cite(MTCPart2)}} in a {{term(buffer)}}.
* {{termplural(mtconnect asset)}} specified in {{cite(MTCPart40)}}.

### Agent Instance ID

The {{term(agent)}} **MUST** initialize the {{term(sequence number)}} to `1`. When the {{term(agent)}} sets the {{term(observation)}} {{term(sequence number)}} to `1`, the MTConnect Agent **MUST** set the {{term(agent)}} {{term(instanceid)}} to a unique value. 

### Storage of Equipment Metadata

An {{term(agent)}} **MUST** be capable of publishing {{term(equipment metadata)}} for the {{term(agent)}} as specified in {{cite(MTCPart2)}}.

### Storage of Streaming Data

The {{term(agent)}} **MAY** implement a {{term(buffer)}} with a fixed number of {{termplural(observation)}}. If the {{term(buffersize)}} is a fixed, the {{term(agent)}} **MUST** store {{termplural(observation)}} using a first-in-first-out pattern. The {{term(agent)}} will remove the oldest {{term(observation)}} when the {{term(buffer)}} is full and a new {{term(observation)}} arrives.

![Data Storage in Buffer](figures/data-storage-in-buffer.png "data-storage-in-buffer")

In {{figure(first-in-first-out-buffer-management)}}, the maximum number of {{termplural(observation)}} that can be stored in the {{term(buffer)}} of the {{term(agent)}} is 8.  The {{term(buffersize)}} in the header reports the maximum number of {{termplural(observation)}}.  This example illustrates that when the {{term(buffer)}} fills up, the oldest piece of data falls out the other end.

![First In First Out Buffer Management](figures/first-in-first-out-buffer-management.png "first-in-first-out-buffer-management")

> Note: As an implementation suggestion, the {{term(buffer)}} should be sized large enough to provide a continuous stream of {{termplural(observation)}}.  The implementer should also consider the impact of a temporary loss of communications when determining the size for the {{term(buffer)}}.  A larger {{term(buffer)}} will allow more time to reconnect to an {{term(agent)}} without losing data.

#### Sequence Numbers

In an {{term(agent)}}, each occurrence of an {{term(observation)}} in the {{term(buffer)}} will be assigned a monotonically increasing unsigned 64-bit integer ({{term(sequence number)}}) when it arrives. The first {{term(sequence number)}} **MUST** be `1`.

The {{term(sequence number)}} for each {{term(observation)}} **MUST** be unique for an instance of an {{term(agent)}} identified by an {{term(instanceid)}}.

{{figure(instanceid-and-sequence)}} illustrates the changing of the {{term(instanceid)}} when an {{term(agent)}} resets the {{term(sequence number)}} to `1`.

![instanceId and sequence](figures/instanceid-and-sequence.png "instanceid-and-sequence")

{{figure(identifying-the-range-of-data-with-firstsequence-and-lastsequence)}} shows two additional pieces of information defined for an {{term(agent)}}:

* {{term(firstsequence)}} -- the oldest piece of data contained in the {{term(buffer)}}; i.e., the next piece of data to be moved out of the {{term(buffer)}}

* {{term(lastsequence)}} -- the newest data added to the {{term(buffer)}}

{{term(firstsequence)}} and {{term(lastsequence)}} provide the range of values for the ReST API requests.

![Indentifying the range of data with firstSequence and lastSequence](figures/identifying-the-range-of-data-with-firstsequence-and-lastsequence.png "identifying-the-range-of-data-with-firstsequence-and-lastsequence")

The {{term(observation)}} with the {{term(sequence number)}} of the {{term(from query)}}) parameter of the {{term(sample request)}} **MUST** be included in the {{term(response document)}} and the total number ({{term(count model)}}) of {{termplural(observation)}} that **SHOULD** be included in that document.

In {{figure(identifying-the-range-of-data-with-from-and-count)}}, the request specifies the {{termplural(observation)}} start at {{term(sequence number)}} `15` ({{term(from query)}}) and includes a total of three items ({{term(count model)}}).

![Identifying the range of data with from and count](figures/identifying-the-range-of-data-with-from-and-count.png "identifying-the-range-of-data-with-from-and-count")

{{FloatBarrier}}

{{term(nextsequence)}} header property has the {{term(sequence number)}} of the next {{term(observation)}} in the {{term(buffer)}} for a subsequent {{term(sample request)}} having a contiguous set of {{termplural(observation)}}.  In the example in {{figure(identifying-the-range-of-data-with-from-and-count)}}, the next {{term(sequence number)}} ({{term(nextsequence)}}) will be 18.

As shown in {{figure(identifying-the-range-of-data-with-nextsequence-and-lastsequence)}}, the combination of {{term(from query)}} and {{term(count model)}} defined by the {{term(request)}} indicates a {{term(sequence number)}} for data that is beyond that which is currently in the {{term(buffer)}}.  In this case, {{term(nextsequence)}} is set to a value of {{term(lastsequence)}} + 1.

![Indentifying the range of data with nextSequence and lastSequence](figures/identifying-the-range-of-data-with-nextsequence-and-lastsequence.png "identifying-the-range-of-data-with-nextsequence-and-lastsequence")

{{FloatBarrier}}

#### Buffer Data Structure

An {{term(observation)}} has four pieces of information as follows:

1. {{term(sequence number)}} associated with each {{term(observation)}} - {{term(sequence)}}.

2. The {{term(timestamp)}} the {{term(observation)}} was made. .

3. A reference to the {{term(dataitemid)}} from the {{cite(MTCPart2))} information model.

4. The value of the {{term(observation)}}.

{{figure(data-storage-concept)}} is an example demonstrating the concept of how data may be stored in an {{term(agent)}}:

[Data Storage Concept](figures/data-storage-concept.png "data-storage-concept")

{{FloatBarrier}}

#### Timestamp

{{termplural(observation)}} **MUST** have a {{term(timestamp)}} giving the most accurate time that the {{term(observation)}} was observed.

{{term(timestamp)}} **MUST** be reported in UTC (Coordinated Universal Time) timezone in ISO 8601 format: e.g., "2010-04-01T21:22:43Z".

Applications **SHOULD** use the {{term(observation)}}'s {{term(timestamp)}} for ordering as opposed to {{term(sequence number)}}.

If {{termplural(observation)}} are known to have occured at the same time, they **MUST** be reported with the same {{term(timestamp)}}. 

#### Recording Occurrences of Streaming Data

The {{term(agent)}} **MUST** only place {{termplural(observation)}} in the {{term(buffer)}} if the data has changed from the previous {{term(observation)}} for the same {{term(dataitem)}}. The exceptions to this rule are the following conditions:

* The {{term(discrete)}} attribute is `true` for the {{term(dataitem)}}. 
* The {{term(representation)}} is {{term(discrete representation)}}.
* The {{term(representation)}} is {{term(timeseries representation)}}.

In the case of an exception, the {{term(agent)}} **MUST** place every  {{term(observation)}} in the {{term(buffer)}}.

#### Maintaining Last Value for Data Entities

An {{term(agent)}} **MUST** retain the most recent {{term(observation)}} associated with each {{term(dataitem)}}; even if an occurrence of that {{term(observation)}} is no longer in the {{term(buffer)}}. This function supports the {{term(current request)}} functionality.

{{newpage}}

#### Unavailability of Data

The {{term(agent)}} **MUST** initialize every {{term(dataitem)}}, unless it has a constant value (see below), with an {{term(observation)}} having a value of {{term(unavailable value)}}. Aditionally, whenever the data source is unreachable, every {{term(dataitem)}} associated with the data source must have an {{term(observation)}} with a value of {{term(unavailable value)}} and {{term(timestamp)}} when the connection was lost. An {{term(unavailable value)}} indicates the value of the {{term(observation)}} is indeterminate.

Any {{term(observation)}} that is constrained to a constant value, as defined in {{cite(MTCPart2)}}, **MUST** only have the constant value and **MUST NOT** be set to {{term(unavailable value)}}.

#### Persistence and Recovery

The {{term(agent)}} **MAY** have a fixed size {{term(buffer)}} and the {{term(buffer)}} **MAY** be ephemeral.

If the {{term(buffer)}} is recoverable, the {{term(agent)}} **MUST NOT**  change the {{term(instanceid)}} and **MUST NOT** set the {{term(sequence number)}} to `1`.

### Storage of MTConnect Assets

An {{term(agent)}} **MAY** only retain a limited number of {{termplural(asset document)}} in the {{termplural(asset buffer)}}. The {{termplural(asset)}} are stored in first-in-first-out method where the oldest {{term(asset)}} is removed when the {{term(asset buffer)}} is full and a new {{term(asset)}} arrives.

{{figure(first-in-first-out-asset-buffer-management)}} illustrates the oldest {{term(asset document)}} being removed from the {{termplural(asset buffer)}} when a new {{term(asset document)}} is added and the {{termplural(asset buffer)}} is full:

![First In First Out Asset Buffer Management](figures/first-in-first-out-asset-buffer-management.png "first-in-first-out-asset-buffer-management")

{{FloatBarrier}}

{{termplural(asset document)}} are indexed by {{term(assetid)}}.  In the case of {{termplural(mtconnect asset)}}. {{figure(relationship-between-assetid-and-stored-asset-documents)}} demonstrates the relationship between the key ({{term(assetid)}}) and the stored {{termplural(asset document)}}:

![Relationship between assetId and stored Asset documents](figures/relationship-between-assetid-and-stored-asset-documents.png "relationship-between-assetid-and-stored-asset-documents")

{{FloatBarrier}}

> Note:  The key ({{term(assetid)}}) is independent of the order of the {{termplural(asset document)}} stored in the {{termplural(asset buffer)}}.

When the {{term(agent)}} receives a new {{term(asset document)}}, one of the following rules **MUST** apply:

* If the {{term(asset document)}} represents an {{term(mtconnect asset)}} not in the {{termplural(asset buffer)}}, the {{term(agent)}} **MUST** add the new document to the front of the {{termplural(asset buffer)}}.  If the {{termplural(asset buffer)}} is full, the oldest {{term(asset document)}} will be removed from the {{termplural(asset buffer)}}.

* If the {{term(asset document)}} key is already in the {{termplural(asset buffer)}}, the {{term(agent)}} **MUST** replace the existing {{term(asset document)}} move the {{term(asset document)}} to the front of the {{termplural(asset buffer)}}.  

The number of {{termplural(asset document)}} that may be stored in an {{term(agent)}} is defined by the value for {{term(assetbuffersize)}} (See {{sect(Document Header)}} for more information on {{term(assetbuffersize)}}). A {{term(assetbuffersize)}} of 4,294,967,296 or $2^{32}$ **MUST** indicate unlimited storage.

The {{term(asset buffer)}} **MAY** be effemeral and the {{termplural(asset document)}} will be lost if the {{term(agent)}} clears the {{term(asset buffer)}}. They must be recovered from the data source.

{{cite(MTCPart40)}} provides additional information on {{term(asset)}} management. 
