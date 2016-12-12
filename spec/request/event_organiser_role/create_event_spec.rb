require 'spec_helper'

RSpec.describe "I want to add an event" do
  context "As an Event Organiser" do
    describe 'POST create' do
      context "with valid data" do
        # it "creates an event with the given data"
        it "runs the specs" do
          expect(true).to eq true
          expect { Sinatra }.to_not raise_error
        end
      end
    end
  end
end
