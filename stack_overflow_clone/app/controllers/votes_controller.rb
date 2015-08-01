class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    if params[:vote][:voteable_type] == 'Question'
      @voteable = Question.find_by(id: params[:vote][:voteable_id])
      @vote = @voteable.votes.create(vote_params)
      redirect_to question_path(@voteable)
    elsif params[:vote][:voteable_type] == 'Answer'
      @voteable = Answer.find_by(id: params[:vote][:voteable_id])
      @vote = @voteable.votes.create(vote_params)
      redirect_to question_path(@voteable.question)
    # else
    #   @voteable = Comment.find_by(id: params[:vote][:voteable_id])
    #   @vote = @voteable.votes.create(vote_params)
    #   if @voteable.voteable_type == 'Question'
    #     redirect_to question_path(Question.find(@voteable.voteable_id))
    #   else

    #   end
    end

  end

  private
  def comment_params
    params.require(:comment).permit(:value, :voteable_type, :voteable_id).merge(user_id: session[:user_id])
  end
end
