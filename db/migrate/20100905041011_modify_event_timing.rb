class ModifyEventTiming < ActiveRecord::Migration
  def self.up
    remove_column(:events, :date_and_time)
    add_column :events, :date, :date
    add_column :events, :time, :time
  end

  def self.down
    add_column :events, :date_and_time, :datetime
    remove_column :events, :date, :time
  end
end
