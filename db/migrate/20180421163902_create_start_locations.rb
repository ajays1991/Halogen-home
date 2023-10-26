class CreateStartLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :start_locations do |t|
      t.string :name      
      t.references :flight_plan
      t.references :user, foreign_key: true      
      t.references :location, references: 'location'
      t.string :control_tylope
      t.json :metadata
      t.boolean :active

      t.timestamps
    end
  end
end
