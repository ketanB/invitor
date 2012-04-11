class CreateUserCompanies < ActiveRecord::Migration
  def self.up
    create_table :user_companies do |t|
      t.integer :user_id
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_companies
  end
end
