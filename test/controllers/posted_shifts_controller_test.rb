require 'test_helper'

class PostedShiftsControllerTest < ActionController::TestCase
  setup do
    @posted_shift = posted_shifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posted_shifts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posted_shift" do
    assert_difference('PostedShift.count') do
      post :create, posted_shift: { buyer_id: @posted_shift.buyer_id, date: @posted_shift.date, finish_time: @posted_shift.finish_time, position: @posted_shift.position, seller_id: @posted_shift.seller_id, start_time: @posted_shift.start_time, status: @posted_shift.status }
    end

    assert_redirected_to posted_shift_path(assigns(:posted_shift))
  end

  test "should show posted_shift" do
    get :show, id: @posted_shift
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posted_shift
    assert_response :success
  end

  test "should update posted_shift" do
    patch :update, id: @posted_shift, posted_shift: { buyer_id: @posted_shift.buyer_id, date: @posted_shift.date, finish_time: @posted_shift.finish_time, position: @posted_shift.position, seller_id: @posted_shift.seller_id, start_time: @posted_shift.start_time, status: @posted_shift.status }
    assert_redirected_to posted_shift_path(assigns(:posted_shift))
  end

  test "should destroy posted_shift" do
    assert_difference('PostedShift.count', -1) do
      delete :destroy, id: @posted_shift
    end

    assert_redirected_to posted_shifts_path
  end
end
