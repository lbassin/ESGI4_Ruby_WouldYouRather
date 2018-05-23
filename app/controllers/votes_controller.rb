class VotesController < ApplicationController

  def index
    id = Question.ids.sample(1)
    @question = Question.find_by_id(id)
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
