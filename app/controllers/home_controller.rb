class HomeController < ActionController::Base

  def index
    question_count = Question.count + 1
    id = rand(1...question_count)
    @question = Question.find(id)
  end

end
