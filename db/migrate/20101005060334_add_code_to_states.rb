class AddCodeToStates < ActiveRecord::Migration
  def self.up
    add_column :states, :code, :string
  end

  def self.down
    remove_column :states, :code
  end
end
