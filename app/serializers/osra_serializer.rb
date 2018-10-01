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

  attribute :osra_meetings do |object|
    object.osra_meetings.map do |m|
      {
        id: m.id,
        name: m.name
      }
    end
  end
end
