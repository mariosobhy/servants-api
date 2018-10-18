class SpiritualDayServant < ApplicationRecord
  belongs_to :spiritual_day
  belongs_to :user

  validates :user, uniqueness: { scope: :spiritual_day, message: 'Servant has already been taken!' }
end
