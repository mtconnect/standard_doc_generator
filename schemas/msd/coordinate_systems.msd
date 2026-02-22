package :CoordinateSystems, 'Coordinate systems, kinematics and motion' do
  
  enum :CoordinateSystemTypeEnum, 'The type of coordinate system' do
    value :WORLD, 'The world'
    value :BASE, 'The base of the manipulator chain'
    value :OBJECT, 'The object'
    value :TASK, 'The current task'
    value :MECHANICAL_INTERFACE, 'The last joint in the chain'
    value :TOOL, 'The tool\'s coord'
    value :MOBILE_PLATFORM, 'The platform'
    value :MACHINE, 'For machine tools, the coordinate system in the work area'
    value :CAMERA, 'For machine tools, the coordinate system in the work area'
  end

  # Coordinate Systems
  type :CoordinateSystems, 'A collection of coordinate systems', :AbstractConfiguration do
    mixed
    member :CoordinateSystem, 'A coordinate system', 1..INF
  end

  type :CoordinateSystem, 'Specifies a coordinate system with a location or offset' do
    member :Id, 'The coordinate system identifier', :ID
    member :Name, 'The optional name of the coordinate system', 0..1
    member :NativeName, 'The optional name of the coordinate system', 0..1, :Name
    member :ParentIdRef, 'The parent of the coordinate system', 0..1, :IdRef
    member :Type, 'The coordinate system type', :CoordinateSystemTypeEnum
    member :Uuid, 'uuid of the coordinate system', 0..1
    choice(0..1) do
      member :Origin, 'The location (no parent)'
      member :Transformation, 'A rotation and translation'
      member :OriginDataSet, 'The location with dataset representation', :XYZDataSet
    end
  end

  type :Origin, 'A six space location in space' do
    member :Value, 'The location', :ThreeSpaceValue
  end

  type :Transformation, 'An offset in space' do
    choice(0..1) do
      member :Translation, 'An offset applied first', :ThreeSpaceValue
      member :TranslationDataSet, 'An offset applied first with dataset representation', :XYZDataSet
    end
    choice(0..1) do
      member :Rotation, 'A quaternion transform applied second', :ThreeSpaceValue
      member :RotationDataSet, 'A quaternion transform applied second with dataset representation', :ABCDataSet
    end
  end             
end

