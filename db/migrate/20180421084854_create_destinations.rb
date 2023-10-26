class CreateDestinations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :location_type
      t.string :status
      t.text :address
      t.json :coordinates
      t.references :user, foreign_key: true
      t.json :metadata

      t.timestamps
    end
    create_table :destinations do |t|
      t.string :name   
      t.references :flight_plan   
      t.references :user, foreign_key: true      
      t.references :location, references: 'location'
      t.string :control_type
      t.json :metadata
      t.boolean :active

      t.timestamps
    end
  end
end
