class SubmissionsController < ApplicationController

  def index
    if params["user_id"]
        @user = User.find(params["user_id"])
    end
    @submissions = Submission.all
  end

  def new
    user_id = params["user_id"]
    @user = User.find(user_id)
    @submission = @user.submissions.new
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to submissions_url(user_id: params["submission"]["user_id"])
    else
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
