require 'spec_helper'

# As an App User
# I want to be able to see event and venue information
# So that I can decide whether this is an event I want to attend
RSpec.describe 'GET /events/:id' do
  let!(:venue) { Venue.create! }
  let!(:event) { Event.create!(venue: venue) }

  it "returns the requested event" do
    get "/events/#{event.id}"

    response = JSON.parse(last_response.body)
    expect(response['event']).to eq event.attributes
  end

  it "returns the associated venue info" do
    get "/events/#{event.id}"

    response = JSON.parse(last_response.body)
    expect(response['venue']).to eq venue.attributes
  end
end
