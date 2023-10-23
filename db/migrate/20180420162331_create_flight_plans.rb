class CreateFlightPlans < ActiveRecord::Migration[5.1]
  def change
    create_table :flight_plans do |t|
      t.string :name
      t.string :control_type, default: "Auto"
      t.string :status, default: "Ready"
      t.references :user, foreign_key: true
      t.integer :flight_plan_type
      t.references :start_location
      t.references :destination
      t.jsonb :metadata
      t.timestamps
    end
  end
end
