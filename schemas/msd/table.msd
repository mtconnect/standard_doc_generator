package :Table, 'Table Package' do

  # Create table dataitems 
  Glossary.events.merge(Glossary.samples).each do |name, dataitem|
    next unless name != 'Alarm' and ['Sample','Event'].include?(dataitem['parent'])
    type = self.schema.type(name.to_sym)
    vm = type.value_member
    cell_type = if vm and vm.type
                   vm.type
                 else
                   :StringEventValue
                 end

    self.type "#{type.name}TableEntry".to_sym, "Table Entry of #{type.annotation}", :Entry do
      mixed
      ordered
      member :Cell, "Cells for #{type.name} table", 0..INF, "#{type.name}Cell".to_sym
    end
    
    self.type "#{type.name}Cell".to_sym, "Cell of #{type.annotation}", :TableCell do
      ordered
      member :Value, "Entry for #{type.name} table", cell_type
    end
    
    self.type "#{type.name}Table".to_sym, "Table of #{type.annotation}", :Event do
      mixed
      ordered
      attribute :Count, 'The number of entries', :CountValue
      member :Entry, 'The entries', 0..INF, "#{type.name}TableEntry".to_sym
    end
  end
end
