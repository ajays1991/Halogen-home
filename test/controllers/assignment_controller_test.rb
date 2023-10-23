require 'test_helper'
require 'api_test_helper'
class AssignmentControllerTest < ActionDispatch::IntegrationTest

	include ApiTestHelper
	
  	def resource_name
  		:assignment
  	end

  	def create_params
  		{
  			assignment: {
  				account_id: accounts(:one).id,
	  			name: 'click',
	  			assignment_type_id: assignment_types(:one).id,
	  			metadata: {
	  				text: "this is the sample text"
	  			}
  			}
  		}
  	end
end