class AddGIdToComments < ActiveRecord::Migration
  def self.up
    add_column :comments, :guest_id, :integer
  end

  def self.down
    remove_column :comments, :guest_id
  end
end
