class LectureSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :start_time, :end_time

  attribute :topics do |object| 
    object.topics.map do |s|
      {
        id: s.id, 
        name: s.name, 
        content: s.content
      }
    end 
  end 

  attribute :material_links do |object| 
    object.material_links.map do |s|
      {
        id: s.id, 
        label: s.label, 
        url: s.url
      }
    end 
  end 
end 
