class AddCardIndexToCollectionCardInstances < ActiveRecord::Migration
  def change
    add_index :collection_card_instances, :card_id
  end
end
