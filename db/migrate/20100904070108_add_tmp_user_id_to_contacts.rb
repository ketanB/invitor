class AddTmpUserIdToContacts < ActiveRecord::Migration
  def self.up
    add_column :contacts, :tmp_user_id, :integer
  end

  def self.down
    remove_column :contacts, :tmp_user_id
  end
end
