class MobileNumber < ApplicationRecord
  belongs_to :user

  validates :number, phone: true
end
