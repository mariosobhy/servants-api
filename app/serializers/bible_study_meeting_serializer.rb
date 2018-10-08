class BibleStudyMeetingSerializer
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

  attribute :bible_study_servants do |object|
    object.bible_study.servants.map do |s|
      {
        label: s.name,
        value: s.id,
      }
    end
  end
end
