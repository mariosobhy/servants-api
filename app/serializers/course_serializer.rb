class CourseSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :user_id, :total_score, :no_of_lectures

  attribute :responsible do |object|
    {
      id: object.responsible.id,
      name: object.responsible.name,
    }
  end

  attribute :course_servants do |object|
    object.course_servants.map do |s|
      {
        id: s.id,
        name: s.user.name
      }
    end
  end

  attribute :course_meetings do |object|
    object.course_meetings.map do |m|
      {
        id: m.id,
        name: m.name
      }
    end
  end
end
