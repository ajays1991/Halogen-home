require "jwt"

module JwtToken
	extend ActiveSupport::Concern
	secret_key = "Rails.application.secrets.secret_key_base. to_s"

	def jwt_encode(payload, exp: 7.days.from_now)
		secret_key = "Rails.application.secrets.secret_key_base. to_s"
		payload[:exp] = exp.to_i
		JWT.encode(payload, secret_key)
	end

	def jwt_decode(token)
		secret_key = "Rails.application.secrets.secret_key_base. to_s"
		decoded = JWT.decode(token, secret_key)[0]
		HashWithIndifferentAccess.new decoded
	end
end