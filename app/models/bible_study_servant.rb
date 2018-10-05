class BibleStudyServant < ApplicationRecord
  belongs_to :bible_study
  belongs_to :user

  validates :user, uniqueness: { scope: :bible_study, message: 'Servant has already been taken!' }
end
