class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :code

      t.timestamps
    end
    Country.create_translation_table! :name => :string
  end

  def self.down
    drop_table :countries
    drop_table :country_translations
  end
end
