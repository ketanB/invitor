class CreateFgUploads < ActiveRecord::Migration
  def self.up
    create_table :fg_uploads do |t|
      t.integer :user_id
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :fg_uploads
  end
end
