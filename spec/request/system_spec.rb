require 'spec_helper'

RSpec.describe 'GET Unexisting routes' do
  it "returns 404 in JSON format" do
    get '/random_234', {}

    expect(last_response.content_type).to eq 'application/json'
    expect(last_response.status).to eq 404
  end
end

RSpec.describe 'POST Unexisting routes' do
  it "returns the error in a JSON format" do
    post '/events/-1', {}

    expect(last_response.content_type).to eq 'application/json'
    expect(last_response.status).to eq 404
  end
end
