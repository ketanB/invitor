class InvitationTracking < ActiveRecord::Migration
  def self.up
    add_column :guests, :email_viewed, :boolean, :default=>false
    add_column :guests, :email_viewed_at, :datetime
    add_column :guests, :invited_at, :datetime
  end

  def self.down
    remove_column :guests, :email_viewed
    remove_column :guests, :email_viewed_at
    add_column :guests, :invited_at
  end
end
