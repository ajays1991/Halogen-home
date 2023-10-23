class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  attr_accessor :current_user
end
