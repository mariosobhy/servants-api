class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, # :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :osra_servants, dependent: :destroy
  has_many :osras, through: :osra_servants
  has_many :attendees, dependent: :destroy
  has_many :bible_study_responsibilities, class_name: 'BibleStudy', foreign_key: 'user_id', inverse_of: :responisble, dependent: :destroy
  has_many :course_responsibilities, class_name: 'Course', foreign_key: 'user_id', inverse_of: :responisble, dependent: :destroy
  belongs_to :church, inverse_of: :servants 

  validates :mobile_number, phone: true
end
