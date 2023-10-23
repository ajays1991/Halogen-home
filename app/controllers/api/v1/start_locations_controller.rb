module Api
	module V1
		class StartLocationsController < Api::ResourceController

			def resource_name
				:start_location
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				metadata_attributes = [:field, :type, :order]
				location_attributes = [:lat, :long]
				[:name, :user_id , :start_id, :location_id, :control_type, metadata: metadata_attributes]
			end

			def index_preloads
				# [:account]
			end

			def show_preloads
				# [:account]
			end
		end
	end
end