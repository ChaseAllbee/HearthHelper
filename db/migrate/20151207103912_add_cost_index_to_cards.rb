class AddCostIndexToCards < ActiveRecord::Migration
  def change
    add_index :cards, :cost
  end
end
