class RemoveHowToGetFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :how_to_get, :string
  end
end
