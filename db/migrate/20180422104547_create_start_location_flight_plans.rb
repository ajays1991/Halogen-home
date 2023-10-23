class CreateStartLocationFlightPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :start_location_flight_plans do |t|
    	t.references :start_location, foreign_key: true
       	t.references :flight_plan, foreign_key: true

	    t.timestamps
      
    end
  end
end
