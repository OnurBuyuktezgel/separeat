class CreateDishes < ActiveRecord::Migration[6.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.references :restaurant, null: false, foreign_key: true
      t.boolean :todays_special
      t.text :description
      t.string :category
      t.integer :price

      t.timestamps
    end
  end
end
