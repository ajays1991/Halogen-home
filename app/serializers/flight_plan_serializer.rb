class FlightPlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :flight_plan_type, :status, :metadata
  has_one :user
  attribute :fly_zone
  attribute :start_location
  attribute :destination

  def control_center
    ActiveModelSerializers::SerializableResource.new(object.control_center, {})
  end
  def destination
  	ActiveModelSerializers::SerializableResource.new(object.destination, {})
  end

  def start_location
  	ActiveModelSerializers::SerializableResource.new(object.start_location, {})
  end

  def fly_zone
    ActiveModelSerializers::SerializableResource.new(object.fly_zone, {})
  end
end
