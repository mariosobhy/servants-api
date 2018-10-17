class Course < ApplicationRecord
  belongs_to :responsible, class_name: 'User', foreign_key: 'user_id', inverse_of: :course_responsibilities
  has_many :course_servants, dependent: :destroy
  has_many :servants, through: :course_servants, source: :user
  has_many :course_meetings, dependent: :destroy

  accepts_nested_attributes_for :bible_study_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }
end
