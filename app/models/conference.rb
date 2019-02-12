class Conference < ApplicationRecord
  has_many :conference_servants, dependent: :destroy
  has_many :servants, through: :conference_servants, source: :user

  validates :name,
            :price,
            :place,
            presence: true

  accepts_nested_attributes_for :conference_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }
end
