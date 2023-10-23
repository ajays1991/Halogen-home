require 'rubygems'
require 'mqtt'

class Mqtt::Server
	def start
		MQTT::Client.connect('mqtt://drone:sharma321@localhost:4000') do |c|
		  puts "sany get"
		  # If you pass a block to the get method, then it will loop
		  c.subscribe('drone')
		  c.get('drone') do |topic,message|		  	
		  	puts "#{message} #{topic}"
		  end

		  # GPS Beamer 		 
		  c.get('gps_beamer') do |topic,message|		  			  	
		  	gps_beamer_topic_create(JSON.parse(message))
		  end
		end
	end

	def drone_method
		d = Drone.first
		puts "#{d.id}"
	end

	def gps_beamer_topic_create(payload)
		gps = GpsBeamer.create(latitude: payload[:latitude], longitude: payload[:longitude], fligh_id: payload[:fligh_id])
		puts "#{gps.id}"
	end
end
