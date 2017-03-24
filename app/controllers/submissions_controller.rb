class SubmissionsController < ApplicationController

  def index
    @submissions = Submission.all
  end

  def new
    @submission = Submission.new
  end

  def create
    @submission = Submission.new(submission_params)
    if @submission.save
      redirect_to "/submissions"
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
    params.require("submission").permit("title", "link", "pic_url")
  end
end