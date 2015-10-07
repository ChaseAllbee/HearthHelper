class ChangeExternalDeckColumnName < ActiveRecord::Migration
  def change
    rename_column :external_decks, :deck_name, :name
  end
end
