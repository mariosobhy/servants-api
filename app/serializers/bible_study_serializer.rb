class BibleStudySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user_id, :total_score

  attribute :responsible do |object|
    {
      id: object.responsible.id,
      name: object.responsible.name,
    }
  end

  attribute :bible_study_servants do |object|
    object.bible_study_servants.map do |s|
      {
        id: s.id,
        name: s.user.name
      }
    end
  end

  attribute :bible_study_meetings do |object|
    # object.bible_study_meetings.map do |m|
    #   {
    #     id: m.id,
    #     name: m.name
    #   }
    # end
    []
  end
end
