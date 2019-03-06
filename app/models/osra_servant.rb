class OsraServant < ApplicationRecord
  has_many :osra_meeting_servants, dependent: :destroy
  has_many :osra_meetings, through: :osra_meeting_servants
  belongs_to :osra
  belongs_to :user

  validates :user, uniqueness: { scope: :osra, message: 'Servant has already been taken!' }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
