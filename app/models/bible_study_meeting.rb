class BibleStudyMeeting < ApplicationRecord
  REPEAT_TYPES = { 'once' => 0, 'daily' => 1, 'weekly' => 7, 'monthly' => 30, 'yearly' => 365 }.freeze

  belongs_to :bible_study
  has_many :events, as: :eventable, dependent: :destroy

  validates :name,
            :start_date,
            :end_date,
            :from,
            :to,
            :repeat,
            presence: true
  validates :repeat, inclusion: { in: REPEAT_TYPES.keys }

  after_create_commit :create_events

  private

  def create_events
    if repeat == 'once'
      events.create(date: start_date)
    else
      (start_date..end_date).step(REPEAT_TYPES[repeat]).each do |date|
        events.create(date: date)
      end
    end
  end
end