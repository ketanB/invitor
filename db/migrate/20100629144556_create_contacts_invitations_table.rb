class CreateContactsInvitationsTable < ActiveRecord::Migration
  def self.up
    create_table :contacts_invitations, :id => false do |t|
      t.integer :contact_id
      t.integer :invitation_id
    end
  end

  def self.down
    drop_table :contacts_invitations
  end
end
