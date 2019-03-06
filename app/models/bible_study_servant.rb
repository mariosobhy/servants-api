class BibleStudyServant < ApplicationRecord
  belongs_to :bible_study
  belongs_to :user

  validates :user, uniqueness: { scope: :bible_study, message: 'Servant has already been taken!' }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
