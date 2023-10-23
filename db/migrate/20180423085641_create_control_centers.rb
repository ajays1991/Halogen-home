class CreateControlCenters < ActiveRecord::Migration[5.1]
  def change
    create_table :control_centers do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.references :location, foreign_key: true
      
      t.timestamps
    end
  end
end
