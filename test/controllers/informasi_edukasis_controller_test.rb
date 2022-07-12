require "test_helper"

class InformasiEdukasisControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get informasi_edukasis_index_url
    assert_response :success
  end

  test "should get show" do
    get informasi_edukasis_show_url
    assert_response :success
  end

  test "should get create" do
    get informasi_edukasis_create_url
    assert_response :success
  end

  test "should get update" do
    get informasi_edukasis_update_url
    assert_response :success
  end

  test "should get destroy" do
    get informasi_edukasis_destroy_url
    assert_response :success
  end
end
