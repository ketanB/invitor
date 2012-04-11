class Guest < ActiveRecord::Base
  belongs_to :event
  belongs_to :contact
  belongs_to :invitation
  belongs_to :user
  validates :event_id, :presence => true, :uniqueness => {:scope => :contact_id}
  
  RESPONSE = {0=>'Not Replied', 1=> 'Yes',2=> 'May be', 3=> 'No'}

  def name
    if contact
      return (contact.full_name and contact.full_name.length > 1) ? contact.full_name : contact.email.split('@').first.humanize
    elsif user && user.full_name.length > 1
      return user.full_name
    else
      return ''
    end
  end

  def avatar
    'profileImg.png'
  end
end
