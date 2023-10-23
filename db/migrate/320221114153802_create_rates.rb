class CreateRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.string "user_id"
      t.string "rate_unit"
      t.string "rate_per_unit"
      t.string "rate_currency"
      t.string "quantity"
      t.timestamps
    end
  end
end
