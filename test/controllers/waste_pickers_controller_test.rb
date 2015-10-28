require 'test_helper'

class WastePickersControllerTest < ActionController::TestCase
  setup do
    @waste_picker = waste_pickers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:waste_pickers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create waste_picker" do
    assert_difference('WastePicker.count') do
      post :create, waste_picker: { background: @waste_picker.background, birth_date: @waste_picker.birth_date, message: @waste_picker.message, name: @waste_picker.name, start_date: @waste_picker.start_date }
    end

    assert_redirected_to waste_picker_path(assigns(:waste_picker))
  end

  test "should show waste_picker" do
    get :show, id: @waste_picker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @waste_picker
    assert_response :success
  end

  test "should update waste_picker" do
    patch :update, id: @waste_picker, waste_picker: { background: @waste_picker.background, birth_date: @waste_picker.birth_date, message: @waste_picker.message, name: @waste_picker.name, start_date: @waste_picker.start_date }
    assert_redirected_to waste_picker_path(assigns(:waste_picker))
  end

  test "should destroy waste_picker" do
    assert_difference('WastePicker.count', -1) do
      delete :destroy, id: @waste_picker
    end

    assert_redirected_to waste_pickers_path
  end
end
