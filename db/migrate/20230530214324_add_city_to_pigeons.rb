class AddCityToPigeons < ActiveRecord::Migration[7.0]
  def change
    add_column :pigeons, :city, :string
  end
end
