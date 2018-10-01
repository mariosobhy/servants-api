class Osra < ApplicationRecord
  has_many :osra_servants, dependent: :destroy
  has_many :servants, through: :osra_servants, source: :user
  has_many :osra_meetings, dependent: :destroy

  accepts_nested_attributes_for :osra_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }
end
