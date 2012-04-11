class AddThemeImages < ActiveRecord::Migration
  def self.up
    add_column :themes, :bg_image_file_name,    :string
    add_column :themes, :bg_image_content_type, :string
    add_column :themes, :bg_image_file_size,    :integer
    add_column :themes, :bg_image_updated_at,   :datetime

    add_column :themes, :main_image_file_name,    :string
    add_column :themes, :main_image_content_type, :string
    add_column :themes, :main_image_file_size,    :integer
    add_column :themes, :main_image_updated_at,   :datetime
  end

  def self.down
    remove_column :themes, :bg_image_file_name
    remove_column :themes, :bg_image_content_type
    remove_column :themes, :bg_image_file_size
    remove_column :themes, :bg_image_updated_at
    
    remove_column :themes, :main_image_file_name
    remove_column :themes, :main_image_content_type
    remove_column :themes, :main_image_file_size
    remove_column :themes, :main_image_updated_at
  end

end
