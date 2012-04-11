class ModifyQuotes < ActiveRecord::Migration
  def self.up
    rename_column :quotes, :zip, :state_id
  end

  def self.down
    rename_column :quotes, :state_id, :zip
  end
end
