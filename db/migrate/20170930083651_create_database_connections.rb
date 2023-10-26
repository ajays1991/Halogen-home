class CreateDatabaseConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :database_connections do |t|
      t.string :name
      t.string :provide
      t.string :username
      t.string :password
      t.string :access_token
      t.json :metadata
      t.integer :account_id

      t.timestamps
    end
  end
end
