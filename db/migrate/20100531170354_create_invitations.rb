class CreateInvitations < ActiveRecord::Migration
  def self.up
    create_table :invitations do |t|
      t.string :name
      t.belongs_to :language
      t.belongs_to :event

      t.timestamps
    end
  end

  def self.down
    drop_table :invitations
  end
end
