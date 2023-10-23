class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :control_type, :active, :location_id

  has_one :location
end