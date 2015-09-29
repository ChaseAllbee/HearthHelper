class CreateExternalDecks < ActiveRecord::Migration
  def change
    create_table :external_decks do |t|
      t.string :deck_name

      t.timestamps null: false
    end
  end
end
