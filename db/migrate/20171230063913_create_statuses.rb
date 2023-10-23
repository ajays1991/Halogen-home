class CreateStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :statuses do |t|
      t.integer :account_id
      t.string :label
      t.integer :user_id

      t.timestamps
    end
  end
end
