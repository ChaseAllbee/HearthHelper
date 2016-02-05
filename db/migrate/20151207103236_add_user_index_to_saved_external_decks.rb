class AddUserIndexToSavedExternalDecks < ActiveRecord::Migration
  def change
    add_index :saved_external_decks, :user_id
  end
end
