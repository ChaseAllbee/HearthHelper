class AddIndexToSavedExternalDecks < ActiveRecord::Migration
  def change
    add_index :saved_external_decks, [:user_id, :external_deck_id], unique: true
  end
end
