class QuestionsController < ApplicationController
  include UsersHelper
  before_action :require_login, :except => [:create, :new]

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])

    @totalVotes = 0
    @question.responses.each do |response|
      @totalVotes += response.votes.count
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save

      if session[:user_id]
        redirect_to questions_url, notice: 'Question was submited and should be enabled.'
      else
        redirect_to new_question_url, notice: 'Question was submited and will be check soon.'
      end
    else
      render 'new'
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
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
    params.require(:question).permit([:label, :enabled, responses_attributes: [:id, :label]])
  end
end
