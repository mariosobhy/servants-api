class ConferenceServant < ApplicationRecord
  belongs_to :conference, counter_cache: :no_of_servants
  belongs_to :user

  validates :user, uniqueness: { scope: :conference, message: 'Servant has already been taken!' }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
