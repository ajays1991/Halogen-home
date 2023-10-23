class Account < ApplicationRecord
  has_many :assignments
  attr_accessor :current_user

  before_save :set_owner

  def set_owner
  	self.owner_id = current_user.id
  end

end
