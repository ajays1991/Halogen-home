module Api
	class ResourceController < ApplicationController
		skip_before_action :verify_authenticity_token
	   	acts_as_token_authentication_handler_for User
	   	before_action :authenticate_user!
	   		
	   	def capitalized_resource_name
	   		resource_name.to_s.split('_').map{|e| e.capitalize}.join
	   	end

	   	def create	   		   		   	    	   	   
	   		resource = capitalized_resource_name.constantize.new(resource_params)
	   		resource.current_user = current_user
	   		
	   		resource.save!
	   		
	   		
	   		render json: {	   		
	   			resource_name => ActiveModelSerializers::SerializableResource.new(resource, {})
	   		}
	   	end

	   	def index
	   		page = params[:page] || 1
	   		size = params[:size] || 10
	   		resources = nil
	   		if params[:switch] == 'es'
	   			resources = Search::SearchManager.new(resource_name, params[:q], page, size, index_preloads).search
	   		else
				resources = capitalized_resource_name.constantize.all.limit(size.to_i).offset((page.to_i - 1)*size.to_i)
	   		end
	        render json: {status: 'SUCCESS', page: page, size: size, attributes:  capitalized_resource_name.constantize.column_names ,data: ActiveModelSerializers::SerializableResource.new(resources, {})}, status: :ok
		end

		def update
			resource = capitalized_resource_name.constantize.find(params[:id])
			resource.current_user = current_user
			resource.update(resource_params)
			render json: {
				result: resource
			}
		end

		def show
			resource = capitalized_resource_name.constantize.preload(show_preloads).find(params[:id])
			render json: resource
		end 

	   	private
	   	def resource_params
			params.require(resource_name).permit(permitted_attributes)
		end
		  
		private
		# Use the following function to ensure only logged in members can access the API
		def authenticate_with_doorkeeper_or_devise!
		  if request.headers['Authorization'].present?
		    doorkeeper_authorize! 
		    @current_user = User.find(doorkeeper_token[:resource_owner_id])
		  else 
		    authenticate_user!
		  end
		end
	end
end