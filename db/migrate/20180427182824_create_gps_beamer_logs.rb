class CreateGpsBeamerLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :gps_beamer_logs do |t|
      t.string :latitude
      t.string :longitude
      t.references :flight, foriegn_key: true      
      t.json :metadata
      t.timestamps
    end
  end
end
