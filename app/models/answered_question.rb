class AnsweredQuestion < ApplicationRecord
  ############ RELATIONS ###################
  belongs_to :question
  belongs_to :answer, optional: true
  belongs_to :result
  
  ############ NESTED ATTRIBUTS ###################
  accepts_nested_attributes_for :answer
  accepts_nested_attributes_for :question
end
