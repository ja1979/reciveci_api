require 'test_helper'

class RecyclingWaysControllerTest < ActionController::TestCase
  setup do
    @recycling_way = recycling_ways(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recycling_ways)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recycling_way" do
    assert_difference('RecyclingWay.count') do
      post :create, recycling_way: { description: @recycling_way.description, subcategory_id: @recycling_way.subcategory_id, title: @recycling_way.title }
    end

    assert_redirected_to recycling_way_path(assigns(:recycling_way))
  end

  test "should show recycling_way" do
    get :show, id: @recycling_way
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recycling_way
    assert_response :success
  end

  test "should update recycling_way" do
    patch :update, id: @recycling_way, recycling_way: { description: @recycling_way.description, subcategory_id: @recycling_way.subcategory_id, title: @recycling_way.title }
    assert_redirected_to recycling_way_path(assigns(:recycling_way))
  end

  test "should destroy recycling_way" do
    assert_difference('RecyclingWay.count', -1) do
      delete :destroy, id: @recycling_way
    end

    assert_redirected_to recycling_ways_path
  end
end
