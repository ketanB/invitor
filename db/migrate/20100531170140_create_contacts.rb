class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :user_id
      t.string  :full_name
      t.string  :email
      t.string  :phone
      t.string  :description

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
