
self.namespace = 'mt'
self.top = :MTConnectStreams
self.license = File.read(File.join(File.dirname(__FILE__), '..', 'schemas', 'license.txt'))
self.version = '1.7'
self.urn = "urn:mtconnect.org:MTConnectStreams:#{self.version}"

load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'common')

package :MTC, 'MTC Top Level Package' do
  attr :Station, 'The station id for this device'
  
  type :Header, 'Message header for protocol information' do
    member :HeaderAttributes, 'Common Attributes'
    
    member :BufferSize, 'The size of the agent\'s buffer.'    
    member :NextSequence, 'The next sequence number for subsequent requests', 1, :Sequence
    member :LastSequence, 'The last sequence number available from the agent', 1, :Sequence
    member :FirstSequence, 'The first sequence number available from the agent', 1, :Sequence
  end
  
  type :MTConnectStreams, 'The root node for MTConnect' do
    member :Header, 'Protocol dependent information'
    member :Streams, 'Streams of data for each piece of equipment'
  end
end

load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'streams')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'samples')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'events')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'data_set')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'table')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'condition')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'alarm')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'interface_stream')


