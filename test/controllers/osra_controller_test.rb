require 'test_helper'

class OsraControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get osra_index_url
    assert_response :success
  end

  test "should get update" do
    get osra_update_url
    assert_response :success
  end

  test "should get destroy" do
    get osra_destroy_url
    assert_response :success
  end

end
