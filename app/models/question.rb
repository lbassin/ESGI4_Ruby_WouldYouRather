class Question < ApplicationRecord
  has_many :responses
  has_many :votes
  accepts_nested_attributes_for :responses
end