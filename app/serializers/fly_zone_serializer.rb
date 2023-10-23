class FlyZoneSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :regional_office_address, :coordinates, :metadata
end
