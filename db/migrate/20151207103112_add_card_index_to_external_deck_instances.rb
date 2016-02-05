class AddCardIndexToExternalDeckInstances < ActiveRecord::Migration
  def change
    add_index :external_deck_instances, :card_id
  end
end
