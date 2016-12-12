require 'spec_helper'

RSpec.describe "All user stories" do
  it "provide event and venue functionality" do
    ## Create
    post '/events', event: {
      name: "Awesome",
      description: "To be scheduled",
      cancelled: 'true',
      starts_at: Time.now,
      ends_at:   Time.now + 3 * (60 * 60) # +3h
    }

    event = Event.last
    expect(event.name).to eq "Awesome"

    ## Edit
    patch "/events/#{event.id}", event: { cancelled: 'false' }

    expect(event.reload.cancelled?).to eq false
  end
end
