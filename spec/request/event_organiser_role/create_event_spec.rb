require 'spec_helper'

RSpec.describe "I want to add an event" do
  it "works" do
    get '/test'

    # expect { Sinatra }.to_not raise_error
    expect(last_response).to be_ok
    expect { DB }.to_not raise_error
  end

  context "As an Event Organiser" do
    describe 'POST create' do
      context "with valid data" do
        # it "creates an event with the given data"
      end
    end
  end
end
