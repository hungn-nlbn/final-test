require 'test_helper'

class CartegoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cartegory = cartegories(:one)
  end

  test "should get index" do
    get cartegories_url
    assert_response :success
  end

  test "should get new" do
    get new_cartegory_url
    assert_response :success
  end

  test "should create cartegory" do
    assert_difference('Cartegory.count') do
      post cartegories_url, params: { cartegory: { name: @cartegory.name, parent_id: @cartegory.parent_id } }
    end

    assert_redirected_to cartegory_url(Cartegory.last)
  end

  test "should show cartegory" do
    get cartegory_url(@cartegory)
    assert_response :success
  end

  test "should get edit" do
    get edit_cartegory_url(@cartegory)
    assert_response :success
  end

  test "should update cartegory" do
    patch cartegory_url(@cartegory), params: { cartegory: { name: @cartegory.name, parent_id: @cartegory.parent_id } }
    assert_redirected_to cartegory_url(@cartegory)
  end

  test "should destroy cartegory" do
    assert_difference('Cartegory.count', -1) do
      delete cartegory_url(@cartegory)
    end

    assert_redirected_to cartegories_url
  end
end
