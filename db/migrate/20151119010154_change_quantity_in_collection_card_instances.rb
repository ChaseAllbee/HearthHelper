class ChangeQuantityInCollectionCardInstances < ActiveRecord::Migration
  def change
  	change_column :collection_card_instances, :quantity, :integer, :default => 0
  end
end
