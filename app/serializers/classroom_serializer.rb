class ClassroomSerializer 
  include FastJsonapi::ObjectSerializer 
  attributes :name

  attribute :responsible do |object| 
    {
      id: object.responsible.id, 
      name: object.responsible.name
    }
  end 

  attribute :osra do |object| 
    {
      id: object.osra.id, 
      name: object.osra.name
    }
  end 

  attribute :classroom_servants do |object|
    object.classroom_servants.map do |s|
      {
        id: s.id,
        name: s.user.name
      }
    end
  end
end 
