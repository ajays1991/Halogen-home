class AddLanguageToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :language_id, :string
  end
end
