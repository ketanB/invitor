# == Schema Info
# Schema version: 20100628151227
#
# Table name: designs
#
#  id          :integer(4)      not null, primary key
#  category_id :integer(4)
#  event_id    :integer(4)
#  caption     :string(255)
#  created_at  :datetime
#  updated_at  :datetime

class Design < ActiveRecord::Base
  belongs_to :event
  belongs_to :theme
end