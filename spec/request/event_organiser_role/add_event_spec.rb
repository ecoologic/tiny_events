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
  let(:json_request) { { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' } }

  context "with valid data" do
    it "creates the event with those values" do
      expect do
        post '/events', { event: valid_params }, json_request
      end
        .to change(Event, :count).by 1

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response).to be_ok
      # TODO: CHECK values
    end
  end

  context "with invalid data" do
    it "returns a convenient error (code and description)"
  end
end