class CreateGuests < ActiveRecord::Migration
  def self.up
    create_table :guests do |t|
      t.integer :event_id
      t.integer :contact_id
      t.integer :invitation_id
      t.integer :user_id
      t.string :response
      t.string :g_id

      t.timestamps
    end
  end

  def self.down
    drop_table :guests
  end
end
