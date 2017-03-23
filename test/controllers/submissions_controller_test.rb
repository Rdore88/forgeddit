require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest

  test "can get list of submissions" do
    get "/submissions"
    assert_response :success
  end
end
