class CreateCollectionCardInstances < ActiveRecord::Migration
  def change
    create_table :collection_card_instances do |t|
      t.integer :collection_id
      t.integer :card_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
