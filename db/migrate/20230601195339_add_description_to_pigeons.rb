class AddDescriptionToPigeons < ActiveRecord::Migration[7.0]
  def change
    add_column :pigeons, :description, :string
  end
end
