class Question < ApplicationRecord
  has_many :vote
  has_many :response
end