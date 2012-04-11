class CreateCompanyContacts < ActiveRecord::Migration
  def self.up
    create_table :company_contacts do |t|
      t.integer :compay_id
      t.integer :user_id
    end
  end

  def self.down
    drop_table :company_contacts
  end
end
