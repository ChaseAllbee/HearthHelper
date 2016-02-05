class AddNameIndexToCards < ActiveRecord::Migration
  def change
    add_index :cards, :name
  end
end
