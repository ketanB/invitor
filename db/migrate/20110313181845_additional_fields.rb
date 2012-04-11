class AdditionalFields < ActiveRecord::Migration
  def self.up
    add_column :guests, :invited_by_guest_g_id, :integer
  end

  def self.down
    remove_column :guests, :invited_by_guest_g_id
  end
end
