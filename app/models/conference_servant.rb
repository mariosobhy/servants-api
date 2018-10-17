class ConferenceServant < ApplicationRecord
  belongs_to :conferece
  belongs_to :user

  validates :user, uniqueness: { scope: :bible_study, message: 'Servant has already been taken!' }
end
