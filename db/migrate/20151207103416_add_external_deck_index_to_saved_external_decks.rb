class AddExternalDeckIndexToSavedExternalDecks < ActiveRecord::Migration
  def change
    add_index :saved_external_decks, :external_deck_id
  end
end
