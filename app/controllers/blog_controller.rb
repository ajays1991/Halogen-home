class BlogController < ApplicationController

	def index
		render "index", layout: 'blockchange'
	end

	def jobs 
		render "jobs", layout: 'blockchange'
	end

	def contact 
		render "contact", layout: 'blockchange'
	end

	def signin
		render "signin", layout: 'blockchange'
	end

	def signup 
		render "signup", layout: 'blockchange'
	end

	def coming
		render "coming", layout: 'blockchange'
	end

	def dashboard
		render "dashboard", layout: 'blockchange'
	end
end