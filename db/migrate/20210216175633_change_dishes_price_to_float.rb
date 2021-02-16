class ChangeDishesPriceToFloat < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      change_table :dishes do |t|
        dir.up   { t.change :price, :float }
        dir.down { t.change :price, :integer }
      end
    end
  end
end
