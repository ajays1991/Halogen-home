module Api
	module Zendesk
		class EventsController < Api::ResourceController

			def resource_name
				:event
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes
				specification_attributes = [:field, :value, :operator, :boost, :gte, :lte]
				metadata_attributes = [:field, :type, :order]
				[:name, :owner_id, :mac_address, :ipv4, :flight_type, metadata: metadata_attributes, specifications: specification_attributes]

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