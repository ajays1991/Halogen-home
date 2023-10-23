module Api
	class ApplicationController < ActionController::Base
	   	protect_from_forgery with: :exception
	   	include ActionController::Serialization	   	

	   	def after_sign_in_path_for(resource)
		  session[:previous_url] || root_path
		end
	end	
end
