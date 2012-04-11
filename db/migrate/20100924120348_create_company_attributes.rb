class CreateCompanyAttributes < ActiveRecord::Migration
  def self.up
    create_table :company_attributes do |t|
      t.integer :company_id
      t.integer :attribute_id
      
      t.timestamps
    end
    CompanyAttribute.create_translation_table! :value=> :string
  end

  def self.down
    drop_table :company_attributes, :company_attribute_translations
  end
end
