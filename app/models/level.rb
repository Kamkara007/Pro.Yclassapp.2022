class Level < ApplicationRecord
  ################# RELATIONS ##################
  belongs_to :user

  ################# SLUGGED ##################
  include ItemsSlugged
end
