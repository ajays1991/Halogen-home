class SlotsController < ApplicationController
   	
   	before_action :authorize_request, except: :login
   	rescue_from Exception, with: :render_exception_response

   	def create
   		@resource = Slot.new(resource_params)
   		@resource.save!
   		@resource
   	end

   	def index
   		if params[:tutor_id].present?
			@resources = Slot.where(tutor_id: params[:tutor_id])
		else
			@resources = Slot.all
		end
		@resources
	end

	def update
		@resource = Slot.find(params[:id])
		@resource.current_user = current_user
		@resource.update(resource_params)
	end

	def show
		@resource = Slot.find(params[:id])
		@resource
	end 

   	private
   	def resource_params
		params.require(:slot).permit([:time, :date, :status, :tutor_id])
	end
end
