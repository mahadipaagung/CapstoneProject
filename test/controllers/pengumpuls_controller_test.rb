require "test_helper"

class PengumpulsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pengumpul = pengumpuls(:one)
  end

  test "should get index" do
    get pengumpuls_url, as: :json
    assert_response :success
  end

  test "should create pengumpul" do
    assert_difference("Pengumpul.count") do
      post pengumpuls_url, params: { pengumpul: { email: @pengumpul.email, nama: @pengumpul.nama, password_digest: @pengumpul.password_digest } }, as: :json
    end

    assert_response :created
  end

  test "should show pengumpul" do
    get pengumpul_url(@pengumpul), as: :json
    assert_response :success
  end

  test "should update pengumpul" do
    patch pengumpul_url(@pengumpul), params: { pengumpul: { email: @pengumpul.email, nama: @pengumpul.nama, password_digest: @pengumpul.password_digest } }, as: :json
    assert_response :success
  end

  test "should destroy pengumpul" do
    assert_difference("Pengumpul.count", -1) do
      delete pengumpul_url(@pengumpul), as: :json
    end

    assert_response :no_content
  end
end
