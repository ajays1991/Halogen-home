class Flight < ApplicationRecord	
	belongs_to :drone
	belongs_to :user
	belongs_to :flight_plan

	has_many :drones, :through => :drone_flights
	has_many :drone_flights
	has_many :gps_beamer_logs
	has_many :camera_logs

	accepts_nested_attributes_for :gps_beamer_logs

	before_validation :paper_scammer

	def paper_scammer
		self.user_id = current_user.id
	end
end
