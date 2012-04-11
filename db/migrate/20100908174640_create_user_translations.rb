class CreateUserTranslations < ActiveRecord::Migration
  def self.up
    drop_table :user_details
    User.create_translation_table! :firstname=> :string, :lastname=> :string
  end

  def self.down
    drop_table :user_translations
    create_table :user_details do |t|
      t.belongs_to :user

      t.timestamps
    end
  end

end
