class OsraSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  attribute :users do
    []
  end

  attribute :osraMeetings do
    []
  end
end
