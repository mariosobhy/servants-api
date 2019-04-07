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

  attributes :amin_osras do |object|
    object.amin_osras.map do |s|
      {
        id: s.id,
        name: s.user.name,
        church_admin: s.church_admin.user.name
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

  attribute :classrooms do |object| 
    object.classrooms.map do |m|
      {
        id: m.id,
        name: m.name
      }
    end 
  end   

  attribute :conferences do |object|
    object.conferences.map do |m|
      {
        id: m.id,
        name: m.name
      }
    end 
  end 

  attribute :spiritual_days do |object|
    object.spiritual_days.map do |m|
      {
        id: m.id,
        name: m.name
      }
    end 
  end 
end
