require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "Users exist" do
    assert User
  end

  test "new user" do
    get "/users/new"
    assert_select "form"
  end

  test "new user can save" do
    post "/users", params: { user: { username: "Moose", email: "Moose@gooddogs.com", password: "chewytoy", password_confirmation: "chewytoy" } }

    assert_response :success
    moose = User.find_by(email: "Moose@gooddogs.com")
    assert moose.persisted?
  end

  test "new user failed" do
    post "/users", params: { user: { name: "Moose", email: "Moose@gooddogs.com", password: "chewytoy" } }
    assert_response :success
    assert_select "form"

  end
end
