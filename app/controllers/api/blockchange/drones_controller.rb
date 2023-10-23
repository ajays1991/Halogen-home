module Api 
	module Blockchange		
		class DronesController < Api::ResourceController

			def resource_name
				:drone
			end

			private

			def permitted_attributes
				specification_attributes = [:field, :value, :operator, :boost, :gte, :lte]
				metadata_attributes = [:field, :type, :order]
				[:name, :owner_id, :mac_address, :ipv4, :type, metadata: metadata_attributes, specifications: specification_attributes]
			end

			def index_preloads
				[]
			end

			def show_preloads
				[]
			end
		end
	end
end