package :Task, 'Multi Device Interaction Model' do

  # Value Types
  basic_type :ParentTaskAssetId, ''
  basic_type :TaskType, ''
  basic_type :Priority, '', :integer
  attr :CollaboratorId, '', :ID
  attr :CollaboratorType, ''
  attr :CollaboratorDeviceUuid, '', :Uuid
  attr :CollaboratorRequirementId, ''
  
  enum :TaskState, '' do
    value :INACTIVE, ''
    value :PREPARING, ''
    value :COMMITTING, ''
    value :COMMITTED, ''
    value :FAIL, ''
  end

  # Task
  type :Collaborator do
    member :CollaboratorId, '', 1
    member :Type, '', 0..1, :CollaboratorType
    member :CollaboratorDeviceUuid, '', 1
    member :RequirementId, '', 0..1, :CollaboratorRequirementId
  end

  type :Collaborators do
    member :Collaborator, '', 1..INF
  end

  type :Coordinator do
    member :Collaborator, '', 1
  end

  type :SubTasks do
    member :Task, '', 1..INF
  end

  type :Task, :Asset do
    member :TaskType, '', 1
    element :TaskState, '', 1
    member :ParentTaskAssetId, '', 0..1
    member :Collaborators, '', 1
    member :Coordinator, '', 1
    member :SubTasks, '', 0..1
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end

  # Task Archetype
  type :ArchetypeCollaborator do
    member :CollaboratorId, '', 1
    member :Type, '', 0..1, :CollaboratorType
    member :Optional, '', 0..1
    member :Targets, '', 1
  end

  type :ArchetypeCollaborators do
    member :Collaborator, '', 1..INF, :ArchetypeCollaborator
  end

  type :ArchetypeCoordinator do
    member :Collaborator, '', 1, :ArchetypeCollaborator
  end

  type :TaskArchetype, :Asset do
    member :TaskType, '', 1
    member :Priority, '', 0..1
    member :Collaborators, '', 1, :ArchetypeCollaborators
    member :Coordinator, '', 1, :ArchetypeCoordinator
    member :Targets, '', 0..1
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end
end