class OsraSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :servants do |object|
    object.servants.map do |s|
      {
        id: s.id,
        name: s.name,
      }
    end
  end

  attribute :osraMeetings do
    []
  end
end
