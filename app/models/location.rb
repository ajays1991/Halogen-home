class Location < ApplicationRecord
	has_one :destination
	has_one :start_location 
	after_create :paper_scammer
	def paper_scammer
		self.user_id = current_user.id
	end
end
