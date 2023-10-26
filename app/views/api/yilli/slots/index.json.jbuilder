json.slots do
  json.array! @resources do |slot|
    json.time slot.time
    json.date slot.date
    json.status slot.status
    json.tutor do 
      json.fname slot.tutor.fname
      json.fname slot.tutor.lname
    end    
  end
end
        