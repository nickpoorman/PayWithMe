require 'test_helper'

class FundsControllerTest < ActionController::TestCase
  setup do
    @fund = funds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:funds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fund" do
    assert_difference('Fund.count') do
      post :create, fund: @fund.attributes
    end

    assert_redirected_to fund_path(assigns(:fund))
  end

  test "should show fund" do
    get :show, id: @fund.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @fund.to_param
    assert_response :success
  end

  test "should update fund" do
    put :update, id: @fund.to_param, fund: @fund.attributes
    assert_redirected_to fund_path(assigns(:fund))
  end

  test "should destroy fund" do
    assert_difference('Fund.count', -1) do
      delete :destroy, id: @fund.to_param
    end

    assert_redirected_to funds_path
  end
end
