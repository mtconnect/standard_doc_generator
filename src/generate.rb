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
Directory = {}
DocumentFile ={}
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

DeviceModels = ['Components',
                
				'ComponentTypes',
				'Compositions',
				'CompositionTypes',
				'DataItems',
				'DataItemTypes',
                                'References'
				]
				
ConfigurationModels = ['Configuration',
				'CoordinateSystems',
				'Motion',
				'Relationships',
				'SensorConfiguration',
				'Specifications'
				]

ProfileModels = ['Profile']

ObservationModels = ['Observations',
				'ConditionTypes',
				'EventTypes',
				'SampleTypes'
				]

AssetModels = ['AssetModel',
				'CuttingToolModel',
				'CuttingItemModel'
				]		


Directory['Device'] = File.join(File.dirname(__FILE__),'..','devices')
DocumentFile['Device'] = File.join(File.dirname(__FILE__),'..','devices','devices.tex')

Directory['Observation'] = File.join(File.dirname(__FILE__),'..','observations')
DocumentFile['Observation'] = File.join(File.dirname(__FILE__),'..','observations','observations.tex')

Directory['AssetModel'] = File.join(File.dirname(__FILE__),'..','assets')
DocumentFile['AssetModel'] = File.join(File.dirname(__FILE__),'..','assets','assets.tex')

xmiDoc = nil
File.open(File.join(File.dirname(__FILE__), '..', 'MTConnect SysML Model.xml')) do |xmi|
  xmiDoc = Nokogiri::XML(xmi).slop!
  RootModel = xmiDoc.at('//uml:Model')
end

$namespaces = Hash[xmiDoc.namespaces.map { |k, v| [k.split(':').last, v] }]

SkipModels = Set.new
SkipModels.add('CSV Imports')
SkipModels.add('Simulation')
SkipModels.add('Glossary')
SkipModels.add('MTConnect')


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
