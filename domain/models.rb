class Event < ActiveRecord::Base
  has_many :venues, dependent: :destroy, inverse_of: :event
end

class Venue < ActiveRecord::Base
  belongs_to :event, inverse_of: :venues
end
