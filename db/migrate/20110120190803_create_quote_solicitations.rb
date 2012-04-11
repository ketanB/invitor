class CreateQuoteSolicitations < ActiveRecord::Migration
  def self.up
    create_table :quote_solicitations do |t|
      t.integer :quote_id
      t.text :solicitude

      t.timestamps
    end
  end

  def self.down
    drop_table :quote_solicitations
  end
end
