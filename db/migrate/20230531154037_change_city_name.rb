class ChangeCityName < ActiveRecord::Migration[7.0]
  def change
    rename_column :pigeons, :city, :address
  end
end
