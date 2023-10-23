
module Api
	module V1
		class ControlCentersController < Api::ResourceController

			def start
				Mqtt::Server.new.subscribe_drone_topic
			end

			def resource_name
				:control_center
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				[:name, :user_id, :location_id]
			end	

			# sell flyzone wise delivery time, let the sender choose the best route plan[road navigation, directfligh (licennsed, paid service)] for delivery, ask for rooftop delivery.

			def index_preloads
				[:flight_plan]
			end

			def show_preloads
				[:flight_plan]
			end
		end
	end
end