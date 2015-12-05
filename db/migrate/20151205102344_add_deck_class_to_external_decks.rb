class AddDeckClassToExternalDecks < ActiveRecord::Migration
  def change
    add_column :external_decks, :deck_class, :string
  end
end
