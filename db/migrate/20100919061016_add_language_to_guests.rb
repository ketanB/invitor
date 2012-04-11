class AddLanguageToGuests < ActiveRecord::Migration
  def self.up
    add_column :guests, :language, :string, :default => 'en'
    add_column :guests, :invited, :boolean, :default => false
  end

  def self.down
    remove_column :guests, :language, :invited
  end
end
