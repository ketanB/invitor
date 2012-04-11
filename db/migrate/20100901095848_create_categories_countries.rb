class CreateCategoriesCountries < ActiveRecord::Migration
  def self.up
    create_table :categories_countries, :id => false do |t|
      t.integer :category_id
      t.integer :country_id
    end
    remove_column(:categories, :country_id)
  end

  def self.down
    drop_table(:categories_countries)
  end
end
