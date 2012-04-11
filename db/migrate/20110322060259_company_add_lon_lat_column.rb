class CompanyAddLonLatColumn < ActiveRecord::Migration
  def self.up
    create_table :search_companies do |t|
      t.integer :company_id
      t.text :key_words
      t.float :lng
      t.float :lat
      t.timestamps
    end
  end

  def self.down
    drop_table :search_companies
  end
end
