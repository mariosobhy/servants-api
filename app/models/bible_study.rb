class BibleStudy < ApplicationRecord
  belongs_to :responsible, class_name: 'User', foreign_key: 'user_id', inverse_of: :bible_study_responsibilities
end
