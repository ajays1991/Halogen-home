class CreateRules < ActiveRecord::Migration[5.1]
  def change
    create_table :rules do |t|
      t.integer :account_id
      t.integer :user_id
      t.jsonb :filters
      t.jsonb :scores
      t.jsonb :order
      t.string :type
      t.string :name
      t.boolean :is_delete

      t.timestamps
    end
  end
end
