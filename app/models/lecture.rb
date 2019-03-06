class Lecture < ApplicationRecord
  belongs_to :course
  has_many :topics, dependent: :destroy 
  has_many :material_links, dependent: :destroy

  accepts_nested_attributes_for :topics, allow_destroy: true
  accepts_nested_attributes_for :material_links, allow_destroy: true

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }
end
