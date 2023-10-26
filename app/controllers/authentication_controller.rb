class AuthenticationController < ApplicationController


	def login
		resource = User.find_by(:email => params[:user][:email])

	    if resource&.authenticate(params[:user][:password])
	    	token = jwt_encode(user_id: resource.id)
	    	time = 1708333362
	        render :json=> {:auth_token => token, :email=>resource.email, expires_at: time}, :status => :ok
	        return
	    else
	      render :json => { message: "unauthorized"}
	    end						
	end

	private
	def jwt_encode(payload)
		secret_key = "Rails.application.secrets.secret_key_base. to_s"
		payload[:exp] =  1708333362
		JWT.encode(payload, secret_key)
	end
end