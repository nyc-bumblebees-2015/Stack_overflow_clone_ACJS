class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    if params[:comment][:commentable_type] == 'Question'
      @commentable = Question.find_by(id: params[:comment][:commentable_id])
      @comment = @commentable.comments.create(comment_params)
      request.xhr? ? render(partial: 'comment', layout: false, locals: {comment: @comment}) : redirect_to(@commentable)
    else
      @commentable = Answer.find_by(id: params[:comment][:commentable_id])
      @comment = @commentable.comments.create(comment_params)
      request.xhr? ? render(partial: 'comment', layout: false, locals: {comment: @comment}) : redirect_to(@commentable.question)
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:body, :commentable_type, :commentable_id).merge(user_id: session[:user_id])
  end
end
