class DefaultValuesForEventSettings < ActiveRecord::Migration
  def self.up
    change_column :event_settings, :allow_pictures, :boolean, :default=>true
    change_column :event_settings, :allow_videos, :boolean, :default=>true
    change_column :event_settings, :allow_guest_to_invite_friends, :boolean, :default=>true
    change_column :event_settings, :allow_guests_to_bring_people, :boolean, :default=>true
    change_column :event_settings, :display_guest_list, :boolean, :default=>true
    change_column :event_settings, :show_comment_board, :boolean, :default=>true

    change_column :event_settings, :show_comment_board, :boolean, :default=>true
    change_column :event_settings, :show_profile_pictures, :boolean, :default=>true
    change_column :event_settings, :public_event, :boolean, :default=>true

    change_column :event_settings, :allow_guest_maybe, :boolean, :default=>true
    change_column :event_settings, :max_guests, :boolean, :default=>true
    change_column :event_settings, :event_reminder, :boolean, :default=>true

    change_column :event_settings, :reminder_yes, :boolean, :default=>true
    change_column :event_settings, :reminder_maybe, :boolean, :default=>true
    change_column :event_settings, :reminder_no_reply, :boolean, :default=>true

  end

  def self.down
  end
end
