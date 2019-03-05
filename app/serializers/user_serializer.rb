class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :birth_date, :address, :confession_date, :holymass_date, :tnawol_date

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

  attribute :mobile_numbers do |object| 
    object.mobile_numbers.map do |m|
      {
        number: m.number
      }
    end 
  end 

  attribute :hobbies do |object| 
    object.hobbies.map do |m| 
      {
        name: m.name
      }
    end 
  end 
end 
