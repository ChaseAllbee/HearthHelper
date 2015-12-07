class AddCollIndexToCollectionCardInstances < ActiveRecord::Migration
  def change
    add_index :collection_card_instances, :collection_id
  end
end
