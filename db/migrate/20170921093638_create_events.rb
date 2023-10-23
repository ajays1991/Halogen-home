class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :account
      t.string :event
      t.string :type
      t.jsonb :meta
      t.jsonb :address
      t.jsonb :identifier

      t.timestamps
    end
  end
end
