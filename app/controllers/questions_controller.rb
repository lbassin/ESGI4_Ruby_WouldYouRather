class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
    2.times { @question.responses.build }
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    puts question_params
    if @question.update(question_params)
      redirect_to @question
    else
      render 'edit'
    end
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy

    redirect_to questions_url
  end

  private

  def question_params
    params.require(:question).permit([:label, responses_attributes: [:id, :label]])
  end

end
