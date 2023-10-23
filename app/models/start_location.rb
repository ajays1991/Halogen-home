class StartLocation < ApplicationRecord
	
	# has_many :start_location_flight_plans
	# has_many :flight_plans, :through => :start_location_flight_plan

	has_one :flight_plan
	belongs_to :location
	after_create :set_user

	def set_user
		self.user_id = current_user.id
	end
end
