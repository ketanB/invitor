class CreateContactGroups < ActiveRecord::Migration
  def self.up
    create_table :contact_groups do |t|
      t.integer :user_id
      t.integer :contacts_count, :default => 0

      t.timestamps
    end
    ContactGroup.create_translation_table! :name=> :string
    add_column :contacts, :contact_group_id, :integer
  end

  def self.down
    drop_table :contact_groups, :contact_group_translations
    remove_column :contacts, :contact_group_id
  end
end
