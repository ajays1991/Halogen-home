module Api
	module V1
		class FlyZonesController < Api::ResourceController

			def resource_name
				:fly_zone
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				metadata_attributes = [:field, :type, :order]
				location_attributes = [:lat, :long]
				[:name, :user_id, :status,:regional_office_address, coordinates: location_attributes, metadata: metadata_attributes ]

			# 	metadata_attributes = ['text']
			# 	['account_id', 'name', 'assignment_type_id', 'file_id', metadata: metadata_attributes]
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