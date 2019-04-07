class AminOsra < ApplicationRecord
  belongs_to :user
  belongs_to :osra
  belongs_to :church_admin

  validates :user, uniqueness: { scope: :osra, message: 'Amin osra has already been taken!' }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
