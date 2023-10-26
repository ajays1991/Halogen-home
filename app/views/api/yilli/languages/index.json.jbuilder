json.resources do
  json.array! @resources do |language|
    json.id language.id
    json.language language.language
    json.country language.country
    json.region language.region
    json.continent language.continent
    json.teachings language.bookings.count    
  end
end
        