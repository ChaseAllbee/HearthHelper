class AddUserDeckIndexToUserDeckInstances < ActiveRecord::Migration
  def change
    add_index :user_deck_instances, :user_deck_id
  end
end
