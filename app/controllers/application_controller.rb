class ApplicationController < ActionController::Base
   	protect_from_forgery with: :null_session
    include ActionController::Serialization
   	def after_sign_in_path_for(resource)
	  session[:previous_url]
	end
end
