class Assignment < ApplicationRecord
	belongs_to :account

	after_create :paper_scammer

	attr_accessor :current_user
	has_attached_file :file
	Chewy.strategy(:active_job) do
    	update_index('assignments#assignment') { self }
	end
	def paper_scammer
		#PaperScammer::PaperDump.new(self.id).run
	end

end
