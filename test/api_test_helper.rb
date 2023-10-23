module ApiTestHelper

 	def setup
 		sign_in(users(:one))
 	end

	def test_create
		api_url = "/api/v1/#{resource_name.to_s.pluralize}"
		post api_url, params: create_params
		assert_response :success
	end
end