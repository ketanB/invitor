class ModifyEventSettings < ActiveRecord::Migration
  def self.up
    add_column :event_settings, :public_event, :boolean
    add_column :event_settings, :allow_guest_maybe, :boolean
    add_column :event_settings, :max_guests, :boolean
    add_column :event_settings, :max_guests_num, :integer
    add_column :event_settings, :reminder_days, :integer
    add_column :event_settings, :event_reminder, :boolean
    add_column :event_settings, :reminder_yes, :boolean
    add_column :event_settings, :reminder_maybe, :boolean
    add_column :event_settings, :reminder_no_reply, :boolean
    
  end

  def self.down
    remove_column :event_settings, :public_event
    remove_column :event_settings, :allow_guest_maybe
    remove_column :event_settings, :max_guests
    remove_column :event_settings, :max_guests_num
    remove_column :event_settings, :reminder_days
    remove_column :event_settings, :event_reminder
    remove_column :event_settings, :reminder_yes
    remove_column :event_settings, :reminder_maybe
    remove_column :event_settings, :reminder_no_reply
    
  end
end
