#Whitelist additional fields for devise User objects.
module ItemsScoped
  extend ActiveSupport::Concern
  
  ################ ORDERED ##############
  scope :ordered, -> { order('created_at desc')}
  scope :order_asc, -> { order('created_at asc')}

  
  ################ USER'S ##############
  scope :student_sign_up, -> { where("user_role = ?", "Student")}
  scope :teacher_sign_up, -> { where("user_role = ?", "Teacher")}
  scope :ambassador_sign_up, -> { where("user_role = ?", "Ambassador")}
  
  
  ################ STATISTICS ##############
  scope :DAU, -> { where("created_at >= ?", Time.zone.now.beginning_of_day)}
  scope :WAU, -> { where("created_at >= ?", Time.zone.now.beginning_of_day)}
  scope :referral_code, -> {where("referral_code = ?", "#{current_user.referral_code}")}  
  ################ COURSES ##############
  #scope :feed, -> {where("status= ?", "Lune")}
  #scope :feed_exercise, -> {where("status= ?", "Lune")}

  ################ EXERCISES ##############

  ################ ARTICLES ##############
  scope :ambassador_article,  -> {where("ambassador_referral_code = ?", "#{current_user.referral_code}")}

  ################ LEVEL'S ##############
  #scope :select_level, -> { where("level = ?", current_user.level_name)}
  
  ################ PLAN'S ##############
  scope :user_plan, -> {where("user_plan = ?", "paid")} 
  

end
