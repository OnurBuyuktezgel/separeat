class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :user, null: false, foreign_key: true
      t.datetime :start_date
      t.datetime :end_date
      t.references :table, null: false, foreign_key: true
      t.integer :guests

      t.timestamps
    end
  end
end
