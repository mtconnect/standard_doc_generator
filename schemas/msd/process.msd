package :Process, 'process and process archetype asset' do

  # Process
  attr :Precedence, ''
  attr :StepId, '', :ID
  attr :RoutingId, '', :ID
  attr :ActivityGroupId, '', :ID
  attr :ActivityId, '', :ID
  attr :Optional, '', :boolean
  basic_type :StartTime, '', :dateTime
  basic_type :Duration, '', :float
 
  type :Activity do
    member :Sequence, '', 0..1
    member :ActivityId, '', 1
    member :Precedence, '', 0..1
    member :Optional, '', 0..1
    member :Description, '', 0..1, :DescriptionText
  end

  type :ActivityGroup do 
    member :ActivityGroupId, '', 1
    member :Name, '', 0..1
    member :Activity, '', 1..INF
  end

  type :ActivityGroups do
    member :ActivityGroup, '', 1..INF
  end
  

  type :ProcessStep do
    member :StepId, '', 1
    member :Optional, '', 0..1
    member :Sequence, '', 0..1
    member :StartTime, '', 0..1
    member :Duration, '', 0..1
    member :ActivityGroups, '', 0..1
    member :Target, '', 0..1
  end

  type :ProcessRouting do
    member :Precedence, '', 0..1
    member :RoutingId, '', 1
    member :ProcessStep, '', 1..INF
  end

  type :Process, :Asset do
    member :Revision, '', 1
    member :Targets, '', 0..1
    member :Routing, '', 1, :ProcessRouting
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end

  # Process Archetype


  type :ArchetypeProcessStep do
    member :StepId, '', 1
    member :Optional, '', 0..1
    member :Sequence, '', 0..1
    member :StartTime, '', 0..1
    member :Duration, '', 0..1
    member :ActivityGroups, '', 0..1
    member :Targets, '', 0..1
  end

  
  type :ArchetypeRouting do
    member :Precedence, '', 0..1
    member :RoutingId, '', 1
    member :ProcessStep, '', 1..INF, :ArchetypeProcessStep
  end

  type :Routings do
    member :Routing, '', 1..INF, :ArchetypeRouting
  end

  type :ProcessArchetype, :Asset do
    member :Revision, '', 1
    member :Targets, '', 0..1
    member :Routings, '', 1
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end
end
