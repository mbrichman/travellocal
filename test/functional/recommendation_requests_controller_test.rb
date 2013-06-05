require 'test_helper'

class RecommendationRequestsControllerTest < ActionController::TestCase
  setup do
    @recommendation_request = recommendation_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommendation_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommendation_request" do
    assert_difference('RecommendationRequest.count') do
      post :create, recommendation_request: { city_id: @recommendation_request.city_id, description: @recommendation_request.description, user_id: @recommendation_request.user_id }
    end

    assert_redirected_to recommendation_request_path(assigns(:recommendation_request))
  end

  test "should show recommendation_request" do
    get :show, id: @recommendation_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommendation_request
    assert_response :success
  end

  test "should update recommendation_request" do
    put :update, id: @recommendation_request, recommendation_request: { city_id: @recommendation_request.city_id, description: @recommendation_request.description, user_id: @recommendation_request.user_id }
    assert_redirected_to recommendation_request_path(assigns(:recommendation_request))
  end

  test "should destroy recommendation_request" do
    assert_difference('RecommendationRequest.count', -1) do
      delete :destroy, id: @recommendation_request
    end

    assert_redirected_to recommendation_requests_path
  end
end
