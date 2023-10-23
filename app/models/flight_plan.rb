
class FlightPlan < ApplicationRecord

	validates :start_location, presence: true
	validates :destination, presence: true

	after_create :paper_scammer

	belongs_to :user
	has_many :flights
	# belongs_to :destination
	# belongs_to :start_location	

	has_many :fly_zone_flight_plan
	has_many :fly_zone, :through => :fly_zone_flight_plan
	
	# has_one :destination_flight_plan
	belongs_to :destination#, :through => :destination_flight_plan

	#has_one :start_location_flight_plan
	belongs_to :start_location#, :through => :start_location_flight_plan
	# belongs_to :control_center
	
	accepts_nested_attributes_for :fly_zone

	before_create :map_box_metadata
	before_create :calculate_center

	before_validation :set_user
	
	before_save :map_box_metadata
	before_save :calculate_center
	
	def set_user 
		self.user = self.current_user
	end

	def paper_scammer
		self.user_id = current_user.id
	end

	def set_control_center
		return if control_center.present?
		rad = 57.295779513082 
		destination.coordinates.lat_radians = destination.coordinates.lat / rad
		destination.coordinates.long_radians = destination.coordinates.long / rad

		start_location.coordinates.lat_radians = start_location.coordinates.lat / rad
		start_location.coordinates.long_radians = start_location.coordinates.long / rad
	end

	def map_box_metadata
		Utils::MapBoxUtility.new.get_flight_plan_directions(self)
	end

	def calculate_center
		a = Geokit::LatLng.new(destination.location.coordinates['lat'], destination.location.coordinates['long'])
        b = Geokit::LatLng.new(start_location.location.coordinates['lat'], start_location.location.coordinates['long'])        
        metadata['center'] = a.midpoint_to(b)
	end
end
