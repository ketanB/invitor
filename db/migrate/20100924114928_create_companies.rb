class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :phone
      t.string :fax
      t.integer :city_id
      t.integer :state_id
      t.string :zip
      t.integer :country_id
      t.string :website
      t.string :email
      t.integer :business_group_id
      t.integer :business_category_id
      t.string :latitude
      t.string :longitude
      t.string :longitude
      

      t.timestamps
    end
    Company.create_translation_table! :name=> :string, :street1=> :string, :street2=> :string, :city_str => :string, :state_str => :string,:detail=> :text 
  end

  def self.down
    drop_table :companies, :company_translations
  end
end
