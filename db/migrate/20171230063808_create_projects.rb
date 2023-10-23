class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.integer :status_id
      t.integer :admin_id

      t.timestamps
    end
  end
end
