class ChangeConnectionAttributes < ActiveRecord::Migration[6.1]
  def change
    rename_column :connections, :mentor_id, :followed_id
    rename_column :connections, :mentee_id, :follower_id
 end
end
