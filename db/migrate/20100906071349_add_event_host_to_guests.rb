class AddEventHostToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :event_host, :boolean, :default => false
    change_column :guests, :additional_guests, :integer, :default => 0
    change_column :guests, :send_daily_activity, :boolean, :default => false
    change_column :guests, :response, :integer, :default => 0
  end

  def self.down
    remove_column :guests, :event_host
  end
end
