class FlyZoneFlightPlan < ApplicationRecord
	belongs_to :fly_zone
	belongs_to :flight_plan
end
