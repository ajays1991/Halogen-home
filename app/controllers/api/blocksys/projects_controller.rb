module Api
	module Blocksys
		class ProjectsController < Api::ResourceController
			def resource_name
				:project
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes
				metadata_attributes = ['text']
				['account_id', 'name', 'domain_id', metadata: metadata_attributes]
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