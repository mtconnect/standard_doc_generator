
self.namespace = 'mt'
self.top = :MTConnectDevices
self.license = File.read(File.join(File.dirname(__FILE__), 'schemas', 'license.txt'))
self.version = '2.0'
self.urn = "urn:mtconnect.org:MTConnectDevices:#{self.version}"

xsimport "xlink", 'http://www.w3.org/1999/xlink', 'xlink.xsd'

load File.join(File.dirname(__FILE__), 'schemas', 'msd', 'common')

package :MTC, 'MTC Top Level Package' do
  basic_type(:AssetCountValue, 'The number of assets', :integer) do
    facet 'minIncl=0;maxExcl=4294967295'    
  end
  
  type :Header, 'Message header for protocol information' do
    member :HeaderAttributes, 'Common Attributes'
    
    member :BufferSize, 'The size of the agent\'s buffer.'    
    member :AssetBufferSize, 'The maximum number of assets'
    member :AssetCount, 'The number of assets we have', :AssetCountAttr
  end

  type :MTConnectDevices, 'The root node for MTConnect' do
    member :Header, 'Protocol dependent information'
    member :Devices, 'The equipment'
  end
end

load File.join(File.dirname(__FILE__), 'schemas', 'msd', 'components')
load File.join(File.dirname(__FILE__), 'schemas', 'msd', 'data_items')

