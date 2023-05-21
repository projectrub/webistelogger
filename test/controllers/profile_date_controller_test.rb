require "test_helper"

class ProfileDateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_date_index_url
    assert_response :success
  end
end
