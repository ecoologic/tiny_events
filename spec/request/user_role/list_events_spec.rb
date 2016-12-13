require 'spec_helper'

# As an App User
# I want to be able to see a list of events
# So that I can choose an event to get more information for
RSpec.describe 'GET /events' do
  before { Event.destroy_all }

  let!(:early_event) { Event.create!(name: "Late",  starts_at: Time.now + 30) }
  let!(:late_event)  { Event.create!(name: "Early", starts_at: Time.now + 60) }
  let!(:past_event)  { Event.create!(name: "Past",  starts_at: Time.now - 60) }

  it "returns all the upcoming events in chronological order" do
    get '/events'

    actual_events = JSON.parse(last_response.body)['events']
    actual_event_names = actual_events.map { |e| e['name'] }
    expect(actual_event_names).to eq([early_event, late_event].map(&:name))
  end
end
