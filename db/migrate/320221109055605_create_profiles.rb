class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :user_id
      t.string :per_hour_rate
      t.string :per_hour_rate_currency
      t.boolean :video
      t.boolean :chat
      t.boolean :call
      t.text :description
      t.string :phone_number
      t.string :city
      t.string :country
      t.integer :rating
      t.timestamps
    end
  end
end
