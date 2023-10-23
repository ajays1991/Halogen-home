class Slot < ApplicationRecord
  belongs_to :tutor, :class_name => 'User', :foreign_key => 'tutor_id'
  has_one :booking

  before_validation :set_tutor

  enum :status, { available: 0, booked: 1 }, default: :available

  def set_tutor
    self.tutor_id = Current.attributes[:user][:id]
  end
end