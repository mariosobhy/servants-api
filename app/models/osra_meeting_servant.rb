class OsraMeetingServant < ApplicationRecord
  belongs_to :osra_meeting
  belongs_to :osra_servant

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
