class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.integer :country_id
      
      t.timestamps
    end
    Category.create_translation_table! :name=> :string, :description=> :string
  end

  def self.down
    drop_table :categories
    drop_table :category_translations
  end
end
