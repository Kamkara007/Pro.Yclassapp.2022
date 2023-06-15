class Answer < ApplicationRecord
  belongs_to :question

  validates :content, presence:{message:""}
end
