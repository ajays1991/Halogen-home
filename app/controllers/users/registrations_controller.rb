module Users
	class RegistrationsController < Devise::RegistrationsController
	  respond_to :json

	  def create
	    resource = build_resource(sign_up_params)
	    if resource.save!
	    	render json: {status: 'SUCCESS'}, status: :ok
	    else
	    	render json: {status: "Error, something failed"}
	    end
	  end

	  private
	  def sign_up_params
	  	params.require(:user).permit([:email, :password, :password_confirmation])
	  end

	  def build_resourceO(params)
	  	resource = User.new
	  	resource.email = params[:email]
	  	resource.password = params[:password]
	  	resource
	  end
	end
end