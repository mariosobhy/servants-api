class ConferenceServant < ApplicationRecord
  belongs_to :conference
  belongs_to :user

  validates :user, uniqueness: { scope: :conference, message: 'Servant has already been taken!' }
end
