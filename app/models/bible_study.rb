class BibleStudy < ApplicationRecord
  belongs_to :responsible, class_name: 'User', foreign_key: 'user_id', inverse_of: :bible_study_responsibilities
  has_many :bible_study_servants, dependent: :destroy
  has_many :servants, through: :bible_study_servants, source: :user
  has_many :bible_study_meetings, dependent: :destroy

  accepts_nested_attributes_for :bible_study_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
