# == Schema Info
# Schema version: 20100628151227
#
# Table name: invitations
#
#  id          :integer(4)      not null, primary key
#  event_id    :integer(4)
#  language_id :integer(4)
#  name        :string(255)
#  created_at  :datetime
#  updated_at  :datetime

class Invitation < ActiveRecord::Base
  belongs_to :language
  belongs_to :event
  #has_and_belongs_to_many :contacts
  
  def send_invitation_to_guests
    self.contacts.each do |contact|
      Mailer.send_invitation(contact.email).deliver
    end
  end
end