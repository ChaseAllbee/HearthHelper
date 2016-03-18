class RemoveResetDigestFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :reset_digest, :string
  end
end
