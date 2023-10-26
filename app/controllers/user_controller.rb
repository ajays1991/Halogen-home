class UserController < ApplicationController
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
  	params.require(:user).permit([:email, :password])
  end

  def build_resource(params)
  	resource = User.new
  	resource.email = params[:email]
  	resource.password = params[:password]
  	resource
  end

  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

	def jwt_encode(payload, exp: 7.days.from_now)
		payload[:exp] = exp.to_i
		JWT.encode(payload, SECRET_KEY)
	end

	def jwt_decode(token)
		decoded = JWT.decode(token, SECRET_KEY)[0]
		HashWithIndifferentAccess.new decoded
	end
end