before { content_type :json }

## Events

post '/events' do
  Event.create(params[:event])

  { success: true }.to_json
end

patch '/events/:id' do
  event = Event.find(params[:id])
  event.update_attributes(params[:event])

  { success: true }.to_json
end

get '/events' do
  Event.all.to_json
end

## Venues

post '/venues' do
  Venue.create(params[:event])

  { success: true }.to_json
end

## System

error 300...500 do
  content_type :json
  { success: false }.to_json
end

error 500...600 do
  # binding.pry
  content_type :json
  { success: false, error: $ERROR_INFO.message, location: $ERROR_INFO.backtrace[0] }.to_json
end

# FIXME: why is not included? in 300...500?
get '/*' do
  status 404
  { success: false }.to_json
end
not_found do
  content_type :json
  { success: false }.to_json
end

# TODO? /api/xx ?
# TODO: SECURITY?
# TODO: class MyApp < Sinatra::Base
# TODO: id assignment?
# TODO: RSPEC READS WELL (and comments)
# WEB dir.. but sinatra IS already web?
# unit tests!!
