class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :from
      t.integer :to
      t.string :title
      t.text :description
      t.integer :parent
      t.boolean :is_new
      t.integer :csolicitude_id

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
