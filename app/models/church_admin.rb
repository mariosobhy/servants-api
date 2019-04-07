class ChurchAdmin < ApplicationRecord
  belongs_to :church
  belongs_to :user

  has_many :amin_osras, dependent: :destroy

  validates :user, uniqueness: { scope: :church, message: 'Church admin has already been taken!' }

  accepts_nested_attributes_for :amin_osras, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? } 

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
