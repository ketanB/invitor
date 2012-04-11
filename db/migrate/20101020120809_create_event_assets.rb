class CreateEventAssets < ActiveRecord::Migration
  def self.up
    create_table :event_assets do |t|
      t.integer :event_id
      t.integer :uploaded_by
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.timestamps
    end
    add_index(:event_assets, :event_id)
  end

  def self.down
    drop_table :event_assets
  end
end
