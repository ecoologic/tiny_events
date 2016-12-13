before { content_type :json }

## Events

post '/events' do
  Event.create(params[:event])

  basic_response(successful: true)
end

patch '/events/:id' do
  event = Event.find(params[:id])
  event.update_attributes(params[:event])

  basic_response(successful: true)
end

get '/events' do
  Event.all.to_json
end

get '/events/:id' do
  event = Event.find(params[:id])

  { event: event.attributes, venue: event.venue.attributes }.to_json
end

## Venues

post '/venues' do
  Venue.create(params[:event])

  basic_response(successful: true)
end

## System

not_found do
  content_type :json
  basic_response(successful: false)
end

error 500...600 do
  content_type :json
  # binding.pry
  # basic_response(successful: false, error: $ERROR_INFO.message, location: $ERROR_INFO.backtrace[0])
  basic_response(successful: false, error: "Something wrong happened.")
end

def basic_response(successful:, **info)
  { success: successful }.merge(info).to_json
end

# FIXME: all fixme
# TODO: missing specs
# TODO: SECURITY?
# TODO: class MyApp < Sinatra::Base
# check requirements
# TODO: id assignment?
# TODO: RSPEC READS WELL (and comments)
# unit tests!!
# check readme
# TODO? manage specs?
# todo: unit specs?
