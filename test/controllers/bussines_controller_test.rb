require 'test_helper'

class BussinesControllerTest < ActionController::TestCase
  setup do
    @bussine = bussines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bussines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bussine" do
    assert_difference('Bussine.count') do
      post :create, bussine: { address: @bussine.address, latitude: @bussine.latitude, longitude: @bussine.longitude, name: @bussine.name }
    end

    assert_redirected_to bussine_path(assigns(:bussine))
  end

  test "should show bussine" do
    get :show, id: @bussine
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bussine
    assert_response :success
  end

  test "should update bussine" do
    patch :update, id: @bussine, bussine: { address: @bussine.address, latitude: @bussine.latitude, longitude: @bussine.longitude, name: @bussine.name }
    assert_redirected_to bussine_path(assigns(:bussine))
  end

  test "should destroy bussine" do
    assert_difference('Bussine.count', -1) do
      delete :destroy, id: @bussine
    end

    assert_redirected_to bussines_path
  end
end
