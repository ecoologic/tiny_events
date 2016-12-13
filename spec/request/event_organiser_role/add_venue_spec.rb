require 'spec_helper'

RSpec.describe 'POST /venues' do
  before { Event.destroy_all }

  let :valid_params do
    {
      name:         "Arena of the death",
      address_info: "Colosseum rd, 23 Rome",
      latitude:     '-28.080315',
      longitude:    '153.383310'
    }
  end

  context "with valid data" do
    it "creates the venue" do
      expect do
        post '/venues', venue: valid_params
      end
        .to change(Venue, :count).by 1

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response).to be_ok
      expect(JSON.parse(last_response.body)['resource_id'].to_i).to_not eq 0
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
      expect(response['errors']).to include "Longitude can't be blank"
    end
  end
end
