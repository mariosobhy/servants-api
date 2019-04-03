require 'csv'

class Lecture < ApplicationRecord
  include Convertable
  belongs_to :course
  has_many :topics, dependent: :destroy
  has_many :material_links, dependent: :destroy

  accepts_nested_attributes_for :topics, allow_destroy: true
  accepts_nested_attributes_for :material_links, allow_destroy: true

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def self.to_csv
    attributes = %w{id name start_date end_date course_id score }
    export_csv(attributes)
  end
end
