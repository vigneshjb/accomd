require 'test_helper'

class AccomadationsControllerTest < ActionController::TestCase
  setup do
    @accomadation = accomadations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:accomadations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create accomadation" do
    assert_difference('Accomadation.count') do
      post :create, accomadation: { isBooked: @accomadation.isBooked, location: @accomadation.location, user_id: @accomadation.user_id }
    end

    assert_redirected_to accomadation_path(assigns(:accomadation))
  end

  test "should show accomadation" do
    get :show, id: @accomadation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @accomadation
    assert_response :success
  end

  test "should update accomadation" do
    put :update, id: @accomadation, accomadation: { isBooked: @accomadation.isBooked, location: @accomadation.location, user_id: @accomadation.user_id }
    assert_redirected_to accomadation_path(assigns(:accomadation))
  end

  test "should destroy accomadation" do
    assert_difference('Accomadation.count', -1) do
      delete :destroy, id: @accomadation
    end

    assert_redirected_to accomadations_path
  end
end
