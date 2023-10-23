class AccountsController < ResourceController

	def resource_name
		:account
	end

	private

	def permitted_attributes
		['name', 'country']
	end 

end