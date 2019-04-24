require 'csv'

class User < ApplicationRecord
  include Convertable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
    :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  belongs_to :church, inverse_of: :servants

  has_many :osra_servants, dependent: :destroy
  has_many :osras, through: :osra_servants
  has_many :attendees, dependent: :destroy
  has_many :bible_study_responsibilities, class_name: 'BibleStudy', foreign_key: 'user_id', inverse_of: :responsible, dependent: :destroy
  has_many :course_responsibilities, class_name: 'Course', foreign_key: 'user_id', inverse_of: :responsible, dependent: :destroy
  has_many :classroom_responsibilities, class_name: 'Classroom', foreign_key: 'user_id', inverse_of: :responsible, dependent: :destroy
  has_many :hobbies, dependent: :destroy
  has_many :mobile_numbers, dependent: :destroy

  accepts_nested_attributes_for :mobile_numbers, allow_destroy: true
  accepts_nested_attributes_for :hobbies, allow_destroy: true

  # default scope will be filtered by current month
  scope :by_month, -> (month = DateTime.now.month) { where('extract(month from birth_date) = ?', month) }
  scope :by_year, -> (year = DateTime.now.year) { where('extract(year from created_at) = ?', year) }
  scope :latest, -> { order('created_at DESC') }

  def self.to_csv
    attributes = %w{id name email nickname birth_date holymass_date church_id address tnawol_date confession_date}
    export_csv(attributes)
  end
end
