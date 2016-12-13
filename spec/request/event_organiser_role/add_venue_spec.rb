require 'spec_helper'

# As an Event Organiser
# I want to add a venue to my event
# So that delegates will know where my event is
RSpec.describe 'POST /venues' do
  let :valid_params do
    {
      name:         "Arena of the death",
      address_info: "Colosseum rd, 23 Rome",
      latitude:     '-28.080315',
      longitude:    '153.383310'
    }
  end

  context "with valid data" do
    it "creates the venue and attaches it to the event" do
      expect do
        post '/venues', venue: valid_params
      end
        .to change(Venue, :count).by 1

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response).to be_ok
    end
  end

  context "with invalid data" do
    it "returns a convenient error (code and description)" do
      expect do
        post '/venues', venue: { latitude: '234' }
      end
        .not_to change(Venue, :count)

      expect(last_response.status).to eq 422
      response = JSON.parse(last_response.body)

      expect(response['success']).to be false
      expect(response['errors']).to eq ["Longitude can't be blank"]
    end
  end
end

RSpec.describe 'PATCH /venues' do
  xit "it attaches the venue to the event"
end
