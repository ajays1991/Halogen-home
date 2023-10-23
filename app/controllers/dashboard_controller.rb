class DashboardController < ApplicationController

	def index
		render "index", layout: 'dashboard'
	end

	# def flight_centers
	# 	render "flight_center", layout: 'dashboard'
	# end

	def flight_center
		render "flight_center", layout: 'dashboard'
	end

	def flights
		render "list", layout: 'dashboard'
	end

	def drones
		render "list", layout: 'dashboard'
	end

	def flight_plans
		render "list", layout: 'dashboard'		
	end

	def fly_zones
		render "list", layout: 'dashboard'		
	end

	def destinations
		render "list", layout: 'dashboard'		
	end

	def start_locations
		render "list", layout: 'dashboard'		
	end

	def locations
		render "list", layout: 'dashboard'
	end

	def flights
		render "list", layout: 'dashboard'
	end

	def location_new
		render "location_new", layout: 'dashboard'
	end

	def destination_new
		render "destination_new", layout: 'dashboard'
	end

	def start_location_new
		render "start_location_new", layout: 'dashboard'
	end

	def flight_plan_new
		render "flight_plan_new", layout: 'dashboard'
	end

	def flight_new
		render "flight_new", layout: 'dashboard'
	end

	def cards
		render "cards", layout: 'dashboard'
	end

end