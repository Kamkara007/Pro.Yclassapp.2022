class AnsweredQuestion < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :result
end
