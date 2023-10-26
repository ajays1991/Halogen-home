class ApplicationController < ActionController::Base
   	protect_from_forgery with: :null_session
    include ActionController::Serialization
   	def after_sign_in_path_for(resource)
	  session[:previous_url]
	end

	def authenticate_user
		header = request.headers["Authorization"]
		header = header.split(' ').last if header
		begin 
			@decoded = JwtToken.decode(header)
			@current_user = User.find(@decoded[:user_id])
		rescue 
			render json: { status: "unauthorized" }, status: :unauthorized
		end
	end
end
