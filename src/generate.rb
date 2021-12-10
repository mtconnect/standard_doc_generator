# Add directory to path
$: << File.dirname(__FILE__)

require 'logger'
require 'optparse'
require 'json'
require 'set'
require 'markdown/lib/type'
require 'markdown/lib/model'
require 'rexml/document'
require 'rexml/xpath'
require 'nokogiri'
require 'treetop'

Options = {}
parser = OptionParser.new do |opts|
  opts.banner = "Usage: generate.rb [options] [docs]"

  opts.on('-d', '--[no-]debug', 'Debug logging') do |v|
    Options[:debug] = v
  end
  opts.on('-v', '--version VERSION_NUM', 'MTConnect Version') do |ver|
	Options[:version] = ver
  end
end
parser.parse!

$logger = Logger.new(STDOUT)
$logger.level = Options[:debug] ? Logger::DEBUG : Logger::INFO 
$logger.formatter = proc do |severity, datetime, progname, msg|
  "#{severity}: #{msg}\n"
end

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
    load 'generate_documentation.rb'
    
  when 'schema'
	  load 'generate_schema.rb'
  
  else
    $logger.error "Invalid option #{op}"
    $logger.fatal parser.help
  end
end
