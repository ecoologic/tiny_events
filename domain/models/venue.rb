class Venue < ActiveRecord::Base
  has_many :events, dependent: :restrict_with_error, inverse_of: :venue
  validates :latitude, :longitude, presence: true, if: -> { latitude || longitude }
end
