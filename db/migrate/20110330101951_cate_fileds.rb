class CateFileds < ActiveRecord::Migration
  def self.up
	add_column :categories, :country_id, :integer, :default=>226
  end

  def self.down
drop_column :categories, :country_id
  end
end
