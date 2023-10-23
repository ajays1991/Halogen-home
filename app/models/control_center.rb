class ControlCenter < ApplicationRecord

	has_many :flight_plan
	belongs_to :location
	after_create :set_user

	def set_user
		self.user_id = current_user.id
	end
end
