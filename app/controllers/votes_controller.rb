class VotesController < ActionController::Base

  def index
    render 'home/index'
  end

  def update
    vote = Vote.find_by(question_id: params[:question_id])
    unless vote
      vote = Vote.new(question_id: params[:question_id], response_one: 0, response_two: 0, response_total: 0)
    end

    if params[:response_id] == "1"
      vote.response_one += 1
    else
      vote.response_two += 1
    end
    vote.response_total += 1
    vote.save

    redirect_to '/'
  end

end
