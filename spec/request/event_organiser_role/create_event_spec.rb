require 'spec_helper'

RSpec.describe "I want to add an event" do
  it "works" do
    get '/test'

    expect(last_response).to be_ok
    expect(last_response.content_type).to eq 'application/json'
    expect(JSON.parse(last_response.body)).to eq 'is' => 'a JSON'
    expect { DB }.to_not raise_error
  end

  context "As an Event Organiser" do
    describe 'POST create' do
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
        it "creates an event" do
          post '/events', event: valid_params

          expect(last_response.content_type).to eq 'application/json'
          expect(last_response).to be_ok
        end
      end
    end
  end
end
