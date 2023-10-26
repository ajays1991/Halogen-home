class CreateAssignmentTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :assignment_types do |t|
      t.string :name
      t.string :account_id
      t.integer :user_id
      t.json :metadata

      t.timestamps
    end
  end
end
