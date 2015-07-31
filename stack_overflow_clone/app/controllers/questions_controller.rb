class QuestionsController < ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = 1
    tags = params[:tags].split(',')
    if @question.save
      tags.each do |tag|
        check_tag = Tag.find_by(name: tag)
        if check_tag
          @question.tags << check_tag
        else
          @question.tags << Tag.create(name: tag)
        end
      end
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    current_question_tags = @question.question_tags
    current_question_tags.destroy_all
    @question.assign_attributes(question_params)
    tags = params[:tags].split(',')
    if @question.save
      tags.each do |tag|
        check_tag = Tag.find_by(name: tag)
        if check_tag
          @question.tags << check_tag
        else
          @question.tags << Tag.create(name: tag)
        end
      end
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    Question.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def question_params
    params.require(:question).permit(:title, :body)
  end



end
