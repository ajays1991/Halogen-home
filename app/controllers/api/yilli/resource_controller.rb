class Api::Yilli::ResourceController  < Api::ApplicationController
   	
   	rescue_from Exception, with: :render_exception_response
   	def create
   		@resource = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.new(resource_params)
   		@resource.save!
   		@resource
   	end

   	def index
   		byebug
		@resources = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.all
		@resources
	end

	def update
		@resource = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.find(params[:id])
		@resource.current_user = current_user
		@resource.update(resource_params)
	end

	def show
		@resource = resource_name.to_s.split('_').map{|e| e.capitalize}.join.constantize.find(params[:id])
		@resource
	end 

	def render_exception_response(exception)
      render json: { message: exception.message }, status: :unprocessable_entity
	end

   	private
   	def resource_params
		params.require(resource_name).permit(permitted_attributes)
	end

	def set_resource
		puts "set resource"
	end
end
