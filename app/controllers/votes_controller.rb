class VotesController < ApplicationController

  def index
    ids = Question.ids
    if ids.count == 0
      @question = Question.new
    else
      @question = Question.find_by_id(ids.sample(1))
    end
    @vote = Vote.new
  end

  def create
    vote = Vote.new(question_params)
    if vote.save
      # Render json response
    else
      redirect_to '/'
    end
  end

  private

  def question_params
    params.require(:vote).permit([:question_id, :response])
  end

end
