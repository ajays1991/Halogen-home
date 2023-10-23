class Booking < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.date "date"
      t.time "time"
      t.string "student_id"
      t.string "tutor_id"
      t.string "link"
      t.string "channel"
      t.boolean "completed"
      t.timestamps
    end
  end
end
