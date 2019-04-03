require 'csv'

class Classroom < ApplicationRecord
  include Convertable
  belongs_to :responsible, class_name: 'User', foreign_key: 'user_id', inverse_of: :classroom_responsibilities
  belongs_to :osra

  has_many :classroom_servants, dependent: :destroy 
  has_many :servants, through: :classroom_servants, source: :user

  accepts_nested_attributes_for :classroom_servants, allow_destroy: true, reject_if: proc { |attributes| attributes['user_id'].blank? }

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def self.to_csv 
    attributes = %w{id name user_id osra_id }
    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |item|
        csv << attributes.map{ |attr| item.send(attr) }
      end
    end
  end 
end
