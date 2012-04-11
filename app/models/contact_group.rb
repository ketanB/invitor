class ContactGroup < ActiveRecord::Base
  translates :name
  has_many :contacts, :dependent => :destroy
  belongs_to :user
  validates :name, :presence => true
end