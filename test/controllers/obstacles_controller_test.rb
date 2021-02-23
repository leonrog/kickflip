require 'test_helper'

class ObstaclesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get obstacles_index_url
    assert_response :success
  end

  test "should get new" do
    get obstacles_new_url
    assert_response :success
  end

  test "should get update" do
    get obstacles_update_url
    assert_response :success
  end

  test "should get create" do
    get obstacles_create_url
    assert_response :success
  end

  test "should get show" do
    get obstacles_show_url
    assert_response :success
  end

  test "should get edit" do
    get obstacles_edit_url
    assert_response :success
  end

  test "should get delete" do
    get obstacles_delete_url
    assert_response :success
  end

end
