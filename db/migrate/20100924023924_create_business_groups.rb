class CreateBusinessGroups < ActiveRecord::Migration
  def self.up
    create_table :business_groups do |t|
     
      t.boolean :active, :default => true

      t.timestamps
    end
    BusinessGroup.create_translation_table! :title=> :string
  end

  def self.down
    drop_table :business_groups, :business_group_translations
  end
end
