
self.namespace = 'mt'
self.top = :MTConnectError
self.license = File.read(File.join(File.dirname(__FILE__), 'schemas', 'license.txt'))
self.version = $mtconnect_version
self.urn = "urn:mtconnect.org:MTConnectError:#{self.version}"

load File.join(File.dirname(__FILE__), 'schemas', 'msd', 'common')

package :MTConnectError, 'MTConnect Top Level Error Package' do
  type :Header, 'Message header for protocol information' do
    member :Version, 'The document version'
    member :CreationTime, 'The date and time the document was created'
    member :TestIndicator, 'Indicates that this was a test document', 0..1
    member :InstanceId, 'The unique instance identifier of this agent process'
    member :Sender, 'The sender of the message'
    member :BufferSize, 'The size of the agent\'s buffer.'
  end
  
  type :MTConnectError, 'The root node for MTConnect' do
    member :Header, 'Protocol dependent information'
    choice do 
      member :Error, 'Only for backward compatibility with 1.0'
      member :Errors, 'A collection of errors'
    end
  end
  
  type :Errors, 'A collection of errors' do 
    member :Error, 'An error result', 1..INF    
  end
end

load File.join(File.dirname(__FILE__), 'schemas', 'msd', 'error')


