class SpiritualDayServant < ApplicationRecord
  belongs_to :spiritual_day
  belongs_to :user

  validates :user, uniqueness: { scope: :spiritual_day, message: 'Servant has already been taken!' }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
