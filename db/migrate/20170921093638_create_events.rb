class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.integer :account
      t.string :event
      t.string :type
      t.json :meta
      t.json :address
      t.json :identifier

      t.timestamps
    end
  end
end
