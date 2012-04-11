class CreateCities < ActiveRecord::Migration
  def self.up
    create_table :cities do |t|
      t.integer :country_id
      t.boolean :active, :default => true

      t.timestamps
    end
    City.create_translation_table! :name=> :string
  end

  def self.down
    drop_table :cities
  end
end
