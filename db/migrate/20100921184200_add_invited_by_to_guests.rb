class AddInvitedByToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :invited_by, :integer
  end

  def self.down
    remove_column :guests, :invited_by
  end
end
