class ChangeApprovedDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :bookings, :approved, nil
  end
end
