class CreateFlyZoneFlightPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :fly_zone_flight_plans do |t|
       	t.references :fly_zone
       	t.references :flight_plan

	    t.timestamps
    end
  end
end
