class RemoveResetSentAtFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :reset_sent_at, :datetime
  end
end
