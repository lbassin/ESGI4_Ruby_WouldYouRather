class Response < ApplicationRecord
  has_one :question
  has_many :votes
end