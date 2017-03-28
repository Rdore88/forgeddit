class CommentsController < ApplicationController

  def index
    @submission = Submission.find(params["submission_id"].to_i)
    array_of_comments = @submission.comments
    @comments = array_of_comments.sort_by {|comment| comment.created_at}
    @comments.reverse!
  end

  def new
    @submission = Submission.find(params["submission_id"].to_i)
    @comment = @submission.comments.new #Comment.new(submission_id: @submission)
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    if @comment.save
      @submission = comment_params["submission_id"]
      redirect_to comments_url(submission_id: @submission)
    else
      render "new"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to comments_url(submission_id: @comment.submission_id)
  end

  private def comment_params
    params.require("comment").permit("username", "comment", "submission_id")
  end
end
