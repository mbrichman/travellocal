require 'test_helper'

class RecommendationsControllerTest < ActionController::TestCase
  setup do
    @recommendation = recommendations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recommendations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recommendation" do
    assert_difference('Recommendation.count') do
      post :create, recommendation: { place_id: @recommendation.place_id, rr_id: @recommendation.rr_id, user_id: @recommendation.user_id }
    end

    assert_redirected_to recommendation_path(assigns(:recommendation))
  end

  test "should show recommendation" do
    get :show, id: @recommendation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recommendation
    assert_response :success
  end

  test "should update recommendation" do
    put :update, id: @recommendation, recommendation: { place_id: @recommendation.place_id, rr_id: @recommendation.rr_id, user_id: @recommendation.user_id }
    assert_redirected_to recommendation_path(assigns(:recommendation))
  end

  test "should destroy recommendation" do
    assert_difference('Recommendation.count', -1) do
      delete :destroy, id: @recommendation
    end

    assert_redirected_to recommendations_path
  end
end