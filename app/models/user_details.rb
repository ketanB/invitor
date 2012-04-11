# == Schema Info
# Schema version: 20100628151227
#
# Table name: user_details
#
#  id         :integer(4)      not null, primary key
#  user_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime

class UserDetails < ActiveRecord::Base
  belongs_to :user
end