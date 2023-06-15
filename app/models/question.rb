class Question < ApplicationRecord
  belongs_to :exercise

  accepts_nested_attributes_for :answers, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
