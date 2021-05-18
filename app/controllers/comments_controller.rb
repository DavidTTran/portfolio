class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order(created_at: :desc)
  end

  def create
    params = comment_params
    Comment.create(user_id: current_user.id, body: params[:body])
    redirect_to "/comments"
  end

  private

  def comment_params
    params.permit(:body)
  end
end
