class AddUserToUserDecks < ActiveRecord::Migration
  def change
    add_index :user_decks, :user_id
  end
end
