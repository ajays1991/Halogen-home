class CameraLog < ApplicationRecord
	belongs_to :flight
	
	has_attached_file :file
	Chewy.strategy(:active_job) do
    	update_index('camera_logs#camera_log') { self }
	end
	
end
