class CreateCompaniesUserInfos < ActiveRecord::Migration
  def self.up
    create_table :companies_user_infos do |t|

      
      t.string :name
      t.string :street1
      t.string :street2
      t.string :phone
      t.string :fax
      t.integer :city_id
      t.integer :state_id
      t.string :zip
      t.integer :country_id
      t.string :website
      t.string :email
      t.text   :detail
      t.string :email
      t.boolean :is_closed
      t.boolean :is_owner
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :companies_user_infos
  end
end
