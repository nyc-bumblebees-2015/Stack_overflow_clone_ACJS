class AnswersController < ApplicationController
  def new
    @answer = Answer.new
  end

  def create
    answer = Answer.new(answer_params)
    if answer.save
      question = Question.find_by(id: answer.question_id)
      redirect_to question_path(question)
    else
      flash.now[:error] = answer.errors.full_messages
      render :new
    end
  end

  def edit
    @answer = Answer.find_by(id: params[:id])
  end

  def update
    @answer = Answer.find_by(id: params[:id])
    @answer.update(answer_params)
    question = Question.find_by(id: answer.question_id)
    redirect_to question_path(question)
  end

  private
  def answer_params
    params.require(:answer).permit(:body, :question_id).merge(user_id: session[:user_id])
  end
end
