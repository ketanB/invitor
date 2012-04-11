class CreateCompaniesCategories < ActiveRecord::Migration
  def self.up
    create_table(:companies_categories, :id=>false) do |t|
      t.integer :company_id
      t.integer :business_category_id
    end
    Company.all.each do |company|
      company.category_ids = [company.business_category_id]
      company.save
    end
    remove_column(:companies, :business_category_id)
  end

  def self.down
    drop_table(:companies_categories)
    add_column :companies, :business_category_id
  end
end
