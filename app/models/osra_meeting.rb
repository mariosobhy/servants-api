class OsraMeeting < ApplicationRecord
  REPEAT_TYPES = %w[once daily weekly monthly yearly].freeze

  belongs_to :osra

  validates :name,
            :start_date,
            :end_date,
            :from,
            :to,
            :repeat,
            presence: true
  validates :repeat, inclusion: { in: REPEAT_TYPES }
end
