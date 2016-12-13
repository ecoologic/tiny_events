require 'spec_helper'

# As an Event Organiser
# I want to add an event
# So that delegates will know what my event is
RSpec.describe 'POST /events' do
  let :valid_params do
    {
      name:        "Friendly chat",
      description: "Come and talk to us",
      cancelled:   'false',
      starts_at:   Time.now,
      ends_at:     Time.now + (60 * 60) # +1 hour
    }
  end

  context "with valid data" do
    it "creates the event with those values" do
      expect do
        post '/events', event: valid_params
      end
        .to change(Event, :count).by 1

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response).to be_ok
      expect(Event.last.name).to eq valid_params[:name]
    end
  end
end

RSpec.describe 'PATCH /events/:id' do
  let!(:venue) { Venue.create }
  let!(:event) { Event.create }

  it "it can associate the event to the venue" do
    expect do
      patch "/events/#{event.id}", event: { venue_id: venue.id }
    end
      .not_to change(Event, :count)

    expect(last_response.content_type).to eq 'application/json'
    expect(last_response).to be_ok
    expect(Event.last.venue).to eq venue
  end
end
