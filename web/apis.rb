class App < Sinatra::Application
  set :show_exceptions, false
  set :raise_errors, false

  before { content_type :json }

  ## Events

  post '/events' do
    event = Event.create(params[:event])

    saved_resource_response(event)
  end

  patch '/events/:id' do
    event = Event.find(params[:id])
    event.update_attributes(params[:event])

    saved_resource_response(event)
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
    venue = Venue.create(params[:venue])
    saved_resource_response(venue)
  end

  ## System

  not_found do
    content_type :json
    basic_response(successful: false)
  end

  error 500...600 do
    content_type :json
    # binding.pry
    basic_response(successful: false, errors: ["Something wrong happened."])
  end

  private

  def basic_response(successful:, **info)
    { success: successful }.merge(info).to_json
  end

  def saved_resource_response(resource, **extra_info)
    if resource.invalid?
      response.status = 422
      resource_info   = { errors: resource.errors.to_a }
    end

    basic_response(successful: resource.valid?,
                   resource_id: resource.id,
                   **resource_info.to_h.merge(extra_info))
  end
end
