# == Schema Info
# Schema version: 20100628151227
#
# Table name: comments
#
#  id         :integer(4)      not null, primary key
#  event_id   :integer(4)
#  user_id    :integer(4)
#  comment    :string(255)
#  created_at :datetime
#  updated_at :datetime

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  belongs_to :guest
  has_one :reply, :class_name => 'Comment', :foreign_key => 'parent_id'

  def comment_by
    user ? user.full_name : guest && guest.name > '' ? guest.name : 'Annonymous'
  end
end