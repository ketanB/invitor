class ModifyInvitations < ActiveRecord::Migration
  def self.up
    remove_column(:invitations, :language_id)
    add_column :invitations, :locale, :string
  end

  def self.down
    add_column(:invitations, :language_id, :integer)
    remove_column :invitations, :locale
  end
end
