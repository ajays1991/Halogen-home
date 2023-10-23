class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :location_type, :status, :address, :coordinates, :user_id, :metadata 
end
