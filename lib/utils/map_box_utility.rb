require 'net/http'
class Utils::MapBoxUtility

	attr_accessor :mapbox_access_token

	def initialize
		@mapbox_access_token = "pk.eyJ1Ijoidmlja3kxMjM2IiwiYSI6ImNqZ2VyZHk5MTAyMzYycXFzeDNkdWY1bGUifQ.GUdcWDMFkaJaNKI2LikUpQ"
	end

	def get_flight_plan_directions(flight_plan)
		# aurl = "https://api.mapbox.com/directions/v5/mapbox/driving/75.171711,30.816477;77.119488,32.143567?geometries=geojson&access_token=pk.eyJ1Ijoidmlja3kxMjM2IiwiYSI6ImNqZ2VyZHk5MTAyMzYycXFzeDNkdWY1bGUifQ.GUdcWDMFkaJaNKI2LikUpQ"	
		url = "https://api.mapbox.com/directions/v5/mapbox/driving/"+flight_plan.start_location.location.coordinates['long'].to_s+","+flight_plan.start_location.location.coordinates['lat'].to_s+";"+flight_plan.destination.location.coordinates['long'].to_s+","+flight_plan.destination.location.coordinates['lat'].to_s+"?&access_token="+ mapbox_access_token + "&geometries=geojson"
		data = get(url)		
		flight_plan.metadata = data
	end

	private
	def get(url, params = {})

		uri = URI(url)			
		res = Net::HTTP.get_response(uri)
		return JSON.parse(res.body) if res.is_a?(Net::HTTPSuccess)
	end
end
