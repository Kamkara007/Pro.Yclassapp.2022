Rails.application.routes.draw do
  
  resources :results
  resources :questions
  resources :exercises


  ################## LEARN POD  ##########################
  get "new-article", to:"articles#new"
  get "articles", to:"articles#index"
  resources :articles, except: %i[:new, :index]

  ################## COURSES  ##########################
  get "new-course", to:"courses#new"

  resources :courses, except:[:new, :show]
  resources :courses, only:[:show] do
    resources :exercises
  end
  
  resources :exercises do
    member do
      delete 'delete', to: 'exercises#destroy'
    end
    resources :questions, only: [:new, :create, :destroy]
    resources :results, only: [:new, :create]
  end

  

  ################## STATUTS  ##########################
  get "new-statut", to:"statuts#new"
  resources :statuts, except:[:new]
  
  
  ################## MATERIALS  ##########################
  get "new-material", to:"materials#new"
  resources :materials, except:[:new]
  
  ################## LEVELS  ##########################
  get "new-level", to:"levels#new"
  resources :levels, except:[:new]
  


  ################## DASHBOARD  ##########################
  get "dashboard", to:'dashboard#index'
  get "students", to:"dashboard#student"
  get "enseignants", to:"dashboard#teacher"
  get "ambassadors", to:"dashboard#ambassador"
  get "dashboard", to:'dashboard#index'
  get "params", to:'dashboard#home'
  
  ################## DASHBOARD  && EsPORT ##########################
  get "export_student", to:"dashboard#export"
  get "course_export", to:"dashboard#course"

  ##################### START Membership #####################
  get "teacher-sign-up" , to:'membership#teacherUp'
  get "teacher-sign-in" , to:'membership#teacherIn'
  get "ambassadeur-sign-up" , to:'membership#ambassadorUp'
  get "ambassadeur-sign-in" , to:'membership#ambassadorIn'
  get "team-sign-up" , to:'membership#teamUp'
  get "team-sign-in" , to:'membership#teamIn'  
  

  ################## USERS  ##########################
  match "/404", to:'errors#not_found', via: :all
  match "/422", to:'errors#unacceptable', via: :all
  match "/500", to:'errors#internal_error', via: :all

  ################## USERS  ##########################
  devise_scope :user do
    get 'profil', to: 'devise/registrations#edit'
    get 'student-sign-in', to: 'devise/sessions#new'
    get 'student-sign-up', to: 'devise/registrations#new', as: "new_user_registration"
    delete 'deconnecter',  to: "devise/sessions#destroy", as: "destroy_user_session_path"
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "feed", to:"homepage#feed"
  # Defines the root path route ("/")
  root "homepage#index"
end
