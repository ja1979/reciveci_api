require 'test_helper'

class RecyclingWayImagesControllerTest < ActionController::TestCase
  setup do
    @recycling_way_image = recycling_way_images(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recycling_way_images)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recycling_way_image" do
    assert_difference('RecyclingWayImage.count') do
      post :create, recycling_way_image: { recyclingWay_id: @recycling_way_image.recyclingWay_id, title: @recycling_way_image.title, url: @recycling_way_image.url }
    end

    assert_redirected_to recycling_way_image_path(assigns(:recycling_way_image))
  end

  test "should show recycling_way_image" do
    get :show, id: @recycling_way_image
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recycling_way_image
    assert_response :success
  end

  test "should update recycling_way_image" do
    patch :update, id: @recycling_way_image, recycling_way_image: { recyclingWay_id: @recycling_way_image.recyclingWay_id, title: @recycling_way_image.title, url: @recycling_way_image.url }
    assert_redirected_to recycling_way_image_path(assigns(:recycling_way_image))
  end

  test "should destroy recycling_way_image" do
    assert_difference('RecyclingWayImage.count', -1) do
      delete :destroy, id: @recycling_way_image
    end

    assert_redirected_to recycling_way_images_path
  end
end
