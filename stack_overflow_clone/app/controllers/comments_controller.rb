class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    if params[:commentable_type] == 'Question'
      @commentable = Question.find_by(id: params[:question_id])
    else
      @commentable = Answer.find_by(id: params[:answer_id])
    end

    @comment = @commentable.comments.build(comment_params)

  end

  private
  def comment_params
    params.require(:comment).permit(:body).merge(user_id: session[:user_id])
  end
end
