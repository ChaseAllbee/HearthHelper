class AddDetailsToCards < ActiveRecord::Migration
 def self.up
    add_column :cards, :card_type, :string
    add_column :cards, :card_class, :string
  end

  def self.down
  end
end
