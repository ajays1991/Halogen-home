class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.integer :account_id
      t.integer :user_id
      t.json :filters
      t.json :scores
      t.json :order
      t.string :type
      t.string :name
      t.boolean :is_delete

      t.timestamps
    end
  end
end
