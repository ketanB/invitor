class AddQuotes < ActiveRecord::Migration
  def self.up
    add_column :quotes, :id_event, :integer
  end

  def self.down
    remove_column :quotes, :id_event
  end
end
