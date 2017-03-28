class SubmissionsController < ApplicationController

  def index
    if current_user
        @user = current_user
    end
    @submissions = Submission.all
  end

  def new
    @user = current_user
    @submission = @user.submissions.new
  end

  def create
    @submission = Submission.new(submission_params)
    @submission.user = current_user
      if @submission.save
        redirect_to submissions_url
      else
        session[:error] = "Submission Not Posted"
        render "new"
      end
  end

  def destroy
    @submission = Submission.find(params[:id])
    @submission.destroy
    redirect_to "/submissions"
  end

  private def submission_params
    params.require("submission").permit("title", "link", "pic_url", "user_id")
  end
end
