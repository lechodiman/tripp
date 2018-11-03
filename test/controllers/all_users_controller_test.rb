require 'test_helper'

class AllUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get all_users_show_url
    assert_response :success
  end

end
