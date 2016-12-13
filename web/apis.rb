class App < Sinatra::Application
  set :show_exceptions, false
  set :raise_errors, false

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

  # Returns all future events in chronological order
  get '/events' do
    events = Event.starting_after(Time.now).ordered
    { events: events.map(&:attributes) }.to_json
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

  private

  def basic_response(successful:, **info)
    { success: successful }.merge(info).to_json
  end
end

# TODO: missing specs
# TODO: SECURITY?
# TODO: id assignment?
# TODO: RSPEC READS WELL (and comments)
# check requirements
# check readme
# TODO? manage specs?
# https://nickcharlton.net/posts/structuring-sinatra-applications.html
