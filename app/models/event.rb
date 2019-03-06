class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true

  has_many :attendees, dependent: :destroy

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
