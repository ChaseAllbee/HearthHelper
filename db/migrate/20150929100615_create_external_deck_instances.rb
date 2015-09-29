class CreateExternalDeckInstances < ActiveRecord::Migration
  def change
    create_table :external_deck_instances do |t|
      t.integer :card_id
      t.integer :external_deck_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
