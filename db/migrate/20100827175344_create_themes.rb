class CreateThemes < ActiveRecord::Migration
  def self.up
    create_table :themes do |t|
      t.string :name
      t.boolean :default

      t.timestamps
    end
    Theme.create_translation_table! :name=> :string
    create_table :categories_themes, :id => false do |t|
      t.integer :category_id
      t.integer :theme_id
    end
  end

  def self.down
    drop_table :themes
    drop_table :theme_translations
  end
end
