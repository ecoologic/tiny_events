# Tiny Events

A small API to handle events.

Install:
========

    bundle
    bundle exec rake db:setup
    bundle exec rspec # To run the test suite
    bundle exec rackup
    curl http://localhost:9292/events # or any other route

Routes:
=======

See `web/apis.rb` and `spec/integration/**`, here are some usage examples:

    POST /events
      { event: { name: 'x', description: 'x', cancelled: 'x', starts_at: 'x', ends_at: 'x' } }
    Response:
      { success: true }

    PATCH /events/1
      { event: { starts_at: '2016-12-13 17:39:57 +1000' } }
    Response:
      { success: true }

    POST /venues
      { venue: { name: 'x', address_info: 'x', latitude: '11', longitude: '22' } }
    Response example:
      { success: false, errors: ["Longitude can't be blank"] }

    GET /events
    Response example:
      { events: [{ id: 1, etc: 'etc' }] }

    GET /events/1
    Response example:
      { event: { id: 'etc' }, venue: { id: 'etc'} }

Implementation Notes:
=====================

A few more gems could be added, like FactoryGirl or DatabaseCleaner. Also, there isn't a test specific environment.  The routes are not divided into controllers, but for the size of the app I think this is acceptable.

Given the requirements I thought it was more interesting to focus on a "nicer API".  For example providing error info when the resource fails to save and handling JSON for the most common error responses, just a few of the good practices too often lots of APIs forget.

Requirements:
=============
- Provide an API that accepts and responds with JSON
- Authentication and authorisation are not required
- Built using Ruby WITHOUT Rails (ActiveRecord is OK)
- Persistence via a SQLite DB
- Unit and Integration tests
- Git as VCS

Features:
=========
  As an Event Organiser
  I want to add an event
  So that delegates will know what my event is

  As an Event Organiser
  I want to add a venue to my event
  So that delegates will know where my event is

  As an Event Organiser
  I want to update an event
  So that delegates can have up to date information

  As an App User
  I want to be able to see a list of events
  So that I can choose an event to get more information for

  As an App User
  I want to be able to see event and venue information
  So that I can decide whether this is an event I want to attend


Data:
=====

Venue
- Name
- Address Info
- Geo Point

Event
- Name
- Description
- Cancelled?
- Start Date and Time
- End Date and Time

Venue has many Events
