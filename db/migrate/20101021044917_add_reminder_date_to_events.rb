class AddReminderDateToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :reminder_date, :date
  end

  def self.down
    remove_column :events, :reminder_date
  end
end
