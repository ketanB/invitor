class AddActiveToCountries < ActiveRecord::Migration
  def self.up
    add_column :countries, :active, :boolean, :default => true
  end

  def self.down
    remove_column :countries, :active
  end
end
