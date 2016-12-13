require 'spec_helper'

# As an Event Organiser
# I want to update an event
# So that delegates can have up to date information
RSpec.describe 'PATCH /events/:id' do
  let :valid_params do
    { ends_at: Time.now + 2 * (60 * 60) } # +2 hour
  end

  let!(:event) { Event.create! }

  context "requesting to cancel the event" do
    let(:event_params) { { event: { cancelled: true } } }

    it "marks the event as cancelled" do
      expect do
        patch "/events/#{event.id}", event_params
      end
        .to change(Event, :count).by 0

      expect(last_response.content_type).to eq 'application/json'
      puts last_response.body
      expect(last_response).to be_ok
      expect(event.reload.cancelled?).to eq true
    end
  end
end
