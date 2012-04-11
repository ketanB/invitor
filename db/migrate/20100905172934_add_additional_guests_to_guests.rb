class AddAdditionalGuestsToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :additional_guests, :integer
    add_column :guests, :send_daily_activity, :boolean
  end

  def self.down
    remove_column :guests, :additional_guests, :send_daily_activity
  end
end
