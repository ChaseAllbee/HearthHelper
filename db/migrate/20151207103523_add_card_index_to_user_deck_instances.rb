class AddCardIndexToUserDeckInstances < ActiveRecord::Migration
  def change
    add_index :user_deck_instances, :card_id
  end
end
