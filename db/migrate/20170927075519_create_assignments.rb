class CreateAssignments < ActiveRecord::Migration[5.1]
  def change
    create_table :assignments do |t|
      t.string :name
      t.integer :account_id
      t.integer :assignment_type_id
      t.integer :file_id
      t.jsonb :metadata

      t.timestamps
    end
  end
end
