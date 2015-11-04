require 'test_helper'

class LineStringsControllerTest < ActionController::TestCase
  setup do
    @line_string = line_strings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_strings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_string" do
    assert_difference('LineString.count') do
      post :create, line_string: { coordinates: @line_string.coordinates, name: @line_string.name }
    end

    assert_redirected_to line_string_path(assigns(:line_string))
  end

  test "should show line_string" do
    get :show, id: @line_string
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_string
    assert_response :success
  end

  test "should update line_string" do
    patch :update, id: @line_string, line_string: { coordinates: @line_string.coordinates, name: @line_string.name }
    assert_redirected_to line_string_path(assigns(:line_string))
  end

  test "should destroy line_string" do
    assert_difference('LineString.count', -1) do
      delete :destroy, id: @line_string
    end

    assert_redirected_to line_strings_path
  end
end
