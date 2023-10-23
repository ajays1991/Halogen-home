class StartLocationFlightPlan < ApplicationRecord
	belongs_to :flight_plan
	belongs_to :start_location
end
