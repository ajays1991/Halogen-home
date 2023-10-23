class CreateLanguage < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string "language"
      t.string "country"
      t.string "region"
      t.string "continent"
      t.timestamps
    end
  end
end