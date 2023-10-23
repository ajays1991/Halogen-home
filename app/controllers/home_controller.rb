class HomeController < ApplicationController

	def index
		render "index", layout: false
	end

	# def signin
	# 	render "signin"
	# end

	def home2
		render "index2", layout: false
	end

	def signup
		render "signup"
	end

	def blog
		render "blog", layout: false
	end

	def aboutus
		render "aboutus"
	end

end