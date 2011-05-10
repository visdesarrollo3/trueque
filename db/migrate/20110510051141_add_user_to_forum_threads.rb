class AddUserToForumThreads < ActiveRecord::Migration
  def self.up
    add_column :forum_threads, :user_id, :integer
  end

  def self.down
    remove_column :forum_threads, :user_id
  end
end
