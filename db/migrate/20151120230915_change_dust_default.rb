class ChangeDustDefault < ActiveRecord::Migration
  def change
  	change_column :collections, :dust, :integer, :default => 0
  end
end
