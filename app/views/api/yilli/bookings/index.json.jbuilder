json.bookings do
  json.array! @resources do |resource|
    json.id resource.id
    json.channel resource.channel
    json.link resource.link
    json.date resource.date
    json.time resource.time.strftime("%H : %M")
    json.meeting_id resource.meeting_id
    json.region resource.region
    json.video_id resource.video_id
    json.user_id resource.user_id
    json.student do 
      json.fname resource.student.fname
      json.fname resource.student.lname
    end
    json.tutor do 
      json.fname resource.tutor.fname
      json.fname resource.tutor.lname
      json.ratings resource.tutor.profile.rating
      json.teachings resource.tutor.tutor_bookings.count
    end    
    json.language resource.language.language
    if (resource.date.strftime("%Y-%m-%d") == DateTime.now.strftime("%Y-%m-%d")) & (resource.time.strftime( "%H%M%S%N" ) <= DateTime.now.strftime( "%H%M%S%N" ))
      json.button_text "Join Now"
    else
      json.button_text "Reschedule"
    end
  end
end
        