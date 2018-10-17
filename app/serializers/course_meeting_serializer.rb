class CourseMeetingSerializer
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

  attribute :course_servants do |object|
    object.course.servants.map do |s|
      {
        label: s.name,
        value: s.id,
      }
    end
  end
end
