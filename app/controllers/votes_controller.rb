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
    Vote.new(question_params).save!

    @question = Question.find(params.require(:vote)[:question_id])
    @results = Array.new()
    @total = 0

    @question.responses.each do |response|
      @count = response.votes.count
      @results.push @count
      @total += @count
    end

    respond_to do |format|
      format.html {redirect_to '/'}
      format.json {render :json => {:results => @results, :total => @total}, :status => 200}
    end
  end

  private

  def question_params
    params.require(:vote).permit([:response_id])
  end

end
