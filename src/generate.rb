# Add directory to path
$: << File.dirname(__FILE__)

require 'logger'
require 'optparse'
require 'json'
require 'set'
require 'type'
require 'model'
require 'rexml/document'
require 'rexml/xpath'
require 'nokogiri'

require 'treetop'

Options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: generate.rb [options] [docs|nodeset]"

  opts.on("-r", "--[no-]clean", "Regenerate Nodeset Ids") do |v|
    Options[:clean] = v
  end

  opts.on('-d', '--[no-]debug', 'Debug logging') do |v|
    Options[:debug] = v
  end
end
parser.parse!

$logger = Logger.new(STDOUT)
$logger.level = Options[:debug] ? Logger::DEBUG : Logger::INFO 
$logger.formatter = proc do |severity, datetime, progname, msg|
  "#{severity}: #{msg}\n"
end

DeviceModels = ['Components', 'ComponentTypes', 'Compositions','CompositionTypes', 'DataItems', 'ConditionTypes', 'EventTypes', 'SampleTypes', 'Profile']

DeviceDirectory = File.join(File.dirname(__FILE__),'..','devices')
DeviceDocumentFile = File.join(File.dirname(__FILE__),'..','devices','devices.tex')

xmiDoc = nil
File.open(File.join(File.dirname(__FILE__), '..', 'MTConnect SysML Model.xml')) do |xmi|
  xmiDoc = Nokogiri::XML(xmi).slop!
  RootModel = xmiDoc.at('//uml:Model')
end

$namespaces = Hash[xmiDoc.namespaces.map { |k, v| [k.split(':').last, v] }]

SkipModels = Set.new
SkipModels.add('AssetModel')
SkipModels.add('CSV Imports')
SkipModels.add('Simulation')


unless ARGV.first
  $logger.error "The directive docs must be given"
  $logger.error parser.help
  exit
end

operations = Set.new(ARGV)

operations.each do |op|
  Type.clear
  Model.clear
  Relation.clear
  
  case op
  when 'docs'
    load 'create_documentation.rb'
    
  else
    $logger.error "Invalid option #{op}"
    $logger.fatal parser.help
  end
end
