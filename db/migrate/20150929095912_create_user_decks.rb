class CreateUserDecks < ActiveRecord::Migration
  def change
    create_table :user_decks do |t|
      t.string :name
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
