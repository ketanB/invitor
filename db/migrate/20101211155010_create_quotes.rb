class CreateQuotes < ActiveRecord::Migration
  def self.up
    create_table :quotes do |t|
      t.string :title
      t.integer :business_group_id
      t.text :description
      t.integer :zip
      t.integer :city_id
      t.integer :miles_way
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :quotes
  end
end
