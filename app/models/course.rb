class Course < ApplicationRecord
  belongs_to :responsible, class_name: 'User', foreign_key: 'user_id', inverse_of: :course_responsibilities
end
