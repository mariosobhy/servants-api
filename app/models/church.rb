class Church < ApplicationRecord
  has_many :servants, class_name: 'User', foreign_key: 'church_id', inverse_of: :church, dependent: :destroy
  
  validates_presence_of :name, :country, :city
end
