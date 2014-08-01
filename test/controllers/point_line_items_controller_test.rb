require 'test_helper'

class PointLineItemsControllerTest < ActionController::TestCase
  setup do
    @point_line_item = point_line_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:point_line_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create point_line_item" do
    assert_difference('PointLineItem.count') do
      post :create, point_line_item: { points: @point_line_item.points, source: @point_line_item.source, user_id: @point_line_item.user_id }
    end

    assert_redirected_to point_line_item_path(assigns(:point_line_item))
  end

  test "should show point_line_item" do
    get :show, id: @point_line_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @point_line_item
    assert_response :success
  end

  test "should update point_line_item" do
    patch :update, id: @point_line_item, point_line_item: { points: @point_line_item.points, source: @point_line_item.source, user_id: @point_line_item.user_id }
    assert_redirected_to point_line_item_path(assigns(:point_line_item))
  end

  test "should destroy point_line_item" do
    assert_difference('PointLineItem.count', -1) do
      delete :destroy, id: @point_line_item
    end

    assert_redirected_to point_line_items_path
  end
end
