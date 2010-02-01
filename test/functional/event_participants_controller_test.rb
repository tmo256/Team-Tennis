require 'test_helper'

class EventParticipantsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_participants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_participant" do
    assert_difference('EventParticipant.count') do
      post :create, :event_participant => { }
    end

    assert_redirected_to event_participant_path(assigns(:event_participant))
  end

  test "should show event_participant" do
    get :show, :id => event_participants(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => event_participants(:one).to_param
    assert_response :success
  end

  test "should update event_participant" do
    put :update, :id => event_participants(:one).to_param, :event_participant => { }
    assert_redirected_to event_participant_path(assigns(:event_participant))
  end

  test "should destroy event_participant" do
    assert_difference('EventParticipant.count', -1) do
      delete :destroy, :id => event_participants(:one).to_param
    end

    assert_redirected_to event_participants_path
  end
end
