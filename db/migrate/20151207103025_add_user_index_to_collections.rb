class AddUserIndexToCollections < ActiveRecord::Migration
  def change
    add_index :collections, :user_id
  end
end
