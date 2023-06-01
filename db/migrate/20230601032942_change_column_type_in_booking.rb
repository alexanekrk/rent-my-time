class ChangeColumnTypeInBooking < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :start_date, :date
  end
end
