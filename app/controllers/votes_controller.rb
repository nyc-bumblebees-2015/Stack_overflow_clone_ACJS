class VotesController < ApplicationController
  def new
    @vote = Vote.new
  end

  def create
    if params[:vote][:voteable_type] == 'Question'
      @voteable = Question.find_by(id: params[:vote][:voteable_id])
      @vote = @voteable.votes.build(vote_params)
      if @vote.can_vote? && @vote.save && request.xhr?
        render json: {data: @voteable.vote_count}.to_json
      else
        flash[:notice] = "You can only vote once per question."
        redirect_to question_path(@voteable)
      end
      # redirect_to question_path(@voteable)
    elsif params[:vote][:voteable_type] == 'Answer'
      @voteable = Answer.find_by(id: params[:vote][:voteable_id])
      @vote = @voteable.votes.build(vote_params)
      if @vote.can_vote? && @vote.save && request.xhr?
        render json: {data: @voteable.vote_count, answer_id: @voteable.id}.to_json
        # redirect_to question_path(@voteable.question)
      else
        flash[:notice] = "You can only vote once per answer."
        redirect_to question_path(@voteable.question)
      end
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
  def vote_params
    params.require(:vote).permit(:value, :voteable_type, :voteable_id).merge(user_id: session[:user_id])
  end
end
