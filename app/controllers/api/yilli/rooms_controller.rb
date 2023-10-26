module Api
	module Yilli
		class RoomsController < ApplicationController

			before_action :authorize_request, except: :create

			def create
			    head :no_content
				ActionCable.server.broadcast("room_channel", room_params)
			end

			def resource_name
				:room
			end

			def analytics
				byebug
			end

			private

			def room_params
				params.permit(permitted_attributes)
			end

			def permitted_attributes
				# type = “JOIN_CALL”, “EXCHANGE”, or “LEAVE_CALL”
				[:call, :type, :from, :to, :sdp]		
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