class Venue < ActiveRecord::Base
  has_many :events, dependent: :restrict_with_error, inverse_of: :venue
end

class Event < ActiveRecord::Base
  belongs_to :venue, inverse_of: :events
end
