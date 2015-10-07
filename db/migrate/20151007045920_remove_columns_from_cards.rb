class RemoveColumnsFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :type
    remove_column :cards, :class
  end
end
