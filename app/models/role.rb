# == Schema Info
# Schema version: 20100628151227
#
# Table name: roles
#
#  id          :integer(4)      not null, primary key
#  description :string(255)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime

class Role < ActiveRecord::Base
  has_many :users
end