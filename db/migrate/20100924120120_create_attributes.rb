class CreateAttributes < ActiveRecord::Migration
  def self.up
    create_table :attributes do |t|
      t.boolean :active

      t.timestamps
    end
    Attribute.create_translation_table! :title => :string
  end

  def self.down
    drop_table :attributes, :attribute_translations
  end
end
