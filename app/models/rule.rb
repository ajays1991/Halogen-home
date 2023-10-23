class Rule < ApplicationRecord
	# belongs_to :user
	attr_accessor :current_user

	after_create :set_percolator


	def set_percolator
		CreatePercolatorJob.perform_now(self.id)
	end
end
