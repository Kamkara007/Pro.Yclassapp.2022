class Answer < ApplicationRecord
  ############ RELATIONS #########
  belongs_to :question

  
  ############ VALIDATION #########
  validates :title,  presence: { message: "La Question est obligatoire" }
  #validates :correct,  presence: true
  validates_inclusion_of :correct, in: %w( false true ), on: :create, message: "extension %s is not included in the list"
  
end
