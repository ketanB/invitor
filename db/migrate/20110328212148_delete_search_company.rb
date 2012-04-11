class DeleteSearchCompany < ActiveRecord::Migration
  def self.up
    execute "ALTER TABLE companies MODIFY longitude  FLOAT;"
    execute "ALTER TABLE companies MODIFY latitude  FLOAT;"
    execute "ALTER TABLE companies ADD COLUMN key_words TEXT;"
  end

  def self.down
    execute "ALTER TABLE companies MODIFY longitude VARCHAR(255);"
    execute "ALTER TABLE companies MODIFY latitude  VARCHAR(255);"
    execute "ALTER TABLE companies DROP COLUMN key_words;"
  end
end
