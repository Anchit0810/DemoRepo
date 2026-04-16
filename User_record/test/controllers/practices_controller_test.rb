require "test_helper"

class PracticesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @practice = practices(:one)
  end

  test "should get index" do
    get practices_url, as: :json
    assert_response :success
  end

  test "should create practice" do
    assert_difference("Practice.count") do
      post practices_url, params: { practice: { email: @practice.email, name: @practice.name } }, as: :json
    end

    assert_response :created
  end

  test "should show practice" do
    get practice_url(@practice), as: :json
    assert_response :success
  end

  test "should update practice" do
    patch practice_url(@practice), params: { practice: { email: @practice.email, name: @practice.name } }, as: :json
    assert_response :success
  end

  test "should destroy practice" do
    assert_difference("Practice.count", -1) do
      delete practice_url(@practice), as: :json
    end

    assert_response :no_content
  end
end
