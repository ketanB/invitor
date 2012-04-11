# == Schema Info
# Schema version: 20100628151227
#
# Table name: contacts
#
#  id          :integer(4)      not null, primary key
#  user_id     :integer(4)
#  description :string(255)
#  email       :string(255)
#  full_name   :string(255)
#  phone       :string(255)
#  created_at  :datetime
#  updated_at  :datetime

class Contact < ActiveRecord::Base
  belongs_to :user
  #has_and_belongs_to_many :invitations, :delete_sql => 'DELETE FROM contacts_invitations WHERE contact_id = #{id}'
  belongs_to :contact_group, :counter_cache => true
  attr_accessor :password, :provider
  has_many :guests, :dependent => :destroy

  validates :email, :presence => true
  validates :email, :uniqueness => {:scope => :tmp_user_id, :if => :tmp_user_id?}
  validates :email,  :uniqueness => {:scope => :user_id, :if => :user_id?}

  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
end