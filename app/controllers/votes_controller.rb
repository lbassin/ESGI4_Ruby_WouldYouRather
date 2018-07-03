class VotesController < ApplicationController

  def index
    ids = Question.where(enabled: true).ids

    if ids.count == 0
      @question = Question.new(label: 'Aucune question trouvée')
    else
      @question = Question.find_by_id(ids.sample(1))
    end
    @vote = Vote.new
  end

  def create
    vote = Vote.new(question_params)
    @result = Vote.where({question_id: params.require(:vote)[:question_id]}).group(:response).count
    @total = Vote.where({question_id: params.require(:vote)[:question_id]}).count

    respond_to do |format|
      if vote.save
        format.html { redirect_to '/' }
        format.json { render :json => { :response1 => @result[1], :response2 => @result[2], :total => @total }, :status => 200 }
      else
        format.html { redirect_to '/' }
        format.json { render :json => { :error => 'error' } }
      end
    end
  end

  private

  def question_params
    params.require(:vote).permit([:question_id, :response])
  end

end
