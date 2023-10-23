class AddToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :meeting_id, :string
    add_column :bookings, :user_id, :string
    add_column :bookings, :region, :string
    add_column :bookings, :video_id, :string
  end
end
