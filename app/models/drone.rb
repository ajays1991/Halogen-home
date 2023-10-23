class Drone < ApplicationRecord
	before_validation :paper_scammer
	
	has_many :flights, :through => :drone_flights
	has_many :drone_flights
	belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
	
	def paper_scammer
		self.owner_id = current_user.id
	end
end
