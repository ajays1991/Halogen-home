class CreateDestinationFlightPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :destination_flight_plans do |t|
    	t.references :destination, foreign_key: true
       	t.references :flight_plan, foreign_key: true

	    t.timestamps      
    end
  end
end
