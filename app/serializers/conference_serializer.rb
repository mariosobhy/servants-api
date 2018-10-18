class ConferenceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :place, :price, :no_of_servants

  attribute :conference_servants do |object|
    object.conference_servants.map do |s|
      {
        id: s.id,
        name: s.user.name
      }
    end
  end
end
