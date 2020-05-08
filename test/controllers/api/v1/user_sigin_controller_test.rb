require 'test_helper'

class Api::V1::UserSiginControllerTest < ActionDispatch::IntegrationTest
  test "should get sigin" do
    get api_v1_user_sigin_sigin_url
    assert_response :success
  end

end
