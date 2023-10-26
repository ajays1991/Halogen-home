json.resources do
  json.array! @resources do |rate|
    json.rate_unit rate.rate_unit
    json.rate_per_unit rate.rate_per_unit
    json.rate_currency rate.rate_currency
    json.quantity rate.quantity
  end
end