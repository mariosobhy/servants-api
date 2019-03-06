class MobileNumber < ApplicationRecord
  belongs_to :user

  validates :number, phone: true

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
