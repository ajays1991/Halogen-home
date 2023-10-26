json.id @resource.id
json.per_hour_rate @resource.per_hour_rate
json.per_hour_rate_currency @resource.per_hour_rate_currency
json.video @resource.video
json.chat @resource.chat
json.call @resource.call
json.phone_number @resource.phone_number
json.description @resource.description
json.languages @resource.languages
json.user_id @resource.user_id
json.city @resource.city
json.country @resource.country
if !@resource.tutor.tutor_bookings.nil?
	json.teachings @resource.tutor.tutor_bookings.count
else
	json.teachings 0
end
json.rating @resource.rating
json.tutor do
  json.fname @resource.tutor.fname
  json.lname @resource.tutor.lname
  json.avatar @resource.tutor.avatar
end
