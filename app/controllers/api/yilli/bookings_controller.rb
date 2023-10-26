module Api
	module V1
		class BookingsController < ResourceController

			def resource_name
				:booking
			end

			def analytics

			end

			private

			def permitted_attributes				
				[:student_id, :tutor_id, :channel, :link, :language_id, :slot_id]		
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