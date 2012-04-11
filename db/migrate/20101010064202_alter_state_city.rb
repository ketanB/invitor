class AlterStateCity < ActiveRecord::Migration
  def self.up
    add_column :cities, :state_id, :integer

    State.all.each do |state|
      city = City.find(state.city_id) rescue nil
      if city
        city.update_attribute(:state_id, state.id)
      end
    end
    remove_column(:states, :city_id)
  end

  def self.down
    add_column :states, :city_id, :integer
    remove_column :cities, :state_id
  end
end
