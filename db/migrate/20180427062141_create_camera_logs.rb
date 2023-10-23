class CreateCameraLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :camera_logs do |t|
      t.string :name
      t.references :flight, foriegn_key: true
      t.references :user, foriegn_key: true
      t.jsonb :camera_specifications
      t.jsonb :metadata
      t.timestamps
    end
  end
end
