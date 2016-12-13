require 'spec_helper'

RSpec.describe "All stories" do
  let :event_params do
    { name:        "Awesomeness on tour",
      description: "To be scheduled",
      cancelled:   'true',
      starts_at:   Time.now + 3 * (60 * 60),  # +3h
      ends_at:     Time.now + 4 * (60 * 60) } # +4h
  end

  let(:new_event_description) { "New Descr" }

  let :venue_params do
    { name:         "Arena of the death",
      address_info: "Colosseum rd, 23 Rome",
      latitude:     '-28.080315',
      longitude:    '153.383310' }
  end

  it "provide event and venue functionality" do

    ## Create an Event
    post '/events', event: event_params

    expect(last_response).to be_ok
    event_id = JSON.parse(last_response.body)['resource_id']
    expect(event_id).to be_present

    ## Edit the event
    patch "/events/#{event_id}", event: {
      cancelled: 'false',
      description: new_event_description }

    expect(last_response).to be_ok

    ## Create the Venue
    post '/venues', venue_params

    expect(last_response).to be_ok
    venue_id = JSON.parse(last_response.body)['resource_id']

    ## Associate the Event to the Venue
    patch "/events/#{event_id}", event: { venue_id: venue_id }

    expect(last_response).to be_ok

    ## List all events
    get '/events'

    expect(last_response).to be_ok
    event_info = JSON.parse(last_response.body)['events'].last

    ## Get Event detailed info
    get "/events/#{event_info['id']}"

    expect(last_response).to be_ok
    event_info = JSON.parse(last_response.body)['event']
    venue_info = JSON.parse(last_response.body)['venue']
    expect(event_info['venue_id']).to be_present
    expect(event_info['venue_id']).to eq venue_info['id']
    expect(event_info['description']).to eq new_event_description
  end
end
