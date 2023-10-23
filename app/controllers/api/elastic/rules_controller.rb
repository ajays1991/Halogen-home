module Api
	module Elastic
		class RulesController < Api::ResourceController

			def resource_name
				:rule
			end

			private

			def permitted_attributes
				filter_attributes = [:field, :value, :operator, :boost, :gte, :lte]
				order_attributes = [:field, :type, :order]
				[:account_id, :name, :type, :user_id, filters: filter_attributes, order: order_attributes]
			end

			def index_preloads
				[:account]
			end

			def show_preloads
				[:account]
			end
		end
	end
end