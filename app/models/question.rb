class Question < ApplicationRecord
  ############################# RESULT #########################
  belongs_to :user
  belongs_to :exercise
  has_many :answers, dependent: :destroy

  ############################# NESTED ATTRIBUTS #########################
  accepts_nested_attributes_for :answers

  ############################# VALIDATIONS #########################
  validates :title, :exercise_id, :user_id, presence: true
end
  