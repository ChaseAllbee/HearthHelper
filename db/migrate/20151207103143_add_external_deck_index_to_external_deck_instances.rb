class AddExternalDeckIndexToExternalDeckInstances < ActiveRecord::Migration
  def change
    add_index :external_deck_instances, :external_deck_id
  end
end
