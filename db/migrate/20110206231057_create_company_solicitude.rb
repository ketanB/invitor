class CreateCompanySolicitude < ActiveRecord::Migration
  def self.up
    create_table :company_solicitudes do |t|
      t.integer :solicitude_id
      t.integer :company_id
      t.boolean :is_new

      t.timestamps
  end

  def self.down
    drop_table :company_solicitudes
  end
end
end