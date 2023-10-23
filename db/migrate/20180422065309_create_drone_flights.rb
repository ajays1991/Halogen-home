class CreateDroneFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :drone_flights do |t|
      t.references :drone
      t.references :flight

      t.timestamps
    end
  end
end
