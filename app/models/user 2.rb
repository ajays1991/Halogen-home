class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :tutor_bookings, :foreign_key => "tutor_id", :class_name => "Booking"
  has_many :student_bookings, :foreign_key => "student_id", :class_name => "Booking" 
  has_one :profile
  has_many :rates
end
