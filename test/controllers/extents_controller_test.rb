require "test_helper"

class ExtentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get extents_new_url
    assert_response :success
  end

  test "should get create" do
    get extents_create_url
    assert_response :success
  end
end
