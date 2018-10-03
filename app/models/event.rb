class Event < ApplicationRecord
  belongs_to :eventable, polymorphic: true

  has_many :attendees, dependent: :destroy
end
