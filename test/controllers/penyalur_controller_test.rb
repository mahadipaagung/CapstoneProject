require "test_helper"

class PenyalurControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get penyalur_new_url
    assert_response :success
  end

  test "should get create" do
    get penyalur_create_url
    assert_response :success
  end
end
