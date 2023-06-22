require_dependency 'concerns/lnclass_scoped'


class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  ############### Enables implicit order column for UUID #############
  self.implicit_order_column = "created_at"
  
  ############### SLUGGED ####################
  include LnclassScoped
  
end
