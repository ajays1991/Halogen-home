module Users
	class OmniauthCallbacksController < Devise::OmniauthCallbacksController   
		def google_oauth2
	     
		    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)
		 
		    if @user.persisted?
		      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
		      sign_in(:user, @user)	      		
		      redirect_to '/home'
		      #render :json=> {:auth_token=>@user.authentication_token, :email=>@user.email}, :status => :ok
		    else
		      session["devise.google_data"] = request.env["omniauth.auth"]
		      redirect_to new_user_registration_url
		    end
	  	end
	end
end