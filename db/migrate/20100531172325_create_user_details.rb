class CreateUserDetails < ActiveRecord::Migration
  def self.up
    create_table :user_details do |t|
      t.belongs_to :user

      t.timestamps
    end
  end

  def self.down
    drop_table :user_details
  end
end
