class SessionsController < ApplicationController

  def new
    if current_user
      redirect_to submissions_path
    else
      render "new"
    end
  end

  def create
    @user = User.find_by(email: params["email"])
    if @user && @user.password == params[:password]
      session[:current_user_id] = @user.id
      redirect_to submissions_url
    else
      flash[:error] = "Please make sure you have created a profile"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to submissions_url
  end

  private def session_params
    params.require("session").permit(:email)
  end

end
