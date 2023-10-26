class ApplicationController < ActionController::Base

	protect_from_forgery with: :null_session
	#before_action :authorize_request, except: :login
	
	def not_found
    render json: { error: 'not_found' }
  end

  def authorize_request
    byebug
    header = request.headers['Authorization']
    header = header.split(' ').last if header
    begin
      @decoded = JsonWebToken.decode(header)
      @current_user = User.find(@decoded[:user_id])
      Current.user = @current_user
    rescue ActiveRecord::RecordNotFound => e
      render json: { errors: e.message }, status: :unauthorized
    rescue JWT::DecodeError => e
      render json: { errors: e.message }, status: :unauthorized
    end
  end

  def render_exception_response(exception)
    render json: { message: exception.message }, status: :unprocessable_entity
	end
end
