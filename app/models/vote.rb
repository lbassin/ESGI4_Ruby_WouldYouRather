class Vote < ApplicationRecord
  belongs_to :question, optional: false

end