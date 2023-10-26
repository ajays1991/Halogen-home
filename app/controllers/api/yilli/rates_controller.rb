module Api
	module Yilli
		class RatesController < ResourceController

			def resource_name
				:rate
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes
				[:rate_unit, :rate_per_unit, :rate_currency, :quantity]		
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