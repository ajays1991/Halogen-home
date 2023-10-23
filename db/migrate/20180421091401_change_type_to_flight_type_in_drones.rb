class ChangeTypeToFlightTypeInDrones < ActiveRecord::Migration[5.1]
  def change
  	rename_column :drones, :type, :flight_type
  	rename_column :drones, :mac_addresss, :mac_address
  end
end
