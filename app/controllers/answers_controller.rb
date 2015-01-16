class AnswersController < ApplicationController

  def show
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def index
    @answers = Answer.all
  end

  def new
    @answer = Answer.new
  end

  def create
    question = Question.new(params[:question_id])
    question.answers.create(answers_params)
    redirect_to questions_path
    render 'new'
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  def destroy

    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to questions_path
  end

  def answers_params
    params.require(:answer).permit(:body)

  end

end