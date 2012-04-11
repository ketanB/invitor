class AddMapInfoToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :map_info, :string
    add_column :companies, :hours, :string
  end

  def self.down
    remove_column :companies, :map_info, :hours
  end
end
