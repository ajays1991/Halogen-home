class DestinationFlightPlan < ApplicationRecord
	belongs_to :destination
	belongs_to :flight_plan
end
