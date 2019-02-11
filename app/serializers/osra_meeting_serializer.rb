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
        attendees_cnt: e.attendees.count,
        attendees: AttendeeSerializer.new(e.attendees).serializable_hash,
      }
    end
  end

  attribute :osra_servants do |object|
    object.osra.servants.map do |s|
      {
        label: s.name,
        value: s.id,
      }
    end
  end

  attribute :meeting_servants do |object| 
    object.osra_servants.map do |s|
      {
        label: s.user.name,
        value: s.user.id,
      }
    end 
  end 
end
