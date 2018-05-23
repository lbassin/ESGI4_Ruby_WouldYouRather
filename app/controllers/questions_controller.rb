class QuestionsController < ActionController::Base

  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def show
    @question = Question.find(params[:id])

    @vote = Vote.find_by(question_id: params[:id])
    if @vote.nil?
      @vote = Vote.new
    end
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit([:label, :response_one, :response_two])
  end

end
