require 'csv'

class SpiritualDay < ApplicationRecord
  include Convertable
  has_many :spiritual_day_servants, dependent: :destroy
  has_many :servants, through: :spiritual_day_servants
  belongs_to :osra

  validates :name,
    :price,
    :place,
    presence: true

  accepts_nested_attributes_for :spiritual_day_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }

  scope :by_date, -> (date) { where("extract(day from start_date) = ?", DateTime.parse(date).day) }
  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def self.to_csv
    attributes = %w{id name price place no_of_servants start_date end_date osra_id }
    export_csv(attributes)
  end
end
