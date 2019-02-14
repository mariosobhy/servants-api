class TopicSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content
  belongs_to :course
end
