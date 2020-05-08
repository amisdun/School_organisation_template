require 'test_helper'

class Api::V1::UserSignupControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get api_v1_user_signup_create_url
    assert_response :success
  end

end
