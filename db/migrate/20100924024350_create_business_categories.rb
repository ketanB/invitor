class CreateBusinessCategories < ActiveRecord::Migration
  def self.up
    create_table :business_categories do |t|
      t.integer :business_group_id
      t.boolean :active, :default => true

      t.timestamps
    end
    BusinessCategory.create_translation_table! :title=> :string
  end

  def self.down
    drop_table :business_categories
  end
end
