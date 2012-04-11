class GuestAdditionalFields < ActiveRecord::Migration
  def self.up
	add_column :guests, :no_of_people_to_bring, :integer, :default=>0
  end

  def self.down
	remove_column :guests, :no_of_people_to_bring
  end
end
