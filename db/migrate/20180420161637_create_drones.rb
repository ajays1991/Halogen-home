class CreateDrones < ActiveRecord::Migration[5.1]
  def change
    create_table :drones do |t|
      t.string :name
      t.integer :owner_id
      t.string :mac_addresss
      t.string :ipv4
      t.string :type
      t.integer :flights_count
      t.json :metadata

      t.timestamps
    end
  end
end
