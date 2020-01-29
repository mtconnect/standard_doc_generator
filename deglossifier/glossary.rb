$: << '.'

require 'treetop'
require 'latex_parser'
require 'csv'

$parser = LatexParser.new

$parser.parse_glossary('./mtc-terms.tex')

$root = './Models'
Dir.mkdir $root unless File.exists?($root)

def pascalize(name)
  name.to_s.split('_').map { |s| s.capitalize }.join('')
end

# Enumerations

CSV.open(File.join($root, 'enumerations.csv'), 'w') do |csv|  
  csv << ['Owner', 'Name', 'OwnedComment']
  $parser.units.sort.each do |u|
    csv << ['UnitEnum', u.name_property, u.description]
  end
  $parser.types.sort.each do |u|
    csv << ['DataItemTypeEnum', u.name_property, u.description]
  end
  $parser.subtypes.sort.each do |u|
    csv << ['DataItemSubTypeEnum', u.name_property, u.description]
  end
end

# Components

owner = 'Components::ComponentTypes'

CSV.open(File.join($root, 'component_classes.csv'), 'w') do |csv|
  csv << ['Owner', 'Name', 'ownedComment']
  $parser.components.sort.each do |g|
    csv << [owner, g.name_property, g.description]
  end
end

CSV.open(File.join($root, 'component_gen.csv'), 'w') do |csv|
  csv << ['Generalization', 'Name']
  $parser.components.sort.each do |g|
    par, = g.kind
    res = $parser[par.to_s]
    parent = res.name_property
    if parent == 'Component'
      parent = 'Components::Component'
    else
      parent = "#{owner}::#{parent}"
    end
    csv << [parent, "#{owner}::#{g.name_property}"]
  end
end

# Observation Types

class Observable
  attr_reader :name, :description, :units, :type, :owner, :sub_type, :kind, :enum

  @@types = Hash.new

  def self.types
    @@types
  end

  def initialize(kind, owner, name, description, units, type, parent, enum, sub_type)
    @kind, @name, @description, @type, @sub_type, @owner, @parent, @enum =
                kind, name, description, type, sub_type, owner, parent, enum

    if units and !units.empty?
      u = $parser[units.to_s]
      if u
        @units = u.name_property.to_s
      else
        puts "Could not find '#{units}'"
        @units = units
      end
    end
    @@types[name] = self
  end

  def parent
    @@types[@parent]
  end

  def qn
    "#{owner}::#{name}"
  end

  def abstract?
    @parent.nil?
  end
end

class Enumeration
  attr_reader :owner, :keys, :name, :values

  @@enumerations = Hash.new

  def self.enums
    @@enumerations
  end

  def self.create(owner, name, values)
    keys = values.map { |v| v.first }.join
    @@enumerations[keys] || Enumeration.new(owner, name, values)
  end
  
  def initialize(owner, name, values)
    @owner, @name, @values =
                   owner, name, values
    @keys = values.map { |v| v.first }.join

    @@enumerations[@keys] = self
  end
  
  def eql?(o)
    @keys == o.keys
  end
  
  def hash
    @keys.hash
  end

  def qn
    "#{owner}::#{@name}"
  end
end  

Observable.new('Sample', 'DataItems::DataItemTypes', 'Sample', nil, nil, nil, nil, nil, nil)
Observable.new('Event', 'DataItems::DataItemTypes', 'Event', nil, nil, nil, nil, nil, nil)
Observable.new('Condition', 'DataItems::DataItemTypes', 'Condition', nil, nil, nil, nil, nil, nil)

$parser.samples.concat($parser.events).concat($parser.conditions).sort.uniq.each do |g|
  name = g[:elementname].to_s
  next unless name and !name.empty?

  if g[:units]
    u = $parser[g[:units]]
    units = (u && u.name_property) || g[:units]
  end

  kind = g[:kind].to_s.split(',').select { |s| s =~ /event|sample|condition/ }.first.capitalize
  owner = "DataItems::DataItemTypes::#{kind}Types"

  if g[:enumeration]
    values = (g.enumeration.to_s.split(',').map do |en|
                e = $parser[en]
                [e.name_property, e.description]
              end.to_a)

    enumeration = Enumeration.create(owner, "#{name}Enum", values)
  end

  Observable.new(kind, owner, name,
                 g.description, units,
                 g.name_property, kind, enumeration, nil)
  
  subtypes = g[:subtype].to_s
  if subtypes
    vals =  subtypes.split(',')
    vals.each do |v|
      vg = $parser[v.strip]
      if vg
        Observable.new(kind, owner, pascalize(vg.name_property) + name,
                       vg.description, units, g.name_property.to_s, name, nil,
                       vg.name_property.to_s)
      end
    end
  end
end

CSV.open(File.join($root, 'dataitem_classes.csv'), 'w') do |types|  
  types << ['Owner', 'Name', 'OwnedComment']
  Observable.types.each do |name, observable|
    unless observable.abstract?
      types << [observable.owner, observable.name, observable.description]
    end
  end
end

CSV.open(File.join($root, 'dataitem_gen.csv'), 'w') do |types|  
  types << ['Generalization', 'Name']
  Observable.types.each do |name, observable|
    unless observable.abstract?
      types << [observable.parent.qn, observable.qn]
    end
  end
end

enum_prefix = 'DataTypes'
data_item = 'DataItems::DataItem'

CSV.open(File.join($root, 'dataitem_attributes.csv'), 'w') do |attrs|
  attrs << ['Owner', 'Name', 'AttrType', 'Visibility', 'True', 'Unit', 'Redefines']
  Observable.types.each do |name, observable|
    unless observable.abstract?
      if observable.parent.abstract? and observable.units and !observable.units.empty?
        attrs << [observable.qn, 'units', "#{enum_prefix}::UnitEnum", 'public', 'true', observable.units,
                  "#{data_item}::units"]
      end
      if observable.parent.abstract?
        attrs << [observable.qn, 'type', "#{enum_prefix}::DataItemTypeEnum", 'public', 'true', observable.type,
                  "#{data_item}::type"]
      end
      if observable.sub_type
        attrs << [observable.qn, 'subType', "#{enum_prefix}::DataItemSubTypeEnum", 'public', 'true',
                  observable.sub_type, "#{data_item}::subType"]
      end
      #if observable.enum
      #  attrs << [observable.qn, 'value', "#{observable.enum.qn}", 'public', 'false',
      #            observable.sub_type, "#{data_item}::Observation::value"]
      #end        
    end
  end
end  

CSV.open(File.join($root, 'dataitem_enums.csv'), 'w') do |enums|
  enums << ['Owner', 'Name']
  Enumeration.enums.each do |keys, enum|
    enums << [enum.owner, enum.name]
  end
end

CSV.open(File.join($root, 'dataitem_enum_values.csv'), 'w') do |enums|
  enums << ['Owner', 'Name', 'OwnerComment']
  Enumeration.enums.each do |keys, enum|
    enum.values.each do |v|
      enums << [enum.qn].concat(v)
    end
  end
end
