class AddNameToTables < ActiveRecord::Migration[6.0]
  def change
    add_column :tables, :name, :string
  end
end
