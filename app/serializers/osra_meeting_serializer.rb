class OsraMeetingSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_date, :end_date, :repeat

  attribute :from do |object|
    object.from.strftime('%H:%M')
  end

  attribute :to do |object|
    object.to.strftime('%H:%M')
  end

  attribute :events do |object|
    object.events.map do |e|
      {
        id: e.id,
        date: e.date,
      }
    end
  end
end
