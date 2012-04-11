class AddMoreIndices < ActiveRecord::Migration
  def self.up
    add_index :taggings, :taggable_id
    add_index :taggings, [:tag_id, :taggable_id, :taggable_type], :name => "index_taggings_on_ttt", :unique => true
    add_index :tags, [:name], :name => 'index_tags_on_name', :unique => true
    add_index :company_translations, :name

  end

  def self.down
    remove_index :taggings, :column => :taggable_id
    remove_index :taggings, :index_taggings_on_ttt
    remove_index :tags, :index_tags_on_name
    remove_index :company_translations, :column => :name
  end
end
