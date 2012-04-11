class AddEmailHashToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :email_hash, :string
  end

  def self.down
    remove_column :users, :email_hash
  end
end
