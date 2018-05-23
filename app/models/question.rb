class Question < ApplicationRecord
  has_many :votes
  has_many :responses
end