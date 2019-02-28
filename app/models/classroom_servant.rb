class ClassroomServant < ApplicationRecord
  belongs_to :classroom
  belongs_to :user

  validates :user, uniqueness: { scope: :classroom, message: 'Servant has already been taken!' }
end
