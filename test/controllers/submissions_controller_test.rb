require 'test_helper'

class SubmissionsControllerTest < ActionDispatch::IntegrationTest
  validates :title,  presence: true
  validates :link, presence: true

  test "can get list of submissions" do
    get "/submissions"
    assert_response :success
    assert_select "li a", "Russell Westbrook is the best"
  end


end
