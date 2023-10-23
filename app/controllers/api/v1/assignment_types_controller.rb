module Api
	module V1
		class AssignmentTypesController < Api::ResourceController
			def resource_name
				:assignment_type
			end

			private

			def assignment_types_params(params)
				params.require(:assignment_type).permit(permitted_attributes)
			end

			def permitted_attributes
				metadata_attributes = ['text']
				['account_id', 'name', 'assignment_type', 'file', metadata: metadata_attributes]
			end
		end
	end
end
