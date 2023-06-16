require 'csv'

class DashboardController < ApplicationController
  
  before_action :authenticate_user!, :student_unauthorized
  before_action :custom, except: %i[home]
  before_action :team_authorized, only: %i[index export course]
  
  def index
  end
  
  def home
    @LevelList = Level.all.ordered
    @MaterialList = Material.all.ordered
  end
  
  def student
  end

  
  def enseignant
  end
  
  def ambassador
  end
  
  
  def export
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=Export-#{Date.today}.csv"
        #render template: "path/to/export.csv.erb"
      end
    end
  end
  
  def course
    @course_items = Course.all
    respond_to do |format|
      format.csv do
        response.headers['Content-Type'] = 'text/csv'
        response.headers['Content-Disposition'] = "attachment; filename=Course_Export-#{Date.today}.csv"
        #render template: "path/to/export.csv.erb"
      end
    end
  end
  
  private

    def custom
      
     
      @subcription_list = @student_list.user_plan
    end

    ## COURSE'S LIST
    def courses
      @course = Course.all.ordered
    end

    ## ARTICLE'S LIST
    def articles
      @articles = Article.all.ordered
    end
    ## ARTICLES FOR AMBASSADOR
    def ambassador_articles
      @ambassador_articles = @articles.ambassador_article
    end 

    ## STUDENT'S LIST
    def students
      @student = User.student_sign_up.ordered
    end

    ## STUDENT'S PAID
    def student_paid
      @students_paid = @student.user_plan.ordered
    end

    ## STUDENT'S PAID REFERRAL
    def student_paid
      @students_paid = @student.referral_code.ordered
    end
    ## TEACHER'S LIST
    def teacher
      @teacher = User.teacher_sign_up.ordered
    end

    ## AMBASSADOR'S LIST
    def ambassadors
      @student = User.ambassador_sign_up.ordered
    end

    ## STUDENT'S REFERRAL BY AMBASSADOR
    def referral_counted
      @count_student_referral = @student.referral_code
    end

    ## STUDENT'S UNAUTHORIZED
    def student_unauthorized
      redirect_to root_path if current_user.user_role == "Student"
    end
    
    ## TEAM'S UNAUTHORIZED
    def team_authorized
      redirect_to root_path if current_user.user_role != "Team"
    end
    ## AMBASSADOR'S UNAUTHORIZED
    def ambassador_authorized
      redirect_to root_path if current_user.user_role != "Ambassador"
    end
end
