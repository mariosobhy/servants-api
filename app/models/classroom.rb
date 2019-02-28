class Classroom < ApplicationRecord
  belongs_to :responsible, class_name: 'User', foreign_key: 'user_id', inverse_of: :classroom_responsibilities
  belongs_to :osra

  has_many :classroom_servants, dependent: :destroy 
  has_many :servants, through: :classroom_servants, source: :user

  accepts_nested_attributes_for :classroom_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }
end
