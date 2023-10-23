class StartLocationSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :location
end
