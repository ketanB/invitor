class CreateEventTranslations < ActiveRecord::Migration
  def self.up
    Event.create_translation_table! :name=> :string, :hosted_by=> :string, :description=>:text, :location_name=> :string, :location_address=> :string
    remove_column(:events, :name,:hosted_by, :description, :location_details, :location_address)
  end

  def self.down
    drop_table :event_translations
    add_column :events, :name, :string
    add_column :events, :hosted_by, :string
    add_column :events, :description, :text
    add_column :events, :location_details, :string
    add_column :events, :location_address, :string
  end
end
