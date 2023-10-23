class ResourceController < ApplicationController
   	acts_as_token_authentication_handler_for User
   	before_action :authenticate_user!
   	
   	def create
   		resource = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.new(resource_params)
   		resource.current_user = current_user
   		resource.save!
   		render json: {
   			result: resource
   		}
   	end

   	def index
		resources = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.all
        render json: {status: 'SUCCESS', data: resources}, status: :ok
	end

	def update
		resource = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.find(params[:id])
		resource.current_user = current_user
		resource.update(resource_params)
		render json: {
			result: resource
		}
	end

	def show
		resource = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.find(params[:id])
		render json: resource, include: show_preloads
	end 


   	private
   	def resource_params
		params.require(resource_name).permit(permitted_attributes)
	end
end
