class OsraMeetingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :start_date, :end_date, :repeat

  attribute :from do |object|
    object.from.strftime('%H:%M')
  end

  attribute :to do |object|
    object.to.strftime('%H:%M')
  end
end
