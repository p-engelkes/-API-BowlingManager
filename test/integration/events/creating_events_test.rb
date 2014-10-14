require 'test_helper'

class CreatingEventsTest < ActionDispatch::IntegrationTest
  setup { @club = Club.create(name: 'Glühwürmchen') }

  test 'creates new event with valid data' do
    post '/events',
         { kegeln: {
             name: 'Kegeln',
             club_id: @club.id,
             date: DateTime.new(2014, 4, 4)
         }}.to_json,
         {
             'Accept' => 'application/json',
             'Content-Type' => 'application/json'
         }

    assert_equal 201, response.status
    assert_equal Mime::JSON, response.content_type
    event = json(response.body)
    assert_equal event_url(event[:id]), response.location
  end

  test 'does not create event with invalid data' do
    post '/events',
         { kegeln: {
             name: 'Kegeln',
             club_id: nil,
             date: DateTime.new(2014, 4, 4)
         }}.to_json,
         {
             'Accept' => 'application/json',
             'Content-Type' => 'application/json'
         }

    assert_equal 422, response.status
  end
end