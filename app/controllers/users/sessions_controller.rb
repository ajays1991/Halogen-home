module Users
	class SessionsController < DeviseController
		prepend_before_action :require_no_authentication, :only => [:create]		
		respond_to :json
		#acts_as_token_authentication_handler_for User

		def new
		end

		def create
			resource = User.find_for_database_authentication(:email => params[:user][:email])
	    	return invalid_login_attempt unless resource
	    	
		    if resource.valid_password?(params[:user][:password])
		      sign_in(:user, resource)	      
		      resource.ensure_authentication_token
		      render :json=> {:auth_token=>resource.authentication_token, :email=>resource.email}, :status => :ok
		      return
		    else
		      invalid_login_attempt
		    end						
		end

		private

		def invalid_login_attempt
			render :json => { message: "invalid login" }
		end
	end
end