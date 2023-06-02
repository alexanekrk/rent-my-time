class AddApprovedToBookings < ActiveRecord::Migration[7.0]
  def change
    add_column :bookings, :approved, :boolean
    change_column_default :bookings, :approved, false
  end
end
