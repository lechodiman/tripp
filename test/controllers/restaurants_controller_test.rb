require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index,show,view" do
    get restaurants_index,show,view_url
    assert_response :success
  end

end
