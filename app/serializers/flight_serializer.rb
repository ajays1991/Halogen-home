class FlightSerializer < ActiveModel::Serializer
  attributes :id, :name, :flight_code, :flight_type, :status, :metadata
  has_one :user
  has_one :drone
  has_one :flight_plan
end