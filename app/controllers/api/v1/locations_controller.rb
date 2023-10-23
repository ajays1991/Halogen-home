module Api
	module V1
		class LocationsController < Api::ResourceController

			def resource_name
				:location
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				metadata_attributes = [:field, :type, :order]
				coordinate_attributes = [:type, :radius, :radius_unit, :lat, :long]
				[:name, :user_id, :status, :location_type, :address, coordinates: coordinate_attributes, metadata: metadata_attributes ]

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