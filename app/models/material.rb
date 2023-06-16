class Material < ApplicationRecord
  
  ################# RELATIONS ##################
  belongs_to :user

  ################# SLUGGED ##################
  include ItemsSlugged
end
