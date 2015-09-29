class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :card_set
      t.string :rarity
      t.integer :cost
      t.integer :attack
      t.integer :health
      t.string :image
      t.string :how_to_get

      t.timestamps null: false
    end
  end
end
