class RemoveActivationDigestFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :activation_digest, :string
  end
end
