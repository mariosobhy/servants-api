class OsraSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :osra_servants do |object|
    object.osra_servants.map do |s|
      {
        id: s.id,
        name: s.user.name
      }
    end
  end

  attribute :osraMeetings do
    []
  end
end
