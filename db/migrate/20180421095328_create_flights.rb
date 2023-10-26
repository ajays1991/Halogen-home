class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.string :name
      t.string :flight_code
      t.string :flight_type
      t.string :status
      t.references :user, foreign_key: true
      t.references :drone, foreign_key: true
      t.references :flight_plan, foreign_key: true
      t.references :fly_zone, foreign_key: true
      t.json :metadata

      t.timestamps
    end
  end
end
