module LnclassScoped
  extend ActiveSupport::Concern
  

  included do

    ################ ORDERED ##############
    scope :ordered, -> { order('created_at DESC') }
    scope :order_asc, -> { order('created_at ASC') }

    ################ USER'S ##############
    scope :student_sign_up, -> { where(user_role: "Student") }
    scope :teacher_sign_up, -> { where(user_role: "Teacher") }
    scope :ambassador_sign_up, -> { where(user_role: "Ambassador") }
    
    ################ STATISTICS ##############
    scope :DAU, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
    scope :WAU, -> { where("created_at >= ?", Time.zone.now.beginning_of_week) }
    scope :referral_code, -> { where("referral_code= ?", current_user.referral_code) }
    
    ################ COURSES ##############
    # scope :feed, -> { where(status: "Lune") }
    # scope :feed_exercise, -> { where(status: "Lune") }

    ################ EXERCISES ##############
    scope :ready, -> { where(published: true) }
    
    ################ ARTICLES ##############
    #scope :ambassador_article, -> (current_user) { where(ambassador_referral_code: current_user.referral_code) }

    ################ LEVEL'S ##############
    # scope :select_level, -> { where(level: current_user.level_name) }
    
    ################ PLAN'S ##############
    scope :user_plan, -> { where(user_plan: "paid") }
    
  end

end
