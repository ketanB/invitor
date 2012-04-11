class CompanyAddDeltaColumn < ActiveRecord::Migration
  def self.up
    add_column :companies, :delta, :boolean, :default => true, :null => false
    drop_table :search_companies
  end

  def self.down
    remove_column :companies, :delta
    create_table :search_companies do |t|
      t.integer :company_id
      t.text :key_words
      t.float :lng
      t.float :lat
      t.timestamps
    end
  end
end
