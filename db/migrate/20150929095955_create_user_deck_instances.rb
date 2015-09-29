class CreateUserDeckInstances < ActiveRecord::Migration
  def change
    create_table :user_deck_instances do |t|
      t.integer :card_id
      t.integer :user_deck_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
