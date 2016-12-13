require 'spec_helper'

RSpec.describe "Error responses" do
  context 'GET Unexisting routes' do
    it "returns 404 in JSON format" do
      get '/random_234', {}

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response.status).to eq 404
    end
  end

  context 'POST Unexisting routes' do
    it "returns the error in a JSON format" do
      post '/events/-1', {}

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response.status).to eq 404
    end
  end

  context 'PUT Unexisting routes' do
    it "returns the error in a JSON format" do
      put '/events/-1', {}

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response.status).to eq 404
    end
  end

  context "something wrong happens" do
    it "returns the error in a JSON format" do
      allow(Event).to_receive(anything).and_raise NoMethodError

      get '/events'

      expect(last_response.content_type).to eq 'application/json'
      expect(last_response.status).to eq 500
    end
  end
end
