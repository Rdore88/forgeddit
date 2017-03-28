require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  
  setup do
    post sessions_path, params: { email: users(:one).email, password: "123" }
  end

  test "Comments exist" do
    assert Comment
  end


end
