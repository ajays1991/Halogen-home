class CreateFlyZones < ActiveRecord::Migration[5.1]
  def change
    create_table :fly_zones do |t|
      t.string :name
      t.string :status
      t.text :regional_office_address
      t.references :user, foreign_key: true      
      t.json :coordinates
      t.json :metadata

      t.timestamps
    end
  end
end
