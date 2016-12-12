# TODO? /api/xx ?

post '/events' do
  content_type :json
  Event.create(params[:event])

  { success: true }.to_json
end

post '/venues' do
  content_type :json
  Venue.create(params[:event])

  { success: true }.to_json
end
