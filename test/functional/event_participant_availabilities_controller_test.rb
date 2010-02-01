require 'test_helper'

class EventParticipantAvailabilitiesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_participant_availabilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_participant_availability" do
    assert_difference('EventParticipantAvailability.count') do
      post :create, :event_participant_availability => { }
    end

    assert_redirected_to event_participant_availability_path(assigns(:event_participant_availability))
  end

  test "should show event_participant_availability" do
    get :show, :id => event_participant_availabilities(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => event_participant_availabilities(:one).to_param
    assert_response :success
  end

  test "should update event_participant_availability" do
    put :update, :id => event_participant_availabilities(:one).to_param, :event_participant_availability => { }
    assert_redirected_to event_participant_availability_path(assigns(:event_participant_availability))
  end

  test "should destroy event_participant_availability" do
    assert_difference('EventParticipantAvailability.count', -1) do
      delete :destroy, :id => event_participant_availabilities(:one).to_param
    end

    assert_redirected_to event_participant_availabilities_path
  end
end
