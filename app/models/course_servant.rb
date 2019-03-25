class CourseServant < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :user, uniqueness: { scope: :course, message: 'Servant has already been taken!' }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def total_calculated_score 
    if course.score_type == 'per_course'
      total = course.total_score 
    else 
      total = 0
      course.lectures.each do |lec|
        total += lec.score
      end 
    end 
    total
  end 
end
