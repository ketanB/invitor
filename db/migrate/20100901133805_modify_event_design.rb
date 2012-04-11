class ModifyEventDesign < ActiveRecord::Migration
  def self.up
    rename_column :designs, :category_id, :theme_id
    add_column :designs, :fg_image_url, :string
    add_column :designs, :bg_image_url, :string
    add_column :events, :category_id, :integer
    add_column :events, :time_zone, :string
  end

  def self.down
    rename_column :designs, :theme_id, :category_id
    remove_column :designs, :fg_image_url
    remove_column :designs, :bg_image_url
    remove_column :events, :category_id, :time_zone
  end
end
