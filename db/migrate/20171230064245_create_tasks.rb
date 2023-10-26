class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.integer :assignee_id
      t.string :title
      t.text :description
      t.json :metadata
      t.date :completed_on

      t.timestamps
    end
  end
end
