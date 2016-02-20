class AddTierToExternalDeck < ActiveRecord::Migration
  def change
    add_column :external_decks, :tier, :integer
  end
end
