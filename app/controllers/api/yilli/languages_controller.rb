module Api
	module V1
		class LanguagesController < ResourceController

			def resource_name
				:language
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes				
				[:language, :region, :country, :continent]		
			end	

			# sell flyzone wise delivery time, let the sender choose the best route plan[road navigation, directfligh (licennsed, paid service)] for delivery, ask for rooftop delivery.

			def index_preloads
				[]
			end

			def show_preloads
				[]
			end
		end
	end
end