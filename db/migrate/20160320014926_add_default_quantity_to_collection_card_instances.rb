class AddDefaultQuantityToCollectionCardInstances < ActiveRecord::Migration
  def change
    change_column :collection_card_instances, :quantity, :integer, :default => 1
  end
end
