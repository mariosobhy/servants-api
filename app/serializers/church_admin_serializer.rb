class ChurchAdminSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :church_id

  attribute :amin_osras do |object|
    object.amin_osras.map do |s|
      {
        id: s.id, 
        name: s.user.name
      }
    end 
  end 
end
