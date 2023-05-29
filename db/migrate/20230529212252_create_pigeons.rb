class CreatePigeons < ActiveRecord::Migration[7.0]
  def change
    create_table :pigeons do |t|
      t.string :name
      t.string :color
      t.integer :price
      t.integer :age
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
