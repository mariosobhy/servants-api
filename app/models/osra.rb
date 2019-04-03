require 'csv'

class Osra < ApplicationRecord
  include Convertable
  has_many :osra_servants, dependent: :destroy
  has_many :servants, through: :osra_servants, source: :user
  has_many :amin_osras, dependent: :destroy
  has_many :high_servants, through: :amin_osras, source: :user
  has_many :osra_meetings, dependent: :destroy
  has_many :classrooms, dependent: :destroy
  has_many :conferences, dependent: :destroy
  has_many :spiritual_days, dependent: :destroy

  accepts_nested_attributes_for :osra_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }
  accepts_nested_attributes_for :amin_osras, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def self.to_csv
    attributes = %w{id name created_at}
    export_csv(attributes)
  end
end
