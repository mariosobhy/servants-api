require 'csv'

class Church < ApplicationRecord
  include Convertable
  has_many :servants, class_name: 'User', foreign_key: 'church_id', inverse_of: :church, dependent: :destroy
  has_one :church_admin, dependent: :destroy
  
  validates_presence_of :name, :country, :city

  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def self.to_csv 
    attributes = %w{id name country city address }
    export_csv(attributes)
  end 
end
