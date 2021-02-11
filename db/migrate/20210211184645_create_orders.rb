class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :visit, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
