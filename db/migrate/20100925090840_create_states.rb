class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.integer :city_id
      t.integer :country_id
      t.boolean :active, :default => true

      t.timestamps
    end
    State.create_translation_table! :name=> :string
  end

  def self.down
    drop_table :states
  end
end
