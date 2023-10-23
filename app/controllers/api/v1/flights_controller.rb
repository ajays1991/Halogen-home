module Api
	module V1
		class FlightsController < Api::ResourceController

			def resource_name
				:flight
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				metadata_attributes = [:field, :type, :order]
				location_attributes = [:lat, :long]
				[:name, :flight_code, :flight_type, :status, :user_id, :drone_id, :flight_plan_id , :fly_zone_id, metadata: metadata_attributes]		
			end	

			# sell flyzone wise delivery time, let the sender choose the best route plan[road navigation, directfligh (licennsed, paid service)] for delivery, ask for rooftop delivery.

			def index_preloads
				[:drone, :flight_plan]
			end

			def show_preloads
				[:drone, :flight_plan]
			end
		end
	end
end