class Question < ApplicationRecord
  has_many :responses
  has_many :votes
  accepts_nested_attributes_for :responses

  def initialize(*params)
    super(*params)

    unless self.responses.length > 0
      2.times {self.responses.build}
    end
  end

end