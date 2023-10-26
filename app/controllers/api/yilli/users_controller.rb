
class UsersController < ResourceController

	skip_before_action :authorize_request, only: :create

	def resource_name
		:user
	end

	def analytics
		byebug
	end

	private

	def permitted_attributes
		[:fname, :lname, :email, :mobile, :avatar, :password, :password_confirmation, :role]		
	end	

	def index_preloads
		[]
	end

	def show_preloads
		[]
	end
end