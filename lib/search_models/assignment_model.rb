class SearchModels::AssignmentModel
	def search_fields
		{
			name: { field: 'assignments.name', join: nil },
			account_id: { field: 'assignments.account_id', join: nil },
			account_name: { field: 'accounts.name', join: 'accounts' }
		}
	end

	def sort_fields
		{
			name: { field: 'name', join: nil }
		}
	end
end
