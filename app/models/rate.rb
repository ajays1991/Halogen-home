class Rate < ApplicationRecord
  belongs_to :user

  before_validation :set_tutor

  def set_tutor
    self.user_id = Current.attributes[:user][:id]
  end
end