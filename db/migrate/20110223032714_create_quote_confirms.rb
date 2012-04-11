class CreateQuoteConfirms < ActiveRecord::Migration
  def self.up
    create_table :quote_confirms do |t|
      t.integer :user_id
      t.integer :company_id
      t.string :solicitude
      t.integer :amount
      t.float :price

      t.timestamps
    end
  end

  def self.down
    drop_table :quote_confirms
  end
end
