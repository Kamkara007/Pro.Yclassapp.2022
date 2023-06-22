require 'csv'

class DashboardController < ApplicationController
  
  before_action :authenticate_user!
  before_action :courses, :articles, :ambassador_articles, :referral_counted,
                :students, :students_paid, :teachers, :ambassadors

  before_action :student_unauthorized #unauthorized student to visite dashboard
  before_action :ambassador_unauthorized, except: %i[ambassador] #authorized Ambassador to visite dashboard#mabassador
  before_action :teacher_unauthorized, except: %i[enseignant] #authorized Teacher to visite dashboard#enseignant
  
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

    ## COURSE'S LIST
    def courses
      @courses = Course.all.ordered
    end

    ## ARTICLE'S LIST
    def articles
      @articles = Article.all.ordered
    end

    ## ARTICLES FOR AMBASSADOR
    def ambassador_articles
      @ambassador_articles = @articles.all#ambassador_article
    end 
    ## STUDENT'S LIST
    def students
      @student = User.student_sign_up.ordered
    end
    
    ## STUDENT'S PAID
    def students_paid
      @students_paid = @student.user_plan.ordered
    end
    
    ## TEACHER'S LIST
    def teachers
      @teacher = User.teacher_sign_up.ordered
    end
    
    ## AMBASSADOR'S LIST
    def ambassadors
      @student = User.ambassador_sign_up.ordered
    end
    
    ## STUDENT'S REFERRAL BY AMBASSADOR
    def referral_counted
     # @count_student_referral = @student.referral_code
    end

    ## STUDENT'S PAID REFERRAL
    def student_paid
      @students_paid = @student.user_plan.referral_code.ordered
    end

    ## STUDENT'S UNAUTHORIZED
    def student_unauthorized
      redirect_to root_path if current_user.user_role == "student"
    end
    
    ## TEAM'S UNAUTHORIZED
    def teacher_unauthorized
      redirect_to root_path if current_user.user_role == "teacher"
    end
    ## AMBASSADOR'S UNAUTHORIZED
    def ambassador_unauthorized
      redirect_to root_path if current_user.user_role =="am"
    end
end
