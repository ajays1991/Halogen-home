class PaperScammer::PaperDump

	attr_accessor :assignment, :account, :assignment_type

	def initialize(assignment_id)
		@assignment = Assignment.find(assignment_id)
		@account = Account.find(@assignment.account_id)
		@assignment_type = AssignmentType.find(@assignment.assignment_type_id)
	end

	def run
		byebug
	end

	private

	def run_scammers
		assignments = Assignment.where_not(id: assignment.id)

	end

end