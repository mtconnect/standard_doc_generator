package :Part, 'part and part archetype asset' do

  # Part Instance
  attr :Family, ''
  attr :Drawing, ''
  attr :Revision, ''
  attr :NativeId, '', :ID
  attr :StepIdRef, '', :ID
  attr :PartIdentifierValue, '', :ID

  enum :PartIdentifierType, '' do
    value :UNIQUE_IDENTIFIER, ''
    value :GROUP_IDENTIFIER, ''
  end

  type :Part, :Asset do
    member :Family, '', 0..1
    member :Drawing, '', 0..1
    member :Revision, '', 1
    member :NativeId, '', 0..1
    member :PartIdentifiers, '', 0..1
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end

  type :Identifier do
    abstract
    member :Type, '', 1, :PartIdentifierType
    member :StepIdRef, '', 0..1
    member :Timestamp, '', 1
    member :Value, '', 1, :PartIdentifierValue
  end

  type :PartIdentifiers do
    member :UniqueIdentifier, '', 0..INF, :Identifier
    member :GroupIdentifier, '', 0..INF, :Identifier
  end


  # Part Archetype
  
  basic_type :Address, ''
  attr :CustomerId, '', :ID

  type :Customer do
    member :CustomerId, '', 0..1
    member :Name, '', 0..1
    member :Address, '', 0..1
    member :Description, '', 0..1, :DescriptionText
  end

  type :Customers do
    member :Customer, '', 1..INF
  end
  
  type :PartArchetype, :Asset do
    member :Family, '', 0..1
    member :Drawing, '', 0..1
    member :Revision, '', 1
    member :Customers, '', 0..1
    member :Description, 'description of an asset', 0..1, :AssetDescription
    member :Configuration, 'The configuration information about this Asset', 0..1, :AssetConfiguration
  end
end
