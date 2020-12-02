
self.namespace = 'mt'
self.top = :MTConnectAssets
self.license = File.read(File.join(File.dirname(__FILE__), '..', 'schemas', 'license.txt'))
self.version = '1.7'
self.urn = "urn:mtconnect.org:MTConnectAssets:#{self.version}"

xsimport "xlink", 'http://www.w3.org/1999/xlink', 'xlink.xsd'


load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'common')

package :MTConnectAsset, 'MTC Top Level Package' do  
  type :Header, 'Message header for protocol information' do
    member :HeaderAttributes, 'Common Attributes'

    member :AssetBufferSize, 'The maximum number of assets'
    member :AssetCount, 'The number of assets we have', :AssetCountAttr
  end

  type :MTConnectAssets, 'The root node for MTConnect' do
    member :Header, 'Protocol dependent information'
    member :Assets, 'The assets'
  end
end

load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'assets.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'data_items.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'streams.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'events.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'samples.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'condition.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'tools.msd')
load File.join(File.dirname(__FILE__), '..', 'schemas', 'msd', 'files.msd')

# Deferred to 1.6
#load 'process.msd'
#load 'parts.msd'
#load 'inspection.msd'
