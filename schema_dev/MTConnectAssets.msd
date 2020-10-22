
self.urn = 'urn:mtconnect.org:MTConnectAssets:1.6'
self.namespace = 'mt'
self.top = :MTConnectAssets
self.license = File.read('../schema_dev/license.txt')
self.version = '1.6'

xsimport "xlink", 'http://www.w3.org/1999/xlink', 'xlink.xsd'


load '../schema_dev/common'

package :MTC, 'MTC Top Level Package' do  
  type :Header, 'Message header for protocol information' do
    member :Version, 'The document version'
    member :CreationTime, 'The date and time the document was created'
    member :TestIndicator, 'Indicates that this was a test document', 0..1
    member :InstanceId, 'The unique instance identifier of this agent process'
    member :Sender, 'The sender of the message'
    member :AssetBufferSize, 'The maximum number of assets'
    member :AssetCount, 'The number of assets we have', :AssetCountAttr
  end

  type :MTConnectAssets, 'The root node for MTConnect' do
    member :Header, 'Protocol dependent information'
    member :Assets, 'The assets'
  end
end

load '../schema_dev/assets.msd'
load '../schema_dev/data_items.msd'
load '../schema_dev/streams.msd'
load '../schema_dev/events.msd'
load '../schema_dev/samples.msd'
load '../schema_dev/condition.msd'
load '../schema_dev/tools.msd'

# Deferred to 1.6
#load 'process.msd'
#load 'parts.msd'
#load 'inspection.msd'
#load 'files.msd'
