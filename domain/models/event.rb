class Event < ActiveRecord::Base
  belongs_to :venue, inverse_of: :events

  scope :ordered, -> { order(:starts_at) }
  scope :starting_after, ->(time) { where('events.starts_at > ?', time) }
end
