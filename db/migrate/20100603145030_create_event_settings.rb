class CreateEventSettings < ActiveRecord::Migration
  def self.up
    create_table :event_settings do |t|
      t.belongs_to :event
      t.boolean :allow_pictures
      t.boolean :allow_videos
      t.boolean :allow_guest_to_invite_friends
      t.boolean :allow_guests_to_bring_people
      t.integer :max_people_to_bring
      t.boolean :display_guest_list
      t.string :cap_attendees_at
      t.boolean :show_comment_board
      t.boolean :show_profile_pictures

      t.timestamps
    end
  end

  def self.down
    drop_table :event_settings
  end
end
