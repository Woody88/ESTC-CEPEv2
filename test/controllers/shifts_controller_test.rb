require 'test_helper'

class ShiftsControllerTest < ActionController::TestCase
  setup do
    @shift = shifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:shifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create shift" do
    assert_difference('Shift.count') do
      post :create, shift: { current_owner: @shift.current_owner, date: @shift.date, finish_time: @shift.finish_time, original_owner: @shift.original_owner, position: @shift.position, shift_id: @shift.shift_id, shift_posted: @shift.shift_posted, start_stime: @shift.start_stime }
    end

    assert_redirected_to shift_path(assigns(:shift))
  end

  test "should show shift" do
    get :show, id: @shift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @shift
    assert_response :success
  end

  test "should update shift" do
    patch :update, id: @shift, shift: { current_owner: @shift.current_owner, date: @shift.date, finish_time: @shift.finish_time, original_owner: @shift.original_owner, position: @shift.position, shift_id: @shift.shift_id, shift_posted: @shift.shift_posted, start_stime: @shift.start_stime }
    assert_redirected_to shift_path(assigns(:shift))
  end

  test "should destroy shift" do
    assert_difference('Shift.count', -1) do
      delete :destroy, id: @shift
    end

    assert_redirected_to shifts_path
  end
end
