class ResultsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, only: %i[ new ]

  # GET /results/new
  def new 
    @result = @exercise.build_result()
  end

  # POST /results or /results.json
  def create
    @result = Result.new(result_params.merge({user: current_user}))
    redirect_to course_path(@result.exercise.course) and return if @result.save
    render :new
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exercise
      @exercise = Exercise.friendly.find(params[:exercise_id])
    end

    # Only allow a list of trusted parameters through.
    def result_params
      params.require(:result).permit(:user_id, :exercise_id, answered_questions_attributes: [:answer_id, :question_id])
    end
end
