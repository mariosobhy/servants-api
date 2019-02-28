class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :mobile_number, :birth_date, :confession_date, :holymass_date, :tnawol_date

  attribute :church do |object| 
    {
      id: object.church.id,
      name: object.church.name
    }
  end 

  attribute :osras do |object| 
    object.osras.map do |m|
      {
        id: m.id,
        name: m.name
      }
    end 
  end 
end 
