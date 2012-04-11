class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.belongs_to :user
      t.string :name
      t.string :description
      t.string :hosted_by
      t.string :date_and_time
      t.string :location_details
      t.string :location_address

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
