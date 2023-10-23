class GpsBeamerLog < ApplicationRecord
	belongs_to :flight
	Chewy.strategy(:active_job) do
    	update_index('gps_beamer_logs#gps_beamer_log') { self }
	end 
end
