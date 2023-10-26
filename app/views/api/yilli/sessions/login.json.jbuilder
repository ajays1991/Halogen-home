json.token @token
if @user.profile.present?
	json.profile do 
	  json.id @user.profile.id
		json.per_hour_rate @user.profile.per_hour_rate
		json.per_hour_rate_currency @user.profile.per_hour_rate_currency
		json.video @user.profile.video
		json.chat @user.profile.chat
		json.call @user.profile.call
		json.phone_number @user.profile.phone_number
		json.description @user.profile.description
		json.languages @user.profile.languages
		json.city @user.profile.city
		json.country @user.profile.country
		json.rating @user.profile.rating
	end
end
json.user do 
  json.id @user.id
	json.fname @user.fname
	json.lname @user.lname
	json.mobile @user.mobile
	json.email @user.email
	json.role @user.role
end
if @user.role == "student"
	json.bookings do
		json.array! @user.student_bookings do |booking|
			json.id booking.id
			json.channel booking.channel
			json.link booking.link
			json.date booking.date
			json.time booking.time
			json.student do 
			  json.fname booking.student.fname
			  json.fname booking.student.lname
			end
			json.tutor do 
			  json.fname booking.tutor.fname
			  json.fname booking.tutor.lname
			  json.language booking.tutor.profile.languages
			end
		end
	end
end

if @user.role == "tutor"
	json.bookings do
		json.array! @user.student_bookings do |booking|
			json.id booking.id
			json.channel booking.channel
			json.link booking.link
			json.date booking.date
			json.time booking.time
			json.student do 
			  json.fname booking.student.fname
			  json.fname booking.student.lname
			end
			json.tutor do 
			  json.fname booking.tutor.fname
			  json.fname booking.tutor.lname
			  json.language booking.tutor.profile.languages
			end
		end
	end
end
