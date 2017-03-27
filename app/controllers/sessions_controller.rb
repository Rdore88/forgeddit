class SessionsController < ApplicationController

  def new
    @session = Session.new
  end

  def create
    user = User.all.where(email: session_params["email"]).first
    Session.create(email: user.email, user_id: user.id)
    redirect_to submissions_url(user_id: user.id)
  end

  def destroy
    session = Session.where(user_id: params["id"]).first
    session.user_id = nil
    session.email = nil
    redirect_to "/submissions"

  end

  private def session_params
    params.require("session").permit("email")
  end

end
