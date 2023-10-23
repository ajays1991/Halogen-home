class Account < ActiveRecord::Migration[5.1]
  def change
  	create_table :accounts do |t|
      ## Database authenticatable
      t.string :name, null: false
      t.string :country, null: false
      t.integer  :students_count, default: 0, null: false
      t.integer :owner_id, null: false
      t.timestamps null: false
    end
    add_index :accounts, :name, unique: true
  end
end
