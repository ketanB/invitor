class AddIndexOnCompaniesAndOthers < ActiveRecord::Migration
  def self.up
    add_index(:companies, [:zip, :city_id, :state_id])
    add_index(:companies, [:city_id, :rating, 	:reviews_count])
    add_index(:company_translations, [:name, :company_id, :locale])
    add_index(:city_translations, [:city_id, :locale])
    add_index(:city_translations, [:name, :city_id, :locale])
    add_index(:state_translations, [:state_id, :locale])
    add_index(:state_translations, [:name, :state_id, :locale])
    add_index(:companies_categories, [:company_id, :business_category_id], :unique => true)
  end

  def self.down
    remove_index(:companies, :column => [:zip, :city_id, :state_id])
    remove_index(:companies, :column => [:city_id, :rating, 	:reviews_count])
    remove_index(:company_translations, :column=> [:name,:company_id, :locale])
    remove_index(:city_translations, :column=> [:city_id, :locale])
    remove_index(:city_translations, :column=> [:name, :city_id, :locale])
    remove_index(:state_translations, :column=> [:state_id, :locale])
    remove_index(:state_translations, :column=> [:name, :state_id, :locale])
    remove_index(:companies_categories, :column => [:company_id, :business_category_id])
  end
end
