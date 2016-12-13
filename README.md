# Tiny Events

A small API to handle events.

## Install

    bundle
    bundle exec rake db:setup
    bundle exec rspec # To run the test suite
    bundle exec rackup
    curl http://localhost:9292/events # or any other route

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
