class FlyZone < ApplicationRecord
	#belongs_to :account
	
	has_many :fly_zone_flight_plans
	has_many :flight_plans, :through => :fly_zone_flight_plans
	
	after_create :paper_scammer
	def paper_scammer
		self.user_id = current_user.id
	end
end
