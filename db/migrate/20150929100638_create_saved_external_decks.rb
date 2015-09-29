class CreateSavedExternalDecks < ActiveRecord::Migration
  def change
    create_table :saved_external_decks do |t|
      t.integer :user_id
      t.integer :external_deck_id

      t.timestamps null: false
    end
  end
end
