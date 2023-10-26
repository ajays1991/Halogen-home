json.id @resource.id
json.channel @resource.channel
json.link @resource.link
json.meeting_id @resource.meeting_id
json.region @resource.region
json.video_id @resource.video_id
json.user_id @resource.user_id
json.student do 
  json.fname @resource.student.fname
  json.fname @resource.student.lname
end
json.tutor do 
  json.fname @resource.tutor.fname
  json.fname @resource.tutor.lname
end    
json.language @resource.language.language
json.slot do 
  json.date @resource.slot.date
  json.time @resource.slot.time
end

