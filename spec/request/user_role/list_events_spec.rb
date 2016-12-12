require 'spec_helper'

# As an App User
# I want to be able to see a list of events
# So that I can choose an event to get more information for
RSpec.describe 'GET /events' do
  before { Event.destroy_all }

  let!(:event) { Event.create! }

  it "returns all the events" do
    get '/events'

    # TODO? ['events']
    response = JSON.parse(last_response.body)
    # FIXME: temperamental?
    expect(response).to eq [event.attributes]
  end
end
