class DroneSerializer < ActiveModel::Serializer
  attributes :id, :name, :mac_address, :ipv4, :flight_type, :flights_count, :metadata
  has_one :owner
end
