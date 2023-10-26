module Api
	module V1
		class ProfilesController < ResourceController

			def resource_name
				:profile
			end

			def analytics
				byebug
			end

			private

			def permitted_attributes
				[:per_hour_rate, :per_hour_rate_currency, :video, :status, :chat, :call, :phone_number, :description, :city, :country, :rating, language_ids: []]		
			end	

			def index_preloads
				[tutor: [:bookings]]
			end

			def show_preloads
				[tutor: [:bookings]]
			end
		end
	end
end