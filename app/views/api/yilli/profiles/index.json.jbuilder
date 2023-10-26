json.resources do
  json.array! @resources do |profile|
    json.id profile.id
    json.languages profile.languages
    json.per_hour_rate profile.per_hour_rate
    json.per_hour_rate_currency profile.per_hour_rate_currency
    json.video profile.video    
    json.chat profile.chat
    json.call profile.call
    json.description profile.description
    json.phone_number profile.phone_number
    json.city profile.city
    json.country profile.country
    if !profile.tutor.tutor_bookings.nil?
      json.teachings profile.tutor.tutor_bookings.count
    else
      json.teachings 0
    end
    json.rating profile.rating
    json.tutor do
      json.fname profile.tutor.fname
      json.lname profile.tutor.lname
      json.avatar profile.tutor.avatar
    end
  end
end