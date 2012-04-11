class AddRatingToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :rating, :float, :default => 0.0
    add_column :companies, :reviews_count, :integer, :default => 0
  end

  def self.down
    remove_column :companies, :reviews_count
    remove_column :companies, :rating
  end
end
