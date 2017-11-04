class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :photo_data
      t.string :name
      t.string :description
      t.decimal :selling_price, precision: 8, scale: 3
      t.decimal :renting_price, precision: 8, scale: 3
      t.integer :quantity
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
