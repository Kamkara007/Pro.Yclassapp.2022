class Exercise < ApplicationRecord
  #############  RELATIONS ##############
  belongs_to :user
  belongs_to :course
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy

  #############  SLUGGED ##############
  include ItemsSlugged

  
  #############  VALIDATIONS ##############
  validates :title, presence: { message: "Le titre est obligatoire" }
  validates :user_id, presence: { message: "L'exercice doit etre associer obligatoirement a une personne" }
  validates :course_id, presence: { message: "L'exercice doit etre associer obligatoirement a une leçon" }
  
  
  ########### FIND EXERCISE COMPLETED BY USER #########
  def completed_by(user)
    results.any? {|result| result.user == user}
  end
  
  
  ############ BUILD USER GRADE ###################
  def user_grade(user)
    results.where(user_id: user).last.grade()
  end

  ############ BUILD RESULT ###################
  def build_result
    result = self.results.build()
    self.questions.each {|exercise| result.answered_questions.build(question: exercise)}
    return result
  end
  
end
