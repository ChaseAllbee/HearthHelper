class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :user_id
      t.integer :card_id
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
