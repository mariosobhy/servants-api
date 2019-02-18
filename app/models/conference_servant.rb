class ConferenceServant < ApplicationRecord
  belongs_to :conference, counter_cache: :no_of_servants
  belongs_to :user

  validates :user, uniqueness: { scope: :conference, message: 'Servant has already been taken!' }
end
