require "test_helper"

class PenyalursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @penyalur = penyalurs(:one)
  end

  test "should get index" do
    get penyalurs_url, as: :json
    assert_response :success
  end

  test "should create penyalur" do
    assert_difference("Penyalur.count") do
      post penyalurs_url, params: { penyalur: {  } }, as: :json
    end

    assert_response :created
  end

  test "should show penyalur" do
    get penyalur_url(@penyalur), as: :json
    assert_response :success
  end

  test "should update penyalur" do
    patch penyalur_url(@penyalur), params: { penyalur: {  } }, as: :json
    assert_response :success
  end

  test "should destroy penyalur" do
    assert_difference("Penyalur.count", -1) do
      delete penyalur_url(@penyalur), as: :json
    end

    assert_response :no_content
  end
end
