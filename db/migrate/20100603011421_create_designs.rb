class CreateDesigns < ActiveRecord::Migration
  def self.up
    create_table :designs do |t|
      t.belongs_to :event
      t.string :caption
      t.belongs_to :category

      t.timestamps
    end
  end

  def self.down
    drop_table :designs
  end
end
