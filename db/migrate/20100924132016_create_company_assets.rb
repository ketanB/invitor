class CreateCompanyAssets < ActiveRecord::Migration
  def self.up
    create_table :company_assets do |t|
      t.integer :company_id
      t.string :photo_file_name
      t.string :photo_content_type
      t.integer :photo_file_size
      t.datetime :photo_updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :company_assets
  end
end
