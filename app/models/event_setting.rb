# == Schema Info
# Schema version: 20100628151227
#
# Table name: event_settings
#
#  id                            :integer(4)      not null, primary key
#  event_id                      :integer(4)
#  allow_guest_to_invite_friends :boolean(1)
#  allow_guests_to_bring_people  :boolean(1)
#  allow_pictures                :boolean(1)
#  allow_videos                  :boolean(1)
#  display_guest_list            :boolean(1)
#  max_people_to_bring           :boolean(1)
#  show_comment_board            :boolean(1)
#  show_profile_pictures         :boolean(1)
#  cap_attendees_at              :string(255)
#  created_at                    :datetime
#  updated_at                    :datetime

class EventSetting < ActiveRecord::Base
  belongs_to :event
end