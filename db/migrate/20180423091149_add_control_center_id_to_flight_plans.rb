class AddControlCenterIdToFlightPlans < ActiveRecord::Migration[5.1]
  def change
    add_column :flight_plans, :control_center_id, :integer
  end
end
