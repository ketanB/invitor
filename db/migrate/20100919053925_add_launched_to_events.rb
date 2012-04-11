class AddLaunchedToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :launched, :boolean, :default => false
  end

  def self.down
    remove_column :events, :launched
  end
end
