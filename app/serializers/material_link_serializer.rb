class MaterialLinkSerializer
  include FastJsonapi::ObjectSerializer
  attributes :label, :url
  belongs_to :course
end 
