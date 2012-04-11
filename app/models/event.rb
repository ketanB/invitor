# == Schema Info
# Schema version: 20100628151227
#
# Table name: events
#
#  id               :integer(4)      not null, primary key
#  user_id          :integer(4)
#  date_and_time    :string(255)
#  description      :string(255)
#  hosted_by        :string(255)
#  location_address :string(255)
#  location_details :string(255)
#  name             :string(255)
#  created_at       :datetime
#  updated_at       :datetime

class Event < ActiveRecord::Base
  translates :name, :hosted_by, :description, :location_name, :location_address
  #attr_accessor :country, :category
  belongs_to :user
  belongs_to :category
  has_one :design
  has_one :setting, :class_name => 'EventSetting'
  
  has_many :invitations
  has_many :comments
  has_many :guests
  has_many :videos
  has_many :assets, :class_name => 'EventAsset'
  RESPONSE = {0=>'Not Replied', 1=> 'Yes',2=> 'May be', 3=> 'No'}
  REMINDER_RESPONSE = {0=>'reminder_no_reply', 1=> 'reminder_yes',2=> 'reminder_maybe'}

  #validates :name , :description, :hosted_by, :date_and_time, :location_details, :location_address , :presence => true, :on => :update

  #accepts_nested_attributes_for :design, :setting

  #after_create :create_design, :create_setting

  #contact parameter should contain of ids in within array =>> contact = [1, 3, 4]
  def add_guest_to_invitation(params)
    return false unless params[:email] && params[:email].size > 0
    en_contacts = []
    es_contacts = []
    params[:name].each do |k,v|
      if params[:rbtn][k] == 'es'
        es_contact = Contact.create(:full_name =>params[:name][k], :email => params[:email][k], :tmp_user_id => self.id)
        es_contacts << es_contact.id if es_contact
      else
        en_contact = Contact.create(:full_name =>params[:name][k], :email => params[:email][k], :tmp_user_id => self.id)
        en_contacts << en_contact.id
      end
    end

    en_invitation = Invitation.find_or_create_by_event_id_and_name_and_locale(self.id, self.name, 'en')
    es_invitation = Invitation.find_or_create_by_event_id_and_name_and_locale(self.id, self.name, 'es')

    max_guest = setting.max_guests_num.to_i if setting.max_guests? && setting.max_guests_num.to_i >= 0

    en_contacts.each do |contact_id|
      break if max_guest && guests.count >= max_guest
      Guest.create(:event_id => self.id, :contact_id=> contact_id,:language=>'en', :invitation_id => en_invitation.id, :g_id=> rand(36**16).to_s(36))
    end

    es_contacts.each do |contact_id|
      break if max_guest && guests.count >= max_guest
      Guest.create(:event_id => self.id, :contact_id=> contact_id, :language=>'es', :invitation_id => es_invitation.id, :g_id=> rand(36**16).to_s(36))
    end
    
  end

  def create_invitation(lang_id)
    
  end

  def save_design(params)
    desgin = Design.where(:event_id=>self.id).first

    if desgin
      desgin.update_attributes(:event_id => self.id, :theme_id=>params[:theme_id], :bg_image_url => params[:bg_image_url], :fg_image_url => params[:fg_image_url])
    else
      Design.create(:event_id => self.id, :theme_id=>params[:theme_id], :bg_image_url => params[:bg_image_url], :fg_image_url => params[:fg_image_url])
    end
    
  end

  def fg_image_url
    if(design && design.fg_image_url.to_s > '')
      design.fg_image_url
    elsif(design && !design.theme.nil? && design.theme.main_image)
      design.theme.main_image.url
    elsif category && category.themes.size > 0 && category.themes.first.main_image
      category.themes.first.main_image.url
    else
      Theme.defaults.first.main_image.url if  Theme.defaults && Theme.defaults.first.main_image
    end
  end

  def bg_image_url
    if design && design.bg_image_url.to_s > ''
      design.bg_image_url
    elsif design && !design.theme.nil? && design.theme.bg_image
      design.theme.bg_image.url
    elsif category && category.themes.size > 0 && category.themes.first.bg_image
      category.themes.first.bg_image.url
    else
      Theme.defaults.first.bg_image.url if  Theme.defaults && Theme.defaults.first.bg_image
    end
  end

  def classified_guests
    guests_y = []
    guests_mb = []
    guests_n = []
    guests_nrp = []
    self.guests.each do |guest|
      case guest.response
      when 0
        guests_nrp << guest
      when 1
        guests_y << guest
      when 2
        guests_mb << guest
      when 3
        guests_n << guest
      end
    end
    {:guests_y => guests_y, :guests_mb=> guests_mb, :guests_n => guests_n, :guests_nrp=> guests_nrp}
  end

  def self.launch(event_id, invited_by)
    status = false
    #begin
    event = find(event_id)
    i_guests = event.guests.where(:event_host => false, :invited => false)
    i_guests.each do |guest|
      Mailer.send_invitation(guest,event, invited_by).deliver
      guest.update_attribute(:invited, true)
    end
    #status = true
    #rescue
    # status = false
    #end
    status
  end

  def send_reminder
    i_guests = guests.where(:event_host => false)
    i_guests.each do |guest|
      Mailer.event_reminder(guest,self).deliver if setting[Event::REMINDER_RESPONSE[guest.response]]
    end
  end

  def self.guest_responses(p_guests)
    yes = no = maybe = norep = 0
    p_guests.each do |guest|
      case guest.response
      when 0
        norep +=1
      when 1
        yes +=1
      when 2
        maybe +=1
      when 3
        no +=1
      end
    end
    {:yes => yes, :no => no, :maybe => maybe, :norep => norep}
  end
end