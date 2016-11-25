require 'test_helper'

# Events_controller_test.rb
class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end
  test "should get index" do
    get events_url
    assert_response :success
  end
  
  test "should get new" do 
    get new_event_url
    assert_response :success
  end
  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end
end