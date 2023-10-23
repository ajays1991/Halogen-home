module Api
	module V1
		class GpsBeamerLogsController < Api::ResourceController

			def resource_name
				:gps_beamer_log
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				metadata_attributes = [:test]
				location_attributes = [:test]
				[:latitude, :longitude, :flight_id, metadata: metadata_attributes]		
			end	

			# sell flyzone wise delivery time, let the sender choose the best route plan[road navigation, directfligh (licennsed, paid service)] for delivery, ask for rooftop delivery.

			def index_preloads
				[:flight, :user]
			end

			def show_preloads
				[:flight, :user]
			end
		end
	end
end